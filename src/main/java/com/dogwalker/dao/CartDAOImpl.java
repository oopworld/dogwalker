package com.dogwalker.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public int addCart(CartVO cart) {	// 장바구니 추가 메서드 구현
        return sqlSession.insert("CartMapper.addCart", cart);
    }

    @Override
    public void deleteCart(int cart_num) {	// 장바구니 상품 삭제 메서드 구현
        sqlSession.delete("CartMapper.deleteCart", cart_num);
    }

    @Override
    public void modifyCount(int cart_num, int quantity) {	// 상품 수량 수정 메서드 구현
        sqlSession.update("CartMapper.modifyCount", new HashMap<String, Object>() {{
            put("cart_num", cart_num);
            put("quantity", quantity);
        }});
    }

    @Override
    public List<CartVO> getCart(String id) {	// 사용자 장바구니 목록 조회 메서드 구현
        return sqlSession.selectList("CartMapper.getCart", id);
    }

    @Override
    public CartVO checkCart(CartVO cart) {	//장바구니 내 상품 메서드 구현
        return sqlSession.selectOne("CartMapper.checkCart", cart);
    }

}
