package com.dogwalker.dao;

import java.util.List;

import com.dogwalker.domain.ItemVO;

public interface ItemDAO {

	public List<ItemVO> getAllItemsList(int offset, int pageSize, String searchWord, String catecode) throws Exception; // 페이징 처리된 상품 리스트 메서드 선언
	
    public int insertItem(ItemVO itemVO) throws Exception; // 상품 등록하는 메서드 선언

    public int deleteItem(int it_num) throws Exception;	// 상품을 삭제하는 메서드 선언
    
    public ItemVO getItem(int it_num) throws Exception;	// 상품을 수정하는 메서드 선언
    
    public int updateItem(ItemVO itemVO) throws Exception; // 상품 정보를 업데이트하는 메서드 선언
    
    public int countItems() throws Exception; // 총 상품 수를 반환하는 메서드 선언

    public int countItemsByCategory(String catecode) throws Exception; //카테고리별 상품 수를 반환하는 메서드 선언
 
}
