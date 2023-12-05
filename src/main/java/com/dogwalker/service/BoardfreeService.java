package com.dogwalker.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dogwalker.domain.BoardfreeVO;
@Service
public interface BoardfreeService {
	//1.글목록보기
	public List<BoardfreeVO> list2(Map<String,Object>map);
	
	//2.총레코드수(검색어에 맞는 레코드수까지 포함)
	public int getRowCount(Map<String,Object>map);
	
	//3.최대값 번호 구하기
	public int getNewSeq();
	public int getNewSeq2();
	
	//4.자료실의 글쓰기
	public void insert2(BoardfreeVO com);
	
	//5.글상세보기
	public BoardfreeVO selectBoard2(Integer seq2);//~(int seq)
	
	//6.게시물번호에 해당하는 조회수 증가
	public void updateHit2(Integer seq2);
	
	//7.글수정하기
	public void update2(BoardfreeVO board2);
	
	//8.글삭제하기
	public void delete2(Integer seq2);

	List<BoardfreeVO> selectAll2(Integer seq2);

	public BoardfreeVO selectBoard2(int seq2);

	List<BoardfreeVO> selectAll();

    
}
