package com.dogwalker.domain;


public class OrderPageItemVO {

	/* 뷰로부터 전달받을 값 */
    private int it_num;
    
    private int it_count;
    
	/* DB로부터 꺼내올 값 */
    private String it_name;
    
    private int it_price;
    
    private String name;
    
    private String email;
    
    private int phone;
    
	/* 만들어 낼 값 */
    
    private int totalPrice; 
    
	/* 상품 이미지 */
	//private List<AttachImageVO> imageList;	     

	public int getIt_num() {
		return it_num;
	}

	public void setIt_num(int it_num) {
		this.it_num = it_num;
	}

	public int getIt_count() {
		return it_count;
	}

	public void setIt_count(int it_count) {
		this.it_count = it_count;
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


	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void initSaleTotal() {
		this.totalPrice = this.it_price*this.it_count;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "OrderPageItemVO [it_num=" + it_num + ", it_count=" + it_count + ", it_name=" + it_name + ", it_price="
				+ it_price + ", name=" + name + ", email=" + email + ", phone=" + phone + ", totalPrice=" + totalPrice
				+ "]";
	}

	/*
	 * public List<AttachImageVO> getImageList() { return imageList; }
	 */

	/*
	 * public void setImageList(List<AttachImageVO> imageList) { this.imageList =
	 * imageList; }
	 */

	
	
}
