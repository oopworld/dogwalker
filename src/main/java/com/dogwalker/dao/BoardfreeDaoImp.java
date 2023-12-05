package com.dogwalker.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.BoardfreeVO;

@Repository
public class BoardfreeDaoImp implements BoardfreeDao {

    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "Board2"; // BoardMapper의 namespace와 일치해야 함

    @Override
    public List<BoardfreeVO> list2(Map<String, Object> map) {
        return sqlSession.selectList(NAMESPACE + ".selectList2", map);
    }

    @Override
    public int getRowCount(Map<String, Object> map) {
        return sqlSession.selectOne(NAMESPACE + ".selectCount2", map);
    }

    @Override
    public int getNewSeq() {
        return sqlSession.selectOne(NAMESPACE + ".getNewSeq");
    }

    @Override
    public void insert2(BoardfreeVO board2) {
        sqlSession.insert(NAMESPACE + ".insertBoard2", board2);
    }

    @Override
    public BoardfreeVO selectBoard2(Integer seq2) {
        return sqlSession.selectOne(NAMESPACE + ".selectBoard2", seq2);
    }

    @Override
    public void updateHit2(Integer seq2) {
        sqlSession.update(NAMESPACE + ".updateHit2", seq2);
    }

    @Override
    public void update2(BoardfreeVO board2) {
        sqlSession.update(NAMESPACE + ".updateBoard2", board2);
    }

    @Override
    public void delete2(Integer seq2) {
        sqlSession.delete(NAMESPACE + ".deleteBoard2", seq2);
    }


    @Override
    public int getNewSeq2() {
        // TODO: 실제 쿼리 실행 로직 작성
    	return sqlSession.selectOne(NAMESPACE + ".getNewSeq2");
    }


	@Override
	public List<BoardfreeVO> selectAll2(Integer seq2) {
	    return sqlSession.selectList(NAMESPACE + ".selectAll2", seq2);
	}


	
}
