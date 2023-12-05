package com.dogwalker.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.BoardfreeDao;
import com.dogwalker.domain.BoardfreeVO;
@Service
public class BoardfreeServiceImpl implements BoardfreeService {

	@Autowired
    private BoardfreeDao boardfreeDao; 
	
    @Override
    public void insert2(BoardfreeVO board2) {
    	board2.setSeq2(boardfreeDao.getNewSeq()+1);
    	boardfreeDao.insert2(board2);
    }

    @Override
    public void update2(BoardfreeVO board2) {
    	boardfreeDao.update2(board2);
    }

    @Override
    public void delete2(Integer seq2) {
    	boardfreeDao.delete2(seq2);
    }

    @Override
    public BoardfreeVO selectBoard2(Integer seq2) {
        return boardfreeDao.selectBoard2(seq2);
    }

    @Override
    public List<BoardfreeVO> list2(Map<String, Object> map) {
        return boardfreeDao.list2(map);
    }
    @Override
    public int getRowCount(Map<String, Object> map) {
    	// TODO Auto-generated method stub
    	return boardfreeDao.getRowCount(map);
    }
    /*
    @Override
    public List<BoardVO> list(Map<String, Object> map) {
        return sqlSession.selectList(NAMESPACE + ".selectList", map);
    }*/

	@Override
	public int getNewSeq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHit2(Integer seq2) {
		// TODO Auto-generated method stub
		boardfreeDao.updateHit2(seq2);
	}

	@Override
	public int getNewSeq2() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardfreeVO> selectAll2(Integer seq2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardfreeVO selectBoard2(int seq2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardfreeVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
