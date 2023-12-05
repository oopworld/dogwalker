package com.dogwalker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dogwalker.dao.OrderDAO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.OrderPageItemVO;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Transactional
    @Override
    public void placeOrder(OrderPageItemVO order) {
        orderDAO.placeOrder(order);
    }

    @Override
    public MemberVO getOrderById(String id) {
        return orderDAO.selectOrderById(id);
    }
}
