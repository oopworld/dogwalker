package com.dogwalker.dao;

//List(레코드 여러개 담을 객체),Map(검색분야,검색어)
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
@Repository
public interface BoardfreeDao {

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


	//admin
	public interface BoardDAO2 {
	    void insert2(BoardfreeVO board2);
	    void update2(BoardfreeVO board2);	    
	    void delete2(Integer seq2);
	    BoardVO select2(Integer seq2);
	    BoardVO selectBoard2(Integer seq2);
	    List<BoardfreeVO> selectAll2();
	}
	

}
