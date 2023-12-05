package com.dogwalker.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.MatchingDAO;
import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MatchingVO;

@Service("matchingService")
public class MatchingServiceImpl implements MatchingService {

	@Autowired
	private MatchingDAO matchingDAO;
	
	
	/*@Autowired 
	public MatchingServiceImpl(MatchingDAO matchingDAO) {
		 this.matchingDAO=matchingDAO; 
	}*/
	 
	@Override
	public List<MatchingVO> mList(Map<String, Object> map) {
		return matchingDAO.mList(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return matchingDAO.getRowCount(map);
	}

	@Override
	public MatchingVO selectMatching(int m_num) {
		return matchingDAO.selectMatching(m_num);
	}

	@Override
	public int getNewM_num() {
		return matchingDAO.getNewM_num();
	}

	@Override
	public void mRequest(MatchingVO matching) {
		matchingDAO.mRequest(matching);
	}

	@Override
	public void mLevelUp(int m_num) {
		matchingDAO.mLevelUp(m_num);
	}

	@Override
	public void mReject(int m_num) {
		matchingDAO.mReject(m_num);
	}

	@Override
	public void mCancel(int m_num) {
		matchingDAO.mCancel(m_num);
	}
	
	@Override
	public void mTruc(MatchingVO matching) {
		matchingDAO.mTruc(matching);
	}
	
	@Override
	public int idtodog_id(String id) {
		return matchingDAO.idtodog_id(id);
	}
	
	@Override
	public int idtodate(MatchingVO matching) {
		return matchingDAO.idtodate(matching);
	}
	
	@Override
	public List<DogVO> datetoall(MatchingVO matching) {
		return matchingDAO.datetoall(matching);
	}
	
	@Override
	public MatchingVO dateidtolevel(MatchingVO matching) {
		return matchingDAO.dateidtolevel(matching);
	}
	
	@Override
	public int dateidtocon(MatchingVO matching) {
		return matchingDAO.dateidtocon(matching);
	}
	
	@Override
	public int datedogidtocon(MatchingVO matching) {
		return matchingDAO.datedogidtocon(matching);
	}
	
	@Override
	public MatchingVO datedogidtoline(MatchingVO matching) {
		return matchingDAO.datedogidtoline(matching);
	}
	
	@Override
	public int numtolevel(int m_num) {
		return matchingDAO.numtolevel(m_num);
	}
	
	@Override
	public String idtoname(String id) {
		return matchingDAO.idtoname(id);
	}
	
	@Override
	public String idtophoto(String id) {
		return matchingDAO.idtophoto(id);
	}
	
	@Override
	public String dogtodname(int dog_id) {
		return matchingDAO.dogtodname(dog_id);
	}
	
	@Override
	public String dogtodphoto(int dog_id) {
		return matchingDAO.dogtodphoto(dog_id);
	}
	
	@Override
	public int idtodogcon(String id) {
		return matchingDAO.idtodogcon(id);
	}
}
