package com.dogwalker.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.DogVO;
import com.dogwalker.domain.MatchingVO;

@Repository
public class MatchingDAOImpl implements MatchingDAO {

	@Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "Matching";
    
	@Override
	public List<MatchingVO> mList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectList", map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectCount", map);
	}

	@Override
	public MatchingVO selectMatching(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".selectLine", m_num);
	}

	@Override
	public int getNewM_num() {
		return sqlSession.selectOne(NAMESPACE + ".getNewM_num");
	}

	@Override
	public void mRequest(MatchingVO matching) {
		sqlSession.insert(NAMESPACE + ".requestMatching", matching);
	}

	@Override
	public void mLevelUp(int m_num) {
		sqlSession.update(NAMESPACE + ".levelUp", m_num);
	}

	@Override
	public void mReject(int m_num) {
		sqlSession.delete(NAMESPACE + ".rejectMatching", m_num);
	}

	@Override
	public void mCancel(int m_num) {
		sqlSession.update(NAMESPACE + ".cancelWalking", m_num);
	}
	
	@Override
	public void mTruc(MatchingVO matching) {
		sqlSession.delete(NAMESPACE + ".trucMatching", matching);
	}
	
	@Override
	public int idtodog_id(String id) {
		return sqlSession.selectOne(NAMESPACE + ".idtodog_id", id);
	}
	
	@Override
	public int idtodate(MatchingVO matching) {
		return sqlSession.selectOne(NAMESPACE + ".idtodate", matching);
	}
	
	@Override
	public List<DogVO> datetoall(MatchingVO matching) {
		return sqlSession.selectList(NAMESPACE + ".datetoall", matching);
	}

	@Override
	public MatchingVO dateidtolevel(MatchingVO matching) {
		return sqlSession.selectOne(NAMESPACE + ".dateidtolevel", matching);
	}
	
	@Override
	public int dateidtocon(MatchingVO matching) {
		return sqlSession.selectOne(NAMESPACE + ".dateidtocon", matching);
	}
	
	@Override
	public int datedogidtocon(MatchingVO matching) {
		return sqlSession.selectOne(NAMESPACE + ".datedogidtocon", matching);
	}
	
	@Override
	public MatchingVO datedogidtoline(MatchingVO matching) {
		return sqlSession.selectOne(NAMESPACE + ".datedogidtoline", matching);
	}
	
	@Override
	public int numtolevel(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".numtolevel", m_num);
	}
	
	@Override
	public String idtoname(String id) {
		return sqlSession.selectOne(NAMESPACE + ".idtoname", id);
	}
	
	@Override
	public String idtophoto(String id) {
		return sqlSession.selectOne(NAMESPACE + ".idtophoto", id);
	}
	
	@Override
	public String dogtodname(int dog_id) {
		return sqlSession.selectOne(NAMESPACE + ".dogtodname", dog_id);
	}
	
	@Override
	public String dogtodphoto(int dog_id) {
		return sqlSession.selectOne(NAMESPACE + ".dogtodphoto", dog_id);
	}
	
	@Override
	public int idtodogcon(String id) {
		return sqlSession.selectOne(NAMESPACE + ".idtodogcon", id);
	}
}
