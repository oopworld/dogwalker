package com.dogwalker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.MemberDAO;
import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.PointVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Override
	public String login(String id) throws Exception {

		return dao.login(id);
	}
	
	
	  @Override 
	  public void signup(MemberVO vo) throws Exception {

		dao.signup(vo);
	  }
	 
	  @Override
	  public Integer idcheck(String id) throws Exception {
		
		return dao.idcheck(id);
	}
	  
	  @Override
	public void loginRegist(MemberVO vo) throws Exception {
		dao.loginRegist(vo); 
		
	}
	  
	  @Override
	public MemberVO memberinfo(String id) throws Exception {
		MemberVO vo=dao.memberinfo(id);
		return vo;
	}
	  
	  @Override
	public void memberinfoedit(MemberVO vo) throws Exception {
		dao.memberinfoedit(vo);
		
	}
	  
	  @Override
	public void passwordedit(MemberVO vo) throws Exception {
		dao.passwordedit(vo);
		
	}
	  
	  @Override
	public DogVO mydoginfo(String id) throws Exception {
		return dao.mydoginfo(id);
		
	}
	  
	  @Override
	public void mydogedit(DogVO vo) throws Exception {
		dao.mydogedit(vo);
		
	}
	  
	  @Override
	public void registermydog(DogVO vo) throws Exception {
		dao.registermydog(vo);
		
	}
	  @Override
	public void signbalance(PointVO vo) throws Exception {
		dao.signbalance(vo);
		
	}
}
