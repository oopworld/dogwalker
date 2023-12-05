package com.dogwalker.domain;


public class CartVO {
	private int cart_num; // 카트 번호 (기본 키)
	private int it_num; // 아이템 번호 (외래 키)
	private String id; // 사용자 ID (외래 키)
	private int quantity; // 수량
	
	//추가
	private String it_name;
	private int it_price;
	private String it_img;
	// 기본 생성자
	public CartVO() {}

	// 모든 필드를 매개변수로 받는 생성자
	public CartVO(int cart_num, int it_num, String id, int quantity) {
		this.cart_num = cart_num;
		this.it_num = it_num;
		this.id = id;
		this.quantity = quantity;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public int getIt_num() {
		return it_num;
	}

	public void setIt_num(int it_num) {
		this.it_num = it_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

	public String getIt_name() {
		return it_name;
	}

	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}

	public int getIt_price() {
		return it_price;
	}

	public void setIt_price(int it_price) {
		this.it_price = it_price;
	}
	
	
	public String getIt_img() {
		return it_img;
	}

	public void setIt_img(String it_img) {
		this.it_img = it_img;
	}
	
	
	@Override
	public String toString() {
		return "CartVO [cart_num=" + cart_num + ", it_num=" + it_num + ", id=" + id + ", quantity=" + quantity + ", it_name" + it_name +", it_price" + it_price + "]";
	}
}
