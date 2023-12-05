package com.dogwalker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.CartDAO;
import com.dogwalker.domain.CartVO;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    
	@Autowired
    private CartDAO cartDAO;
    
    @Override
    public int addCart(CartVO cart) throws Exception {
    	
    	CartVO checkCart = cartDAO.checkCart(cart);
    	if(checkCart != null) {
    		return 2;
    	}
    	//장바구니 등록 & 에러 시 0 반환
    	try {
    		return cartDAO.addCart(cart);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
        
    }

    @Override
    public void deleteCart(int cart_num) {
        cartDAO.deleteCart(cart_num);
    }

    @Override
    public void modifyCount(int cart_num, int quantity) throws Exception {
        cartDAO.modifyCount(cart_num, quantity);
    }

    @Override
    public List<CartVO> getCart(String id) {
        return cartDAO.getCart(id);
    }

    @Override
    public CartVO checkCart(CartVO cart) {
        return cartDAO.checkCart(cart);
    }
}
