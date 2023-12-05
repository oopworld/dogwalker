package com.dogwalker.controller;

import java.io.File;
import java.io.IOException;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.PointVO;
import com.dogwalker.service.MemberService;
import com.dogwalker.util.FileUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService member;
	
	@GetMapping("/login")//로그인 페이지로 이동
	public String loginPage(HttpSession session) {
	
		if(session.getAttribute("id")!=null) {return "redirect:/main";}//로그인이 이미 되어있다면 메인페이지로 이동
		
		return "member/login";
		
	}

	@PostMapping("/login")//로그인 아이디 비밀번호 제출 
	public String login(@RequestParam(value="id") String id, //로그인페이지 아이디 입력칸으로 부터 입력받은값
						@RequestParam(value="pw") String pw, //로그인페이지 암호 입력칸으로 부터 입력받은값		
						HttpServletRequest request//HttpSession session으로 전달해도되지만 request도 쓰기위해 둘다가진 HttpServletRequest사용
						)throws Exception{
		System.out.println("id=>"+id);
		System.out.println("pw=>"+pw);
		System.out.println(member.login(id));
		
		if(!pw.equals(member.login(id))) {//비밀번호 일치하지않을경우 로그인창으로 이동
			//model.addAttribute("isloginSuccess", "fail");//로그인 실패 String 전달
			return "redirect:/login?isloginSuccess=fail";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);//로그인 성공한 경우
		
		if(id.equals("admin11")) {//관리자 id인 admin11로 로그인했다면 로그인시 관리자페이지로 이동
			return "redirect:/admin";
		}
		
		URI uri= new URI(request.getHeader("Referer"));//HttpServletRequest 내장메서드로 http 헤더에 포함된 이전페이지주소 가져올수있음 
		String previousPage=uri.getPath();
		if(previousPage.equals("/mypage")) {//mypage를 눌러서 로그인페이지로 이동된 경우
			return "redirect:/mypage";
		}
		return "redirect:/main";
	}
	
	@GetMapping("/logout") //로그아웃기능
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("/signup") //회원가입창으로 이동 
	public String goSignupPage() {
		return "member/signup";
	}
	
	@ResponseBody
	@PostMapping("/idcheck/{id}")//아이디 중복확인
	public String idCheck(@PathVariable("id") String id) {
		System.out.println("입력받은 id값 =>"+id);
		int result=-1;
		try{
			result=member.idcheck(id);
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if (result==1) {//중복있음 
			return "fail";
		}
		return "success";//중복없음. 아이디사용가능
	}
	
	@ResponseBody
	@PostMapping("/signup") //회원가입창에서 입력후 제출
	public String signup(MemberVO vo) {
		System.out.println(vo);
		try {
			String NewfileName="";
			if(!vo.getUpload().isEmpty()) {
			NewfileName=FileUtil.rename(vo.getUpload().getOriginalFilename());
			System.out.println("NewfileName=>"+NewfileName);
			vo.setPhoto(NewfileName);
			System.out.println(vo);
			}
			
			member.signup(vo);
			member.loginRegist(vo);
			
			PointVO pointvo=new PointVO();
			pointvo.setId(vo.getId());
			member.signbalance(pointvo);
			
			if(!vo.getUpload().isEmpty()) {
					File file=new File(FileUtil.UPLOAD_PATH+"/"+NewfileName);
					vo.getUpload().transferTo(file);//실제 파일 전송
			};

		}catch(IOException e1) {
			e1.printStackTrace();
			return "fail";
		}catch(Exception e2) {
			e2.printStackTrace();
			return "fail";
		}
		return "success";
	}

	@GetMapping("/mypage")	//반드시 요청이 /mypage 가 아닌 /mypage/default 이런식으로 뒤의 값이있어야됨
	public String mypage(HttpSession session) {

		if(session.getAttribute("id")==null) {
			return loginPage(session);
		};
		
		
		return "member/mypage";
	}
	
	@GetMapping(value="/memberinfo" , produces ="application/text; charset=utf8")	//회원정보보기 produces는 json전달할때 한글깨지지않기위함
	@ResponseBody
	public Object memberedit(HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		System.out.println("session으로부터 받아온 id=>"+id);
		ObjectMapper jsonmapper=new ObjectMapper();//Jackson 라이브러리 ObjectMapper 클래스
		MemberVO vo=member.memberinfo(id);//DB로부터 회원정보를 MemberVO클래스의 객체로 받아옴
		System.out.println("DB에서 받아온 vo=>"+vo);
		vo.setPw("********");//패스워드는 가져올필요없고 가리기 위해서
		String voToJson=jsonmapper.writeValueAsString(vo);//DB에서 받아온 vo객체를 Json으로변경
		System.out.println(voToJson);
		return voToJson;
	}
	 
	@ResponseBody
	@PostMapping("/myinfoedit")
	public String myinfoedit(MemberVO vo,HttpSession session) {//회원정보 수정
		System.out.println("회원정보수정받아온=>"+vo);
		String id=(String)session.getAttribute("id");
		vo.setId(id);
		String password=vo.getPw();//회원정보 수정을 위해서 기존 비밀번호를 확인 
		System.out.println("최종 DB로보낼 VO=>"+vo);
		try{
		if(!password.equals(member.login(id))){//패스워드 불일치할경우
			return "pwincorrect";
		};
		String NewfileName="";
		if(vo.getUpload()!=null) {
			NewfileName=FileUtil.rename(vo.getUpload().getOriginalFilename());
			System.out.println("NewfileName=>"+NewfileName);
			vo.setPhoto(NewfileName);
			System.out.println(vo);
			}

		if(vo.getUpload()!=null) {
			File file=new File(FileUtil.UPLOAD_PATH+"/"+NewfileName);
			vo.getUpload().transferTo(file);//실제 파일 전송
		};
		System.out.println("변경할 비밀번호 =>"+vo.getNewpassword());
		member.memberinfoedit(vo);
		if(vo.getNewpassword()!=null) {
			member.passwordedit(vo);
		}
		}catch(IOException e) {
			e.printStackTrace();
			return "fail";
		}catch(Exception e2) {
			e2.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@ResponseBody
	@GetMapping(value="/mydoginfo", produces ="application/text; charset=utf8")
	public String getdoginfo(HttpSession session) throws Exception{
		String id=(String)session.getAttribute("id");
		DogVO vo=member.mydoginfo(id);
		
		ObjectMapper jsonmapper=new ObjectMapper();//Jackson 라이브러리 ObjectMapper 클래스
		String voToJson=jsonmapper.writeValueAsString(vo);//DB에서 받아온 vo객체를 Json으로변경
		
		return voToJson;
	}
	
	@PostMapping(value="/mydogedit")
	@ResponseBody
	public String doginfoedit(DogVO vo) {
		String NewfileName="";
		try {
		
		if(vo.getUpload()!=null) {
			NewfileName=FileUtil.rename(vo.getUpload().getOriginalFilename());
			System.out.println("NewfileName=>"+NewfileName);
			vo.setDog_photo(NewfileName);
			System.out.println(vo);
			}

		if(vo.getUpload()!=null) {
			File file=new File(FileUtil.UPLOAD_PATH+"/"+NewfileName);
			vo.getUpload().transferTo(file);//실제 파일 전송
		};
		member.mydogedit(vo);
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	} 
	
	@PostMapping("/registermydog")
	@ResponseBody
	public String registerDog(DogVO vo,HttpSession session) {
		String NewfileName="";
		String id=(String)session.getAttribute("id");
		vo.setId(id);
		try {
			if(vo.getUpload()!=null) {
				NewfileName=FileUtil.rename(vo.getUpload().getOriginalFilename());
				System.out.println("NewfileName=>"+NewfileName);
				vo.setDog_photo(NewfileName);
				System.out.println(vo);
				}

			if(vo.getUpload()!=null) {
				File file=new File(FileUtil.UPLOAD_PATH+"/"+NewfileName);
				vo.getUpload().transferTo(file);//실제 파일 전송
			};
			member.registermydog(vo);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";

		}
		
		return "success";
	}
}
