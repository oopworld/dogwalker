package com.dogwalker.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;

@Repository
public class BoarddogDaoImp implements BoarddogDao {

	 @Autowired
	    private SqlSession sqlSession;
	    
	    private static final String NAMESPACE = "Board3"; // BoardMapper의 namespace와 일치해야 함

	    @Override
	    public List<BoarddogVO> list3(Map<String, Object> map) {
	        return sqlSession.selectList(NAMESPACE + ".selectList3", map);
	    }

	    @Override
	    public int getRowCount(Map<String, Object> map) {
	        return sqlSession.selectOne(NAMESPACE + ".selectCount3", map);
	    }

	    @Override
	    public int getNewSeq() {
	        return sqlSession.selectOne(NAMESPACE + ".getNewSeq");
	    }

	    @Override
	    public void insert3(BoarddogVO board3) {
	        sqlSession.insert(NAMESPACE + ".insertBoard3", board3);
	    }

	    @Override
	    public BoarddogVO selectBoard3(Integer seq3) {
	        return sqlSession.selectOne(NAMESPACE + ".selectBoard3", seq3);
	    }

	    @Override
	    public void updateHit3(Integer seq3) {
	        sqlSession.update(NAMESPACE + ".updateHit3", seq3);
	    }

	    @Override
	    public void update3(BoarddogVO board3) {
	        sqlSession.update(NAMESPACE + ".updateBoard3", board3);
	    }

	    @Override
	    public void delete3(Integer seq3) {
	        sqlSession.delete(NAMESPACE + ".deleteBoard3", seq3);
	    }

	    public List<BoarddogVO> selectAll() {
	        // 실제 쿼리를 실행하거나 데이터를 반환하는 로직을 구현해야 합니다.
	        // 예시로 빈 리스트를 반환하는 코드를 작성합니다.
	    	return sqlSession.selectList(NAMESPACE + ".selectList3");
	        //return new ArrayList<>();
	    }

	    @Override
	    public int getNewSeq2() {
	        // TODO Auto-generated method stub
	        return 0;
	    }
	    
		@Override
		public List<BoarddogVO> selectAll3(Integer seq3) {
		    return sqlSession.selectList(NAMESPACE + ".selectAll3", seq3);
		}

		@Override
		public BoarddogVO selectBoard3(int seq3) {
		    return sqlSession.selectOne(NAMESPACE + ".selectBoard3", seq3);
		}

		
}
