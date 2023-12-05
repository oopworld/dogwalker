package com.dogwalker.domain;

import java.util.List;

public class OrderPageVO {

	private List<OrderPageItemVO> orders;
	
    public List<OrderPageItemVO> getOrders() {
    	return orders;
    }

	public void setOrders(List<OrderPageItemVO> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageVO [orders=" + orders + "]";
	}
    
}
