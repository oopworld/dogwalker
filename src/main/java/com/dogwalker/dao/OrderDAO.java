package com.dogwalker.dao;

import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.OrderPageItemVO;

public interface OrderDAO {
	void placeOrder(OrderPageItemVO order);

	MemberVO selectOrderById(String id);
}
