package com.dogwalker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.ItemDAO;
import com.dogwalker.domain.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
    
	private final ItemDAO itemDAO;

    @Autowired
    public ItemServiceImpl(ItemDAO itemDAO ) {
        this.itemDAO  = itemDAO ;
    } 

    @Override
    public List<ItemVO> getAllItemsList(int offset, int pageSize, String searchWord, String catecode) throws Exception {
        return itemDAO.getAllItemsList(offset, pageSize, searchWord, catecode); // 페이징 처리된 상품 리스트 가져오기
    }
    
    @Override
    public void insertItem(ItemVO item) throws Exception {
    	itemDAO .insertItem(item);
    }

    @Override
    public void deleteItem(int it_num) throws Exception {
    	itemDAO .deleteItem(it_num);
    }
    
    @Override
    public ItemVO getItem(int it_num) throws Exception {
        return itemDAO .getItem(it_num);
    }
    
    @Override
    public void updateItem(ItemVO item) throws Exception { // 상품 정보를 업데이트하는 메서드 구현
        itemDAO.updateItem(item);
    }
    
    @Override
    public int countItems() throws Exception { // 총 아이템 수를 반환하는 메서드 구현
        return itemDAO.countItems();
    }
    
    @Override
    public int countItemsByCategory(String catecode) throws Exception { //카테고리별 아이템 수를 반환하는 메서드 구현
        return itemDAO.countItemsByCategory(catecode);
    }
}
