package com.dogwalker.controller;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dogwalker.dao.BoardDao;
import com.dogwalker.dao.BoardfreeDao;
import com.dogwalker.dao.BoarddogDao;
import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;
import com.dogwalker.service.BoardService;
import com.dogwalker.service.BoardfreeService;
import com.dogwalker.service.BoarddogService;
import com.dogwalker.util.FileUtil;
import com.dogwalker.util.PagingUtil;
import com.dogwalker.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/adminNoticePage")
    public String adminNoticePage( 
    		   @RequestParam(value="pageNum",defaultValue="1") int currentPage, //페이지번호
    		   @RequestParam(value="keyField",defaultValue="") String keyField, //검색분야
    		   @RequestParam(value="keyWord",defaultValue="") String keyWord,
    		   Model model) {
    	  Map<String,Object> map=new HashMap<String,Object>();
		  map.put("keyField", keyField);
		  map.put("keyWord",keyWord);
		  int count=boardService.getRowCount(map);
			 System.out.println("ListController클래스의 count=>"+count);
			 //페이징 처리(1.현재페이지 2.총레코드수 3.페이지당 게시물수 4.블럭당 페이지수 5.요청명령어지정
			 PagingUtil page=new PagingUtil(currentPage,count,3,3,"adminNoticePage.do");
			 //start=>페이지당 맨 첫번째 나오는 게시물번호 ,end->마지막 게시물번호
			 map.put("start", page.getStartCount());//<->map.get("start")=>#{start}
			 map.put("end",  page.getEndCount());//<->map.get("end")=>#{end}
    	
		List<BoardVO> noticeList=null;	 
		if(count > 0) {
           noticeList = boardService.list(map);
           System.out.println("AdminBoardController의 noticeList=>"+noticeList);//null?
		}else {
		   noticeList=Collections.EMPTY_LIST;//0 적용
		}
		model.addAttribute("count", count);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingHtml",page.getPagingHtml());
		
        return "admin/adminNoticePage"; // .jsp 확장자를 제외한 뷰 이름만 사용
    }
    
    
    
    @RequestMapping("/admin_NotWrite") // GET 요청에 대해 처리
    public String writeNoticePage() {
        return "admin/admin_NotWrite"; // writeNoticePage.jsp로 forward
    }
    
    @PostMapping("/admin_NotWrite") // POST 요청에 대해 처리
    public String submitWriteNoticePage(BoardVO board) {
        // 게시글 등록 로직을 추가하고, 등록 후에 게시판 목록 페이지로 리다이렉트
        boardService.insert(board);     
        return "redirect:/admin/adminNoticePage"; // 등록 후 목록 페이지로 리다이렉트
    }
    /*
    @GetMapping("/goToList")
    public String goToAdminNoticePage(Model model) {
        // 필요한 로직을 추가하여 공지사항 목록을 가져오고 모델에 담아둔다.
        List<> noticeList = boardService.selectAll();
        model.addAttribute("noticeList", noticeList);

        return "admin/adminNoticePage"; // adminNoticePage.jsp로 forward
    } */
    

    @GetMapping("/admin_NotMod/{seq}") //
    public String adminNoticeMod(@PathVariable int seq, Model model) {
        BoardVO notice = boardService.selectBoard(seq);
        model.addAttribute("notice", notice);
        return "admin_NotMod"; // admin_NotMod.jsp로 forward
    }
    
    @GetMapping("/admin_NotView")
    public String adminNoticeView(Model model) {
		/*
		 * List<> noticeList = boardService.selectAll();
		 * model.addAttribute("noticeList", noticeList); return "admin_NotView"; //
		 * admin_NotView.jsp로 forward
		 */   
    	return"";
    }
    
