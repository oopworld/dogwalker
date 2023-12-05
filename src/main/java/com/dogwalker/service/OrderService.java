package com.dogwalker.service;

import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.OrderPageItemVO;

public interface OrderService {
	
	void placeOrder(OrderPageItemVO order);

	MemberVO getOrderById(String id);
}
