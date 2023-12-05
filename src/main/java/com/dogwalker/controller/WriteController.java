package com.dogwalker.controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;
import com.dogwalker.domain.ItemVO;
import com.dogwalker.service.BoardService;
import com.dogwalker.service.BoardfreeService;
import com.dogwalker.service.BoarddogService;
import com.dogwalker.util.FileUtil;


@Component
@Controller
public class WriteController {

	//로그객체 생성문
	//private Logger log=Logger.getLogger(WriteController.class);//로그를 처리할 클래스명
	private static final Logger log = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
	
	@Autowired
	private BoardService boardService;
	/*
	 * 하나의 요청명령어=>하나의 컨트롤러만 사용X
	 * 하나의 컨트롤러=>여러개의 요청명령어를 등록해서 사용이 가능(ex writeForm.do,write.do)
	 * 같은 요청명령어를 GET or POST으로 전송할지를 결정하는 속성
	 *        write.do(페이지 이동)                write.do
	 * method=RequestMethod.GET        method=RequestMethod.POST
	 */
	//1.글쓰기 폼으로 이동(GET방식)
	@RequestMapping(value="write",method=RequestMethod.GET)
	public String form() { //메서드명은 임의로 작성
		System.out.println("다시 처음부터 값을 입력을 받기위해서(초기화) form()호출됨");
		return "board/boardWrite"; //return "이동할 페이지명" //definition name과 동일
	}
	
	//3.입력해서 유효성검사->에러발생
	//BindingResult->유효성검사때문에 필요=>에러정보객체를 저장
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardVO com) {
	  
		  if(log.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
			  System.out.println("/write 요청중(post)");//? 을 출력X
			  log.debug("BoardVO:"+com);//? 을 출력 가능(select ~ where num=?)
	          //로그객체명.debug(출력대상자)
		  }
		  
		  //글쓰기 및 업로드=>입출력=>예외처리
		  try {
			  String newName="";//업로드한 파일의 변경된 파일명을 저장
			  //업로드되어있다면
			  if(!com.getUpload().isEmpty()) {
				  //탐색기에서 선택한 파일->getOriginalFileName() aaaa.txt->1234444
				  newName=FileUtil.rename(com.getUpload().getOriginalFilename());//a.txt
				  System.out.println("newName=>"+newName);
				  //DTO에 변경=>테이블에서도 변경저장
				  com.setFilename(newName);//informboard->filename필드명 123ddd.txt
			  }
			  //최대값+1
			  int newSeq=boardService.getNewSeq()+1;//primary key때문에 유효성검사에러유발
			  System.out.println("newSeq=>"+newSeq);
			  //게시물번호=>계산->저장
			  com.setSeq(newSeq);//1->2
			  //글쓰기 호출
			  boardService.insert(com);//DB상에 반영(<insert>~</insert>)
			  //실제로 upload폴더로 업로드한 파일을 전송(복사)
			  if(!com.getUpload().isEmpty()) {
				  File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
				  //물리적으로 데이터전송(파일전송)
				  com.getUpload().transferTo(file);//파일업로드위치로 전송
			  }
		  }catch(IOException e) {
			  e.printStackTrace();
		  }catch(Exception e2) {
			  e2.printStackTrace();
		  }
		  
			/* item.setIt_img("/resources/upload/" + savedFileName); */
		  
		//return "redirect:/요청명령어"=>return "이동할 페이지"
		return  "redirect:list";
	}	
	
	//2번
	private static final Logger log2 = LoggerFactory.getLogger(DetailController.class);//현재클래스명을 불러와서 지정
	
	@Autowired
	private BoardfreeService boardfreeService;
	
	//1.글쓰기 폼으로 이동(GET방식)
		@RequestMapping(value="write2",method=RequestMethod.GET)
		public String form2() { //메서드명은 임의로 작성
			System.out.println("다시 처음부터 값을 입력을 받기위해서(초기화) form()호출됨");
			return "board/boardfreeWrite"; //return "이동할 페이지명" //definition name과 동일
		}
		
		//3.입력해서 유효성검사->에러발생
		//BindingResult->유효성검사때문에 필요=>에러정보객체를 저장
		@RequestMapping(value="write2",method=RequestMethod.POST)
		public String submit2(@ModelAttribute("command2") BoardfreeVO com) {
		  
			  if(log2.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
				  System.out.println("/write2 요청중(post)");//? 을 출력X
				  log2.debug("BoardfreeVO:"+com);//? 을 출력 가능(select ~ where num=?)
		          //로그객체명.debug(출력대상자)
			  }
			  
			  //글쓰기 및 업로드=>입출력=>예외처리
			  try {
				  String newName="";//업로드한 파일의 변경된 파일명을 저장
				  //업로드되어있다면
				  if(!com.getUpload2().isEmpty()) {
					  //탐색기에서 선택한 파일->getOriginalFileName() aaaa.txt->1234444
					  newName=FileUtil.rename(com.getUpload2().getOriginalFilename());//a.txt
					  System.out.println("newName=>"+newName);
					  //DTO에 변경=>테이블에서도 변경저장
					  com.setFilename2(newName);//informboard->filename필드명 123ddd.txt
				  }
				  //최대값+1
				  int newSeq=boardfreeService.getNewSeq()+1;//primary key때문에 유효성검사에러유발
				  System.out.println("newSeq=>"+newSeq);
				  //게시물번호=>계산->저장
				  com.setSeq2(newSeq);//1->2
				  //글쓰기 호출
				  boardfreeService.insert2(com);//DB상에 반영(<insert>~</insert>)
				  //실제로 upload폴더로 업로드한 파일을 전송(복사)
				  if(!com.getUpload2().isEmpty()) {
					  File file=new File(FileUtil.UPLOAD_PATH2+"/"+newName);
					  //물리적으로 데이터전송(파일전송)
					  com.getUpload2().transferTo(file);//파일업로드위치로 전송
				  }
			  }catch(IOException e) {
				  e.printStackTrace();
			  }catch(Exception e2) {
				  e2.printStackTrace();
			  }
		
			//return "redirect:/요청명령어"=>return "이동할 페이지"
			return  "redirect:list2";
		}	
		
		/*
		 * @PostMapping("/addProduct") public String addProduct(@ModelAttribute ItemVO
		 * item, @RequestParam("insertImg") MultipartFile file) throws Exception {
		 * handleFileUpload(item, file); itemService.insertItem(item); return
		 * "redirect:/admin/admin_itlist"; }
		 */
	    
	    
		
