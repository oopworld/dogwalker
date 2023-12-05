package com.dogwalker.controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class UpdateController {

	//로그객체 생성문
	private static final Logger log = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
	

    @Autowired
	private BoardService boardService;
	
	//1.글수정 폼으로 이동(GET방식)->반환값(단순 페이지 이동=>String)
	//페이지이동->데이터 출력->ModelAndView
	@RequestMapping(value="update",method=RequestMethod.GET)
	public ModelAndView form(@RequestParam("seq") int seq) { //메서드명은 임의로 작성
		System.out.println("다시 처음부터 값을 입력을 받기위해서(초기화) form()호출됨");
		BoardVO boardVO=boardService.selectBoard(seq);
		//1.이동할페이지명(확장자생략),2.키명.3.전달할값
		return new ModelAndView("board/boardModify","command",boardVO);
	}
	
	//2.입력해서 유효성검사->에러발생
	//BindingResult->유효성검사때문에 필요=>에러정보객체를 저장
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardVO com) {
	  
		  if(log.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
			  System.out.println("/update.do 요청중(post)");//? 을 출력X
			  log.debug("BoardVO:"+com);//? 을 출력 가능(select ~ where num=?)
	          //로그객체명.debug(출력대상자)
		  }
		  //변경전의 데이터를 불러오기->board(비밀번호)=웹상에서의 입력비밀번호
		  BoardVO board=null;
		  String oldFileName="";//변경전 파일명
		  board=boardService.selectBoard(com.getSeq());
		  //비밀번호체크(DB상의 암호!=웹상에서의 입력한 암호)
		  if(!board.getPwd().contentEquals(com.getPwd())) {
			  //비밀번호가 틀렸을 때 프론트에서 보여줄 것이 필요하다.
			  return "board/boardModify";//이동해서 다시입력받게 한다.
		  }else {//비밀번호가 맞다면
	        /*
	         * 기본파일명->업로드된파일이 존재->기존파일 삭제->새로운파일 세팅 업로드돼야한다.
	         */
			  oldFileName=board.getFilename();//DB상의 원래 기존파일명
			  //업로드되어있다면
			  if(!com.getUpload().isEmpty()) {
				 try {
				  com.setFilename(FileUtil.rename(com.getUpload().getOriginalFilename()));
				 }catch(Exception e) {e.printStackTrace();}
			  }else {//새로운 파일로 업로드 하지 않은경우(기존파일은 덮어쓰기)
				  com.setFilename(oldFileName);
			  }
			 
			  //글수정 호출
			  boardService.update(com);//DB상에 반영(<insert>~</insert>)
			  //실제로 upload폴더로 업로드한 파일을 전송(복사)
			  if(!com.getUpload().isEmpty()) {
				  try {
				  File file=new File(FileUtil.UPLOAD_PATH+"/"+com.getFilename());
				  //물리적으로 데이터전송(파일전송)
				  com.getUpload().transferTo(file);//파일업로드위치로 전송
				  }catch(IOException e) {
					  e.printStackTrace();
				  }catch(Exception e2) {
					  e2.printStackTrace();
				  }
		       //기존파일은 삭제하는 구문이 필요
				if(oldFileName!=null) {
					FileUtil.removeFile(oldFileName);
				}
		     }// if(!com.getUpload().isEmpty()) {
		 }//else 암호가 맞다면
		return  "redirect:list";
	}	
	
	//2번