//보이는거
  //로그객체 생성문
  	private static final Logger log = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
  	
  	@Autowired
	private BoardDao boardDao;//자동적으로 Setter Methdo호출X (의존성객체 넣어줌)
	
  	
    @RequestMapping("NotView")
	public ModelAndView process(@RequestParam("seq") int seq) {
		//int seq=Integer.parseInt(request.getParameter("seq"));
		if(log.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
			log.debug("seq=>"+seq);
		}
		//1.조회수 증가
		boardDao.updateHit(seq);
		BoardVO board=boardDao.selectBoard(seq);
		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>
		board.setContent(StringUtil.parseBr(board.getContent()));//지금은 사용X
		/*
		ModelAndView mav=new ModelAndView("boardView");
		mav.addObject("board",board);//${board}
		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
		return new ModelAndView("admin/admin_NotView","board",board);
	}
	
	//글상세보기와 연관(다운로드)
	@RequestMapping("/file.do")
	public ModelAndView download(@RequestParam("filename") String filename) {
		//1.다운로드 받을 파일의 위치와 이름을 알아야 된다.
		File downloadFile=new File(FileUtil.UPLOAD_PATH+"/"+filename);
		//2.스프링에서 다운로드 받는 뷰를 따로 작성->AbstractView를 상속받아서 작성
		//1) 다운로드받을 뷰객체 2) 모델객체명(키명)  3)전달할값(다운로드 받을 파일명)
		//1) 이동할 페이지 X (jsp페이지 X)
		return new ModelAndView("downloadView","downloadFile",downloadFile);
	}
//지우는거
	
	
	@RequestMapping(value="delete21")
	public String submit(@RequestParam("seq") Integer seq) {
		System.out.println("seq=>");
	    boardService.delete(seq);
	    return "redirect:/admin/adminNoticePage";
	}

	
//2번
	
    @Autowired
    private BoardfreeService boardfreeService; // BoardService2로 변경

    @GetMapping("/adminPage")
    public String adminPage2(
            @RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
            @RequestParam(value = "keyField", defaultValue = "") String keyField,
            @RequestParam(value = "keyWord", defaultValue = "") String keyWord,
            Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("keyField", keyField);
        map.put("keyWord", keyWord);
        int count = boardfreeService.getRowCount(map);

        PagingUtil page = new PagingUtil(currentPage, count, 3, 3, "adminPage.do");
        map.put("start", page.getStartCount());
        map.put("end", page.getEndCount());

        List<BoardfreeVO> noticeList2 = null;
        if (count > 0) {
            noticeList2 = boardfreeService.list2(map);
        } else {
            noticeList2 = Collections.emptyList();
        }
        model.addAttribute("count", count);
        model.addAttribute("noticeList2", noticeList2);
        model.addAttribute("pagingHtml", page.getPagingHtml());

        return "admin/adminPage";
    }
  //보이는거
    //로그객체 생성문
    	private static final Logger log2 = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
    	
    	@Autowired
  	private BoardfreeDao boardfreeDao;//자동적으로 Setter Methdo호출X (의존성객체 넣어줌)
  	
    	
      @RequestMapping("NotView2")
  	public ModelAndView process2(@RequestParam("seq2") int seq2) {
  		//int seq=Integer.parseInt(request.getParameter("seq"));
  		if(log2.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
  			log2.debug("seq2=>"+seq2);
  		}
  		//1.조회수 증가
  		boardfreeDao.updateHit2(seq2);
  		BoardfreeVO board2=boardfreeDao.selectBoard2(seq2);
  		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>
  		board2.setContent2(StringUtil.parseBr(board2.getContent2()));//지금은 사용X
  		/*
  		ModelAndView mav=new ModelAndView("boardView");
  		mav.addObject("board",board);//${board}
  		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
  		return new ModelAndView("admin/admin_View2","board2",board2);
  	}
      
  	@RequestMapping("/file2.do")
  	public ModelAndView download2(@RequestParam("filename2") String filename) {
  		//1.다운로드 받을 파일의 위치와 이름을 알아야 된다.
  		File downloadFile2=new File(FileUtil.UPLOAD_PATH2+"/"+filename);
  		//2.스프링에서 다운로드 받는 뷰를 따로 작성->AbstractView를 상속받아서 작성
  		//1) 다운로드받을 뷰객체 2) 모델객체명(키명)  3)전달할값(다운로드 받을 파일명)
  		//1) 이동할 페이지 X (jsp페이지 X)
  		return new ModelAndView("downloadView2","downloadFile2",downloadFile2);
  	}
  	
  	//지우는것
	@RequestMapping(value="delete24")
	public String submit2(@RequestParam("seq2") Integer seq2) {
		System.out.println("seq2=>" +seq2);
	    boardfreeService.delete2(seq2);
	    return "redirect:/admin/adminPage";
	}
	
	//3
	
	@Autowired
    private BoarddogService boarddogService; // BoardService2로 변경

    @GetMapping("/adminPuppy_board")
    public String adminPage3(
            @RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
            @RequestParam(value = "keyField", defaultValue = "") String keyField,
            @RequestParam(value = "keyWord", defaultValue = "") String keyWord,
            Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("keyField", keyField);
        map.put("keyWord", keyWord);
        int count = boarddogService.getRowCount(map);

        PagingUtil page = new PagingUtil(currentPage, count, 3, 3, "adminPage.do");
        map.put("start", page.getStartCount());
        map.put("end", page.getEndCount());

        List<BoarddogVO> noticeList3 = null;
        if (count > 0) {
        	noticeList3 = boarddogService.list3(map);
        } else {
        	noticeList3 = Collections.emptyList();
        }
        model.addAttribute("count", count);
        model.addAttribute("noticeList3", noticeList3);
        model.addAttribute("pagingHtml", page.getPagingHtml());

        return "admin/adminPuppy_board";
    }
  //보이는거
    //로그객체 생성문
    	private static final Logger log3 = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
    	
    	@Autowired
  	private BoarddogDao boarddogDao;//자동적으로 Setter Methdo호출X (의존성객체 넣어줌)
  	
    	
      @RequestMapping("NotView3")
  	public ModelAndView process3(@RequestParam("seq3") Integer seq3) {
  		//int seq=Integer.parseInt(request.getParameter("seq"));
  		if(log3.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
  			log3.debug("seq3=>"+seq3);
  		}
  		//1.조회수 증가
  		boarddogDao.updateHit3(seq3);
  		BoarddogVO board3=boarddogDao.selectBoard3(seq3);
  		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>
  		board3.setContent3(StringUtil.parseBr(board3.getContent3()));//지금은 사용X
  		/*
  		ModelAndView mav=new ModelAndView("boardView");
  		mav.addObject("board",board);//${board}
  		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
  		return new ModelAndView("admin/admin_dogView3","board3",board3);
  	}
      
  	@RequestMapping("/file3.do")
  	public ModelAndView download3(@RequestParam("filename3") String filename) {
  		//1.다운로드 받을 파일의 위치와 이름을 알아야 된다.
  		File downloadFile3=new File(FileUtil.UPLOAD_PATH3+"/"+filename);
  		//2.스프링에서 다운로드 받는 뷰를 따로 작성->AbstractView를 상속받아서 작성
  		//1) 다운로드받을 뷰객체 2) 모델객체명(키명)  3)전달할값(다운로드 받을 파일명)
  		//1) 이동할 페이지 X (jsp페이지 X)
  		return new ModelAndView("downloadView3","downloadFile3",downloadFile3);
  	}
  	
  	//지우는것
	@RequestMapping(value="delete25")
	public String submit3(@RequestParam("seq3") Integer seq3) {
		System.out.println("seq3=>" +seq3);
	    boarddogService.delete3(seq3);
	    return "redirect:/admin/adminPuppy_board";
	}
	
    
}
