package com.dogwalker.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;
import com.dogwalker.service.BoardService;
import com.dogwalker.service.BoardfreeService;
import com.dogwalker.service.BoarddogService;
import com.dogwalker.util.FileUtil;
import com.dogwalker.util.StringUtil;

@Component
@Controller
public class DetailController {

	private static final Logger log = LoggerFactory.getLogger(DetailController.class);//로그객체 생성구문
	
	@Autowired
	private BoardService boardService; //byType을 이용해서 BoarDao객체를 자동으로 의존주입
	
    // /board/detail.do?seq=4 ->boardView.jsp
	@RequestMapping("detail")
	public ModelAndView process(@RequestParam("seq") int seq) {
		//int seq=Integer.parseInt(request.getParameter("seq"));
		if(log.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
			log.debug("seq=>"+seq);
		}
		//1.조회수 증가
		boardService.updateHit(seq);
		BoardVO board=boardService.selectBoard(seq);
		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>
		board.setContent(StringUtil.parseBr(board.getContent()));//지금은 사용X
		/*
		ModelAndView mav=new ModelAndView("boardView");
		mav.addObject("board",board);//${board}
		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
		return new ModelAndView("board/boardView","board",board);
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
	
	private void handleFileUpload2(BoardVO board, MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String savedFileName = FileUtil.rename(file.getOriginalFilename());
            File uploadFile = new File(FileUtil.UPLOAD_PATH, savedFileName);
            file.transferTo(uploadFile);
            board.setFilename("/resources/upload/" + savedFileName);
        }
    }
	
	
	//2번
	private static final Logger log2 = LoggerFactory.getLogger(DetailController.class);//로그객체 생성구문
	
	@Autowired
	private BoardfreeService boardfreeService;
	
	@RequestMapping("detail2")
	public ModelAndView process2(@RequestParam("seq2") Integer seq2) {
		//int seq=Integer.parseInt(request.getParameter("seq"));
		if(log2.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
			log2.debug("seq2=>"+seq2);
		}
		//1.조회수 증가
		boardfreeService.updateHit2(seq2);
		BoardfreeVO board2 = boardfreeService.selectBoard2(seq2);
		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>
		board2.setContent2(StringUtil.parseBr(board2.getContent2()));//지금은 사용X
		/*
		ModelAndView mav=new ModelAndView("boardView");
		mav.addObject("board",board);//${board}
		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
		return new ModelAndView("board/boardfreeView","board2",board2);
	}
	
//3번
	
	private static final Logger log3 = LoggerFactory.getLogger(DetailController.class);//로그객체 생성구문
	
	@Autowired
	private BoarddogService boarddogService;
	@RequestMapping("detail3")
	public ModelAndView process3(@RequestParam("seq3") Integer seq3) {
		System.out.println("seq3=>"+seq3);
		//int seq=Integer.parseInt(request.getParameter("seq"));
		if(log3.isDebugEnabled()) {//로그객체가 작동중이라면(디버깅상태라면)
			log3.debug("seq3=>"+seq3);
		}
		//1.조회수 증가
		boarddogService.updateHit3(seq3);
		BoarddogVO board3 = boarddogService.selectBoard3(seq3);
		//글내용 \r\n aaaa \r\m ->메서드로 출력 <br> <pre>~</pre>a
		board3.setContent3(StringUtil.parseBr(board3.getContent3()));//지금은 사용X
		/*
		ModelAndView mav=new ModelAndView("boardView");
		mav.addObject("board",board);//${board}
		return mav;  */// 1.이동할 페이지명 2.전달할 키명 3.전달할값
		return new ModelAndView("board/boarddogView","board3",board3);
	}

	
	
}