private static final Logger log2 = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
	
		@Autowired
		private BoardfreeService boardfreeService;
	
	//1.글수정 폼으로 이동(GET방식)->반환값(단순 페이지 이동=>String)
		//페이지이동->데이터 출력->ModelAndView
		@RequestMapping(value="update2",method=RequestMethod.GET)
		public ModelAndView form2(@RequestParam("seq2") int seq2) { //메서드명은 임의로 작성
			System.out.println("다시 처음부터 값을 입력을 받기위해서(초기화) form2()호출됨");
			BoardfreeVO boardfreeVO=boardfreeService.selectBoard2(seq2);
			//1.이동할페이지명(확장자생략),2.키명.3.전달할값
			return new ModelAndView("board/boardfreeModify","command2",boardfreeVO);
		}
		
		//2.입력해서 유효성검사->에러발생
		//BindingResult->유효성검사때문에 필요=>에러정보객체를 저장
		@RequestMapping(value="update2",method=RequestMethod.POST)
		public String submit2(@ModelAttribute("command2") BoardfreeVO com) {
		  
			  if(log2.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
				  System.out.println("/update2.do2 요청중(post)");//? 을 출력X
				  log2.debug("BoardfreeVO:"+com);//? 을 출력 가능(select ~ where num=?)
		          //로그객체명.debug(출력대상자)
			  }
			  //변경전의 데이터를 불러오기->board(비밀번호)=웹상에서의 입력비밀번호
			  BoardfreeVO board2=null;
			  String oldFileName="";//변경전 파일명
			  board2=boardfreeService.selectBoard2(com.getSeq2());
			  //비밀번호체크(DB상의 암호!=웹상에서의 입력한 암호)
			  if(!board2.getPwd2().contentEquals(com.getPwd2())) {
				  //비밀번호가 틀렸을 때 프론트에서 보여줄 것이 필요하다.
				  return "board/boardfreeModify";//이동해서 다시입력받게 한다.
			  }else {//비밀번호가 맞다면
		        /*
		         * 기본파일명->업로드된파일이 존재->기존파일 삭제->새로운파일 세팅 업로드돼야한다.
		         */
				  oldFileName=board2.getFilename2();//DB상의 원래 기존파일명
				  //업로드되어있다면
				  if(!com.getUpload2().isEmpty()) {
					 try {
					  com.setFilename2(FileUtil.rename(com.getUpload2().getOriginalFilename()));
					 }catch(Exception e) {e.printStackTrace();}
				  }else {//새로운 파일로 업로드 하지 않은경우(기존파일은 덮어쓰기)
					  com.setFilename2(oldFileName);
				  }
				 
				  //글수정 호출
				  boardfreeService.update2(com);//DB상에 반영(<insert>~</insert>)
				  //실제로 upload폴더로 업로드한 파일을 전송(복사)
				  if(!com.getUpload2().isEmpty()) {
					  try {
					  File file2=new File(FileUtil.UPLOAD_PATH2+"/"+com.getFilename2());
					  //물리적으로 데이터전송(파일전송)
					  com.getUpload2().transferTo(file2);//파일업로드위치로 전송
					  }catch(IOException e) {
						  e.printStackTrace();
					  }catch(Exception e2) {
						  e2.printStackTrace();
					  }
			       //기존파일은 삭제하는 구문이 필요
					if(oldFileName!=null) {
						FileUtil.removeFile(oldFileName);
					}
			     }// if(!com.getUpload().isEmpty()) {
			 }//else 암호가 맞다면
			return  "redirect:list2";
		}	
		
		
//3번
		private static final Logger log3 = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정

		
		@Autowired
		private BoarddogService boarddogService;

		@RequestMapping(value = "update3", method = RequestMethod.GET)
		public ModelAndView form3(@RequestParam("seq3") Integer seq3) {
		    System.out.println("다시 처음부터 값을 입력을 받기위해서(초기화) form3()호출됨");
		    BoarddogVO boarddogVO = boarddogService.selectBoard3(seq3);
		    return new ModelAndView("board/boarddogModify", "command3", boarddogVO);
		}

		@RequestMapping(value = "update3", method = RequestMethod.POST)
		public String submit3(@ModelAttribute("command3") BoarddogVO com) {

		    if (log3.isDebugEnabled()) {
		        System.out.println("/update3.do 요청중(post)");
		        log3.debug("BoarddogVO:" + com);
		    }

		    BoarddogVO board3 = null;
		    String oldFileName = "";
		    board3 = boarddogService.selectBoard3(com.getSeq3());

		    if (!board3.getPwd3().contentEquals(com.getPwd3())) {
		        return "board/boarddogModify";
		    } else {
		        oldFileName = board3.getFilename3();

		        if (!com.getUpload3().isEmpty()) {
		            try {
		                com.setFilename3(FileUtil.rename(com.getUpload3().getOriginalFilename()));
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        } else {
		            com.setFilename3(oldFileName);
		        }

		        boarddogService.update3(com);

		        if (!com.getUpload3().isEmpty()) {
		            try {
		                File file3 = new File(FileUtil.UPLOAD_PATH3 + "/" + com.getFilename3());
		                com.getUpload3().transferTo(file3);
		            } catch (IOException e) {
		                e.printStackTrace();
		            } catch (Exception e2) {
		                e2.printStackTrace();
		            }

		            if (oldFileName != null) {
		                FileUtil.removeFile3(oldFileName);
		            }
		        }
		    }

		    return "redirect:list3";
		}

		
		
}
