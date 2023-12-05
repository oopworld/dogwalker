package com.dogwalker.dao;

//List(레코드 여러개 담을 객체),Map(검색분야,검색어)
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dogwalker.domain.BoardVO;
import com.dogwalker.domain.BoardfreeVO;
import com.dogwalker.domain.BoarddogVO;

@Repository
public interface BoarddogDao {

	//1.글목록보기
	public List<BoarddogVO> list3(Map<String,Object>map);
	
	//2.총레코드수(검색어에 맞는 레코드수까지 포함)
	public int getRowCount(Map<String,Object>map);
	
	//3.최대값 번호 구하기
	public int getNewSeq();
	public int getNewSeq2();
	
	//4.자료실의 글쓰기
	public void insert3(BoarddogVO com);
	
	//5.글상세보기
	public BoarddogVO selectBoard3(Integer seq3);//~(int seq)
	
	//6.게시물번호에 해당하는 조회수 증가
	public void updateHit3(Integer seq3);
	
	//7.글수정하기
	public void update3(BoarddogVO board);
	
	//8.글삭제하기
	public void delete3(Integer seq3);

	
	List<BoarddogVO> selectAll3(Integer seq3);

	public BoarddogVO selectBoard3(int seq3);

	List<BoarddogVO> selectAll();


	//admin
		public interface BoardDAO3 {
		    void insert3(BoarddogVO board3);
		    void update3(BoarddogVO board3);	    
		    void delete3(Integer seq3);
		    BoardVO select3(Integer seq3);
		    BoardVO selectBoard3(Integer seq3);
		    List<BoarddogVO> selectAll3();
		}



	

}
