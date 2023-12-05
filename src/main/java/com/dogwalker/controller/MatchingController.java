package com.dogwalker.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MatchingVO;
import com.dogwalker.domain.PointVO;
import com.dogwalker.service.MatchingService;
import com.dogwalker.service.PointService;
import com.dogwalker.util.PagingUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MatchingController {

	private static final Logger log = LoggerFactory.getLogger(MatchingController.class);
	
	@Autowired
	private MatchingService matchingService;
	
	@Autowired
	private PointService pointService;
	
	//예약확인
	@RequestMapping("rescheck")
	public ModelAndView rescheck(
	   @RequestParam(value="pageNum",defaultValue="1") int currentPage, //페이지번호
	   @RequestParam(value="viewType",defaultValue="all") String viewType, //검색분야 -> 좀 더 고민해보기
	   @SessionAttribute("id") String id
			) {
		  if(log.isDebugEnabled()) {//로그객체가 디버깅모드상태인지 아닌지를 체크
			  System.out.println("matching 요청중");//? 을 출력X
			  log.debug("currentPage:"+currentPage);//? 을 출력 가능(select ~ where num=?)
			  log.debug("viewType=>"+viewType);
		  }
		  
		  /*int check=matchingService.idtodogcon(id);
		  
		  if(check==1) {*/
		  
		  Map<String,Object> map=new HashMap<String,Object>();
		  int dog_id=matchingService.idtodog_id(id);
		  System.out.println("id=>"+id);
		  System.out.println("dog_id=>"+dog_id);
		  System.out.println("viewType=>"+viewType);
		  map.put("viewType", viewType);
		  map.put("id", id);
		  map.put("dog_id", dog_id);
		  //총레코드수 또는 검색된 글의 총레코드수
		 int count=matchingService.getRowCount(map);
		 System.out.println("MatchingController클래스의 count=>"+count);
		 //페이징 처리(1.현재페이지 2.총레코드수 3.페이지당 게시물수 4.블럭당 페이지수 5.요청명령어지정
		 PagingUtil page=new PagingUtil(currentPage,count,10,5,"rescheck");
		 //start=>페이지당 맨 첫번째 나오는 게시물번호 ,end->마지막 게시물번호
		 map.put("start", page.getStartCount());//<->map.get("start")=>#{start}
		 map.put("end",  page.getEndCount());//<->map.get("end")=>#{end}
		 
		 List<MatchingVO> list=null;
		 if(count > 0) {
			 list=matchingService.mList(map);//keyField,keyWord,start,end
		 }else {
			 list=Collections.EMPTY_LIST;//0 적용
		 }
		
		ModelAndView mav=new ModelAndView("matching/ReservationCheck");//boardList.jsp
		mav.addObject("count",count);//총레코드수
		mav.addObject("list",list);//검색된 레코드리스트
		mav.addObject("pagingHtml",page.getPagingHtml());//<a href=" ~?>링크문자열
		 		
		return mav;
		 /* }else{ 추후에 산책자 전용 페이지 만들기
			  
			  Map<String,Object> map=new HashMap<String,Object>();
			  map.put("viewType", viewType);
			  map.put("id", id);
			  int count=matchingService.getRowCount(map);
			  PagingUtil page=new PagingUtil(currentPage,count,10,5,"rescheck");
			  map.put("start", page.getStartCount());
				 map.put("end",  page.getEndCount());
				 
				 List<MatchingVO> list=null;
				 if(count > 0) {
					 list=matchingService.mList(map);
				 }else {
					 list=Collections.EMPTY_LIST;
				 }
				
				ModelAndView mav=new ModelAndView("matching/ReservationCheck");
				mav.addObject("count",count);
				mav.addObject("list",list);
				mav.addObject("pagingHtml",page.getPagingHtml());
				
			  return mav;
		  }*/
	}
	
	//산책승인
	@RequestMapping("reqagree")
	public String reqagree(@SessionAttribute("id") String id,int m_num) {
		matchingService.mLevelUp(m_num);
		MatchingVO vo=new MatchingVO();
		vo=matchingService.selectMatching(m_num);
		matchingService.mTruc(vo);
		//견주 멍코인 빠져나가는 메서드
		PointVO point=new PointVO();
		int m_duration=vo.getM_duration();
		point.setId(id);
		point.setP_type("m");
		point.setP_amount(350*m_duration);
		int p_balance=pointService.getnowbalance(id);
		point.setP_balance(p_balance-(350*m_duration));
		pointService.newline(point);
		
		return "redirect:rescheck";
	}
	
	//산책 거절
	@RequestMapping("mreject")
	public String mreject(int m_num) {
		matchingService.mReject(m_num);
		
		return "redirect:rescheck";
	}
	
	//예약 신청
	@RequestMapping("findDog")
	public String findDog() {
		
		return "matching/matching";
	}

	//산책진행상황 - 견주
	@RequestMapping("status")
	public String status(@SessionAttribute("id") String id,Model model) {
		
		LocalDate day = LocalDate.now(ZoneId.of("Asia/Seoul"));
		Date today = Date.valueOf(day);
		System.out.println("today=>"+today);
		int dog_id=matchingService.idtodog_id(id);
		System.out.println("dog_id=>"+dog_id);
		MatchingVO vo=new MatchingVO();
		vo.setDog_id(dog_id);
		vo.setM_date(today);
		int check=matchingService.datedogidtocon(vo);
		System.out.println("vo=>"+vo);
		if(check==0) {
			
			return "matching/StatusN";
			
		}else{
			/*return "matching/matching"; }*/
			MatchingVO match=matchingService.datedogidtoline(vo);
			int level=match.getM_level();
			model.addAttribute("match", match);
			if(level==2) {
				
				return "matching/StatusR";
				
			}else if(level==3) {
				
				return "matching/StatusO";
				
			}else if(level==4) {
				
				return "matching/StatusD";
				
			}else {
				
				return "matching/StatusN";
			}
		}
	}
	
	//산책진행상황 - 산책자 -> 리턴할 페이지 만들고 수정하기
		@RequestMapping("MstatusW")
		public String MstatusW(@SessionAttribute("id") String id,Model model) {
			
			LocalDate day = LocalDate.now(ZoneId.of("Asia/Seoul"));
			Date today = Date.valueOf(day);
			MatchingVO vo=new MatchingVO();
			vo.setId(id);
			vo.setM_date(today);
			int check=matchingService.dateidtocon(vo);
			if(check==0) {
				
				return "matching/StatusN";
				
			}else{
				
				MatchingVO match=matchingService.dateidtolevel(vo);
				int level=match.getM_level();
				model.addAttribute("match", match);
				if(level==2) {
					
					return "matching/StatusR2";
					
				}else if(level==3) {
					
					return "matching/StatusO2";
					
				}else if(level==4) {
					
					return "matching/StatusD";
					
				}else {
					
					return "matching/StatusN";
				}
			}
		}
		
		//확정된 예약취소하기 -> 관리자 페이지 만들면 기능 확충해야 함
		//취소1 예약확인 페이지에서의 취소
		@RequestMapping("mCancel1")
		public String mCancel1(int m_num) {
			matchingService.mCancel(m_num);
			return "redirect:rescheck";
		}
		
		//취소2 산책현황 페이지에서의 취소
		@RequestMapping("mCancel2")
		public String mCancel2(int m_num) {
			matchingService.mCancel(m_num);
			return "matching/StatusN";
		}
	
		/*@PostMapping(value="getMarker", produces ="application/text; charset=utf8") 기존 ajax응답 메서드
		@ResponseBody
		public String getMarker(@RequestParam("date") String date){//달력 날짜 변경했을때 해당 
			
			String doglistjson="";
			
	        LocalDate LDate = LocalDate.parse(date); // 문자열을 LocalDate 객체로 변환
	        Date sqlDate = Date.valueOf(LDate); // LocalDate 객체를 java.sql.Date 객체로 변환
	        System.out.println("sqlDate=>"+sqlDate);
	        
			List<DogVO> doglist= matchingService.datetoall(sqlDate);// 달력의 날짜를 변경하면 그 날짜에 해당하는 모든 Dog 레코드들을 List형태로 받아옴
			System.out.println("doglist=>"+doglist);
			
			ObjectMapper jsonmapper=new ObjectMapper();//jackson라이브러리 쓰기위해 ObjectMapper 객체 생성
			try {
				
				doglistjson=jsonmapper.writeValueAsString(doglist);//List<DogVO> doglist를 json형태의 String으로 변경
				
			}catch(Exception e) {
				
				System.out.println("오류발생");
			}
			return doglistjson;
		}*/
		
		@PostMapping(value="getMarker", produces ="application/text; charset=utf8")
		@ResponseBody
		public String getMarker(@RequestParam("date") String date,HttpSession session){//달력 날짜 변경했을때 해당 
			
			String doglistjson="";
			if(session.getAttribute("id")==null) {
				return "needlogin";
			}
			
			try {
			String id=(String)session.getAttribute("id");
	        LocalDate LDate = LocalDate.parse(date); // 문자열을 LocalDate 객체로 변환
	        Date sqlDate = Date.valueOf(LDate); // LocalDate 객체를 java.sql.Date 객체로 변환
	        System.out.println("sqlDate=>"+sqlDate);

	        MatchingVO vo=new MatchingVO();
	        vo.setId(id);
	        vo.setM_date(sqlDate);
	        int check=matchingService.idtodate(vo);
	        	        
	        
	        if(check==0) {
	        	
	        	int dog_id=matchingService.idtodog_id(id);
	        	vo.setDog_id(dog_id);
	        	List<DogVO> doglist= matchingService.datetoall(vo);// 달력의 날짜를 변경하면 그 날짜에 해당하는 모든 Dog 레코드들을 List형태로 받아옴
	        	
	        	System.out.println("doglist=>"+doglist);
				
	        	ObjectMapper jsonmapper=new ObjectMapper();//jackson라이브러리 쓰기위해 ObjectMapper 객체 생성
				
					
				doglistjson=jsonmapper.writeValueAsString(doglist);//List<DogVO> doglist를 json형태의 String으로 변경
	        }else {
	        	return "fail";
	        }

		}catch(IOException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
	    }
	        return doglistjson;
		}
		
		
		@PostMapping(value="/submitmatching" , produces ="application/text; charset=utf8")
		@ResponseBody
		public String submitMatch(@RequestBody MatchingVO vo, @SessionAttribute("id") String id) {
			
			System.out.println(vo);
			int dog_id=vo.getDog_id();
			String name=matchingService.idtoname(id);
			String photo=matchingService.idtophoto(id);
			System.out.println("photo=>"+photo);
			String dog_name=matchingService.dogtodname(dog_id);
			String dog_photo=matchingService.dogtodphoto(dog_id);
			System.out.println("dog_photo=>"+dog_photo);
			vo.setId(id);
			vo.setName(name);
			vo.setPhoto(photo);
			vo.setDog_name(dog_name);
			vo.setDog_photo(dog_photo);
			System.out.println(vo);
			matchingService.mRequest(vo);

			return "success";
		}
	 
	
	//산책시작
	@RequestMapping("startWalk")
	public String startWalk(@SessionAttribute("id") String id) {
		
		LocalDate day = LocalDate.now(ZoneId.of("Asia/Seoul"));
		Date today = Date.valueOf(day);
		int dog_id=matchingService.idtodog_id(id);
		MatchingVO vo=new MatchingVO();
		vo.setDog_id(dog_id);
		vo.setM_date(today);
		MatchingVO match=matchingService.datedogidtoline(vo);
		int m_num=match.getM_num();
		int m_level=matchingService.numtolevel(m_num);
		if(m_level==0) {
			
			return "status"; //일단 임시방편 추후에 상대방이 취소했음을 알리는 페이지 하나 만들기
			
		}else {
			
		matchingService.mLevelUp(m_num);
		
		return "redirect:status";
		}
	}
	
	//산책완료
	@RequestMapping("walkDone")
	public String walkDone(@SessionAttribute("id") String id) {
		
		LocalDate day = LocalDate.now(ZoneId.of("Asia/Seoul"));
		Date today = Date.valueOf(day);
		int dog_id=matchingService.idtodog_id(id);
		MatchingVO vo=new MatchingVO();
		vo.setDog_id(dog_id);
		vo.setM_date(today);
		MatchingVO match=matchingService.datedogidtoline(vo);
		int m_num=match.getM_num();
		System.out.println("match=>"+match);
		int m_level=matchingService.numtolevel(m_num);
		if(m_level==0) {
			
			return "status"; //일단 임시방편 추후에 상대방이 취소했음을 알리는 페이지 하나 만들기
			
		}else {
		
		matchingService.mLevelUp(m_num);
		//여기에 멍코인 산책자에게 입금되는 메서드 추가하기
		String wid=match.getId();
		System.out.println("wid=>"+wid);
		PointVO point=new PointVO();
		int m_duration=match.getM_duration();
		point.setId(wid);
		point.setP_type("p");
		point.setP_amount(350*m_duration);
		int p_balance=pointService.getnowbalance(wid);
		System.out.println("p_balance=>"+p_balance);
		point.setP_balance(p_balance + (350 * m_duration));// 왜 여기서 이상한 값이 나오는거지?
		System.out.println("balance 계산뒤=>"+p_balance+(350*m_duration));
		pointService.newline(point);
		
		return "redirect:status";
		}
	}
	
}
