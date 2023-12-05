package com.dogwalker.dao;

import com.dogwalker.domain.CartVO;

import java.util.List;

public interface CartDAO {
    public int addCart(CartVO cart) throws Exception;	// 장바구니에 상품 추가하는 메서드 선언
    public void deleteCart(int cart_num);	// 장바구니에 상품 삭제하는 메서드 선언
    public void modifyCount(int cart_num, int quantity) throws Exception;	// 장바구니 상품 수량 수정하는 메서드 선언
    public List<CartVO> getCart(String id);	//사용자의 장바구니 목록 조회 메서드 선언
    public CartVO checkCart(CartVO cart);	// 장바구니 내 상품 확인 메서드 선언
}
