package com.dogwalker.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.BoarddogDao;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;
@Service
public class BoarddogServiceImpl implements BoarddogService {


	@Autowired
    private BoarddogDao boarddogDao; 
	
	@Override
	public void insert3(BoarddogVO board3) {
		// TODO Auto-generated method stub
		board3.setSeq3(boarddogDao.getNewSeq() + 1);
        boarddogDao.insert3(board3);

	}

	@Override
	public void update3(BoarddogVO board3) {
		// TODO Auto-generated method stub
		 boarddogDao.update3(board3);

	}

	@Override
	public void delete3(Integer seq3) {
		// TODO Auto-generated method stub
		 boarddogDao.delete3(seq3);

	}

	@Override
	public BoarddogVO selectBoard3(Integer seq3) {
		// TODO Auto-generated method stub
		 return boarddogDao.selectBoard3(seq3);
	}

	@Override
	public List<BoarddogVO> list3(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boarddogDao.list3(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boarddogDao.getRowCount(map);
	}

	@Override
	public int getNewSeq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNewSeq2() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHit3(Integer seq3) {
		// TODO Auto-generated method stub
		boarddogDao.updateHit3(seq3);
		
	}







}
