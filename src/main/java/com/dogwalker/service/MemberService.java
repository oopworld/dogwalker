package com.dogwalker.service;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.PointVO;

public interface MemberService {
	
	public String login(String id)throws Exception;//로그인 기능
	
	 public void signup(MemberVO vo)throws Exception; //회원가입 기능
	 
	 public Integer idcheck(String id)throws Exception;//아이디중복확인기능
	 
	 public void loginRegist(MemberVO vo)throws Exception;//회원가입시 아이디비밀번호 로그인테이블에도등록
	 
	 public MemberVO memberinfo(String id)throws Exception;//마이페이지에서 회원정보수정 페이지 호출
	 
	 public void memberinfoedit(MemberVO vo)throws Exception;//마이페이지 회원정보 수정
	 
	 public void passwordedit(MemberVO vo)throws Exception;//마이페이지 비밀번호 수정
	 
	 public DogVO mydoginfo(String id)throws Exception;//마이페이지 강아지 정보 조회

	 public void mydogedit(DogVO vo)throws Exception;//마이페이지 강아지 정보 수정
	 
	 public void registermydog(DogVO vo)throws Exception;//마이페이지 강아지 등록
	 
	 public void signbalance(PointVO vo)throws Exception;//회원가입시 잔고0인 포인트 테이블 레코드생성
}
