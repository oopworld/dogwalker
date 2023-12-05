package com.dogwalker.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.BoardVO;


@Repository
public class BoardDaoImp implements BoardDao {

    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "Board"; // BoardMapper의 namespace와 일치해야 함

    @Override
    public List<BoardVO> list(Map<String, Object> map) {
        return sqlSession.selectList(NAMESPACE + ".selectList", map);
    }

    @Override
    public int getRowCount(Map<String, Object> map) {
        return sqlSession.selectOne(NAMESPACE + ".selectCount", map);
    }

    @Override
    public int getNewSeq() {
        return sqlSession.selectOne(NAMESPACE + ".getNewSeq");
    }

    @Override
    public void insert(BoardVO board) {
        sqlSession.insert(NAMESPACE + ".insertBoard", board);
    }

    @Override
    public BoardVO selectBoard(Integer seq) {
        return sqlSession.selectOne(NAMESPACE + ".selectBoard", seq);
    }

    @Override
    public void updateHit(Integer seq) {
        sqlSession.update(NAMESPACE + ".updateHit", seq);
    }

    @Override
    public void update(BoardVO board) {
        sqlSession.update(NAMESPACE + ".updateBoard", board);
    }

    @Override
    public void delete(Integer seq) {
        sqlSession.delete(NAMESPACE + ".deleteBoard", seq);
    }

    public List<BoardVO> selectAll() {
        // 실제 쿼리를 실행하거나 데이터를 반환하는 로직을 구현해야 합니다.
        // 예시로 빈 리스트를 반환하는 코드를 작성합니다.
    	return sqlSession.selectList(NAMESPACE + ".selectList");
        //return new ArrayList<>();
    }

	@Override
	public int getNewSeq2() {
		// TODO Auto-generated method stub
		return 0;
	}
    
 
    
    
}
