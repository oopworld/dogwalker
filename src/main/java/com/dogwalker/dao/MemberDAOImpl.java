package com.dogwalker.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.PointVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession session;
	
	private String namespace = "Member";
	
	@Override
	public String login(String id) throws Exception {

		String pw = session.selectOne(namespace+".login",id);//해당 아이디가 가진 암호를 가져옴
		return pw;
	}
	
	
	  public void signup(MemberVO vo) throws Exception {
	  
	  session.insert(namespace+".signup",vo);//회원가입을 위해 아이디 생성 
	  };
	 
	  @Override
	public Integer idcheck(String id) throws Exception { //회원가입시 아이디 중복확인
		
		return session.selectOne(namespace+".idcheck",id);
	}
	  
	  @Override
	public void loginRegist(MemberVO vo) throws Exception { //회원가입시 아이디 비밀번호 로그인테이블에도 등록
		
		  session.insert(namespace+".loginRegist",vo);
		
	}
	  
	  @Override
	public MemberVO memberinfo(String id) throws Exception {//마이페이지에서 회원정보페이지 호출
		
		  return session.selectOne(namespace+".memberinfo",id);
	}
	  
	  @Override
	public void memberinfoedit(MemberVO vo) throws Exception {//마이페이지에서 회원정보수정

		  session.update(namespace+".memberinfoedit",vo);
	}
	  
	  @Override
	public void passwordedit(MemberVO vo) throws Exception {//마이페이지 비밀번호 수정
		
		  session.update(namespace+".loginpwedit",vo);
	}
	  
	  @Override
	public DogVO mydoginfo(String id) throws Exception {//마이페이지 회원 강아지정보
		
		 return session.selectOne(namespace+".mydoginfo",id);
	}
	  
	  @Override
	public void mydogedit(DogVO vo) throws Exception {
		session.update(namespace+".doginfoedit",vo);
		
	}
	  @Override
	public void registermydog(DogVO vo) throws Exception {
		  session.insert(namespace+".insertMemberdog",vo);
		
	}
	  
	  @Override
	public void signbalance(PointVO point) throws Exception {
		session.insert(namespace+".signbalance",point);
		
	}
}
