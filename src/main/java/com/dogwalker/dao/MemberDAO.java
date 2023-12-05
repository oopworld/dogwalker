package com.dogwalker.dao;

import org.springframework.stereotype.Repository;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.PointVO;

@Repository
public interface MemberDAO {
	public String login(String id)throws Exception;//로그인 위해서 비밀번호 일치 확인

	 public void signup(MemberVO vo)throws Exception; //회원가입 위해서 회원가입정보 전달  
	 
	 public Integer idcheck(String id)throws Exception; //회원가입시 아이디 중복확인
	 
	 public void loginRegist(MemberVO vo)throws Exception; //회원가입시 아이디,비밀번호 로그인테이블에도 등록
	 
	 public MemberVO memberinfo(String id)throws Exception; //마이페이지에서 회원정보페이지 호출
	 
	 public void memberinfoedit(MemberVO vo)throws Exception;//회원정보 수정
	 
	 public void passwordedit(MemberVO vo)throws Exception;//비밀번호 수정
	 
	 public DogVO mydoginfo(String id)throws Exception;//마이페이지 회원 강아지 정보 

	 public void mydogedit(DogVO vo)throws Exception;//마이페이지 회원 강아지 정보 수정
	 
	 public void registermydog(DogVO vo)throws Exception;//내 강아지 등록
	 
	 public void signbalance(PointVO point)throws Exception;//회원가입시 잔고가 0인 point테이블 레코드 생성
}

