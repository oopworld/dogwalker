package com.dogwalker.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MatchingVO;

public interface MatchingService {

	//테이블전체 가져오기
		public List<MatchingVO> mList(Map<String,Object>map); 
		
		//총 레코드 수 구하기
		public int getRowCount(Map<String,Object>map);
		
		//한행만 가져오기
		public MatchingVO selectMatching(int m_num);
		
		//최대값 구하기
		public int getNewM_num();
		
		//예약신청
		public void mRequest(MatchingVO matching);
		
		//예약승인, 산책시작, 산책완료
		public void mLevelUp(int m_num);
		
		//확정된 산책 취소하기
		public void mCancel(int m_num);
		
		//예약신청 거절하기
		public void mReject(int m_num);
		
		//예약시 같은날 나머지 예약 취소시키는 SQL문
		public void mTruc(MatchingVO matching);
		
		//아이디를 가지고 도그아이디를 불러오기
		public int idtodog_id(String id);
		
		//아이디와 date를 가지고 그 날 확정된 산책이 있는지 확인하기
		public int idtodate(MatchingVO matching);
		
		//날짜를 넣어서 그 날에 산책예약이 없는 강아지들의 데이터와 회원의 데이터를 합친 데이터뭉치 리스트를 가져온다
		public List<DogVO> datetoall(MatchingVO matching);
		
		//아이디와 date정보를 가지고 한 행을 받아온다.
		public MatchingVO dateidtolevel(MatchingVO matching);
		
		//아이디와 date를 가지고 레코드 있는지 확인
		public int dateidtocon(MatchingVO matching);
		
		//도그아이디와 date를 가지고 레코드 있는지 확인
		public int datedogidtocon(MatchingVO matching);
		
		//도그아이디와 date를 가지고 한행 받아오기
		public MatchingVO datedogidtoline(MatchingVO matching);
		
		//m_num을 가지고 레벨 받아오기
		public int numtolevel(int m_num);
		
		//id로 name
		public String idtoname(String id);
		
		//id로 photo
		public String idtophoto(String id);
		
		//dog_id로 dog_name
		public String dogtodname(int dog_id);
		
		//dog_id로 dog_photo
		public String dogtodphoto(int dog_id);
		
		//아이디로 도그아이디 유무 확인
		public int idtodogcon(String id);
			
}
