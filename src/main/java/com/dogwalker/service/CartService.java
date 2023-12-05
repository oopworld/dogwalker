package com.dogwalker.service;

import com.dogwalker.domain.CartVO;

import java.util.List;

public interface CartService {
    public int addCart(CartVO cart) throws Exception;	//장바구니 추가
    public void deleteCart(int cart_num);	//장바구니 상품 삭제
    public void modifyCount(int cart_num, int quantity) throws Exception; 	//장바구니 상품수량 수정
    public List<CartVO> getCart(String id);	//사용자 장바구니 목록
    public CartVO checkCart(CartVO cart);	//장바구니 내 상품 목록
}
