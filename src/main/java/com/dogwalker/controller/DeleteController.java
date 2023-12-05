package com.dogwalker.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;
import com.dogwalker.service.BoardService;
import com.dogwalker.service.BoardfreeService;
import com.dogwalker.service.BoarddogService;
import com.dogwalker.util.FileUtil;


@Component
@Controller
public class DeleteController {

	//로그객체 생성문
	private static final Logger log = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
	
	@Autowired
	private BoardService boardService;//자동적으로 Setter Methdo호출X (의존성객체 넣어줌)
	
	//1.글삭제 폼으로 이동(GET방식)->반환값(단순 페이지 이동=>String)
	/*
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public ModelAndView form(@RequestParam("seq") int seq) {
		System.out.println("seq=>"+seq);
		model.addAttribute("seq", seq);
		return "board/boardDelete";
	}*/
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public ModelAndView form(@RequestParam("seq") int seq) { //메서드명은 임의로 작성
		//1.이동할페이지명(확장자생략),2.키명.3.전달할값
		return new ModelAndView("board/boardDelete","seq",seq);
	}
	
	//2.입력해서 유효성검사->에러발생
	@RequestMapping(value="delete",method=RequestMethod.POST)
	//public String submit(@ModelAttribute("command")  com,@RequestParam("pwd") String pwd) {
	public String submit(@RequestParam("seq") int seq,@RequestParam("pwd") String pwd) {
		System.out.println("post메서드 실행");
		  if(log.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
			  System.out.println("/delete 요청중(post)");//? 을 출력X
			  log.debug("seq=>"+seq);//? 을 출력 가능(select ~ where num=?)
			  log.debug("pwd=>",pwd);
	          //로그객체명.debug(출력대상자)
		  }

		  //변경전의 데이터를 불러오기->board(비밀번호)=웹상에서의 입력비밀번호
		  BoardVO board=null;
		  board=boardService.selectBoard(seq);
		  System.out.println("select문 실행완료");
		  //비밀번호체크(DB상의 암호!=웹상에서의 입력한 암호)
		  if(!board.getPwd().contentEquals(pwd)) {
			  System.out.println("비밀번호 틀림");
			  return "board/boardDelete";//이동해서 다시입력받게 한다.
		  }else {//비밀번호가 맞다면
			  System.out.println("비밀번호 맞음");
			  //글삭제 호출
			  boardService.delete(seq);//DB상에 반영(<delete>~</delete>)
			  //실제로 upload폴더로 업로드한 파일을 전송(복사)
			 // if(!com.getUpload().isEmpty()) {
		       //업로드한 파일까지 삭제
				if(board.getFilename()!=null) {
					FileUtil.removeFile(board.getFilename());
				}
		    // }// if(!com.getUpload().isEmpty()) {
		 }//else 암호가 맞다면 
		return  "redirect:list";
	}	
	
	//2번째
	//로그객체 생성문
	// 로그객체 생성문
	private static final Logger log2 = LoggerFactory.getLogger(DetailController.class);

    @Autowired
   	private BoardfreeService boardfreeService; // BoardDao2를 주입

    @RequestMapping(value = "delete2", method = RequestMethod.GET)
    public ModelAndView deleteForm2(@RequestParam("seq2") Integer seq2) {
        return new ModelAndView("board/boardfreeDelete", "seq2", seq2);
    }

    @RequestMapping(value = "delete2", method = RequestMethod.POST)
    public String deleteSubmit2(@RequestParam("seq2") Integer seq2, @RequestParam("pwd2") String pwd2) {
        if (log2.isDebugEnabled()) {
        	log2.debug("/delete 요청중(post)");
        	log2.debug("seq2=>" + seq2);
        	log2.debug("pwd2=>" + pwd2);
        }

        BoardfreeVO board2 = boardfreeService.selectBoard2(seq2);

        if (!board2.getPwd2().equals(pwd2)) {
            System.out.println("비밀번호 틀림");
            return "board/boarddogDelete";
        } else {
            System.out.println("비밀번호 맞음");
            boardfreeService.delete2(seq2);
            
            if (board2.getFilename2() != null) {
                FileUtil.removeFile(board2.getFilename2());
            }
        }
        
        return "redirect:list2";
    }
    
    
    //3

    private static final Logger log3 = LoggerFactory.getLogger(DetailController.class);

    @Autowired
   	private BoarddogService boarddogService; // BoardDao2를 주입

    @RequestMapping(value = "delete3", method = RequestMethod.GET)
    public ModelAndView deleteForm(@RequestParam("seq3") int seq3) {
        return new ModelAndView("board/boarddogDelete", "seq3", seq3);
    }

    @RequestMapping(value = "delete3", method = RequestMethod.POST)
    public String deleteSubmit(@RequestParam("seq3") Integer seq3, @RequestParam("pwd3") String pwd3) {
        if (log3.isDebugEnabled()) {
            log3.debug("/delete 요청중(post)");
            log3.debug("seq3=>" + seq3);
            log3.debug("pwd3=>" + pwd3);
        }

        BoarddogVO board3 = boarddogService.selectBoard3(seq3);

        if (!board3.getPwd3().equals(pwd3)) {
            System.out.println("비밀번호 틀림");
            return "board/boarddogDelete";
        } else {
            System.out.println("비밀번호 맞음");
            boarddogService.delete3(seq3);
            
            if (board3.getFilename3() != null) {
                FileUtil.removeFile(board3.getFilename3());
            }
        }
        
        return "redirect:list3";
    }

    
    
}