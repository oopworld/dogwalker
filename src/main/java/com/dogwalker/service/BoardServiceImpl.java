package com.dogwalker.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.BoardDao;
import com.dogwalker.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDAO;

    @Override
    public void insert(BoardVO board) {
    	board.setSeq(boardDAO.getNewSeq()+1);
        boardDAO.insert(board);
    }

    @Override
    public void update(BoardVO board) {
        boardDAO.update(board);
    }

    @Override
    public void delete(Integer seq) {
        boardDAO.delete(seq);
    }

    @Override
    public BoardVO selectBoard(Integer seq) {
        return boardDAO.selectBoard(seq);
    }

    @Override
    public List<BoardVO> list(Map<String, Object> map) {
        return boardDAO.list(map);
    }
    @Override
    public int getRowCount(Map<String, Object> map) {
    	// TODO Auto-generated method stub
    	return boardDAO.getRowCount(map);
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
	public void updateHit(Integer seq) {
		// TODO Auto-generated method stub
		boardDAO.updateHit(seq);
	}
}