//3번
		
		private static final Logger log3 = LoggerFactory.getLogger(DetailController.class);

		@Autowired
		private BoarddogService boarddogService;

		@RequestMapping(value = "write3", method = RequestMethod.GET)
		public String writeForm3() {
		    if (log3.isDebugEnabled()) {
		        log3.debug("다시 처음부터 값을 입력을 받기위해서(초기화) form()호출됨");
		    }
		    return "board/boarddogWrite"; 
		}

		@RequestMapping(value = "write3", method = RequestMethod.POST)
		public String writeSubmit3(@ModelAttribute("command3") BoarddogVO com) {
		    if (log3.isDebugEnabled()) {
		        log3.debug("/write3 요청중(post)");
		        log3.debug("BoarddogVO:" + com);
		    }

		    try {
		        String newName = "";

		        if (!com.getUpload3().isEmpty()) {
		            newName = FileUtil.rename(com.getUpload3().getOriginalFilename());
		            com.setFilename3(newName);
		        }

		        int newSeq = boarddogService.getNewSeq() + 1;
		        com.setSeq3(newSeq);

		        boarddogService.insert3(com);

		        if (!com.getUpload3().isEmpty()) {
		            File file = new File(FileUtil.UPLOAD_PATH3 + "/" + newName);
		            com.getUpload3().transferTo(file);
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    } catch (Exception e2) {
		        e2.printStackTrace();
		    }

		    return "redirect:list3";
		}
}
