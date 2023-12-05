package com.dogwalker.service;

import com.dogwalker.domain.ItemVO;

import java.util.List;

public interface ItemService {
    void insertItem(ItemVO item) throws Exception; //상품등록 메서드 선언
    void deleteItem(int it_num) throws Exception;	// 상품삭제 메서드 선언
    List<ItemVO> getAllItemsList(int offset, int pageSize, String searchWord,String catecode) throws Exception; // 페이징 처리 메서드 선언
	ItemVO getItem(int it_num) throws Exception;	// 상품 수정하는 메서드 선언
	void updateItem(ItemVO item) throws Exception; // 상품 정보를 업데이트하는 메서드 선언
	int countItems() throws Exception; // 총 아이템 수를 반환하는 메서드 선언
	int countItemsByCategory(String catecode) throws Exception; // 카테고리별 아이템 수를 반환하는 메서드 선언
}
