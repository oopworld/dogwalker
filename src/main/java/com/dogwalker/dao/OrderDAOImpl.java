package com.dogwalker.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.MemberVO;
import com.dogwalker.domain.OrderPageItemVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void placeOrder(OrderPageItemVO order) {
        sqlSession.insert("OrderMapper.placeOrder", order);
    }

    @Override
    public MemberVO selectOrderById(String id) {
        return sqlSession.selectOne("OrderMapper.selectOrderById", id);
    }
}
