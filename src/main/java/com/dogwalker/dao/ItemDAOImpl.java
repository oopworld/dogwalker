package com.dogwalker.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {

    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.dogwalker.mappers.ItemMapper";

    @Override
    public List<ItemVO> getAllItemsList(int offset, int pageSize, String searchWord,String catecode) { // 페이징 처리된 상품 리스트 메서드 구현
        return sqlSession.selectList(NAMESPACE + ".getAllItemsList", Map.of("offset", offset, "pageSize", pageSize, "searchWord", searchWord,"catecode", catecode));  // map.of -> offset과 pageSize 값을 포함하는 불변 맵을 생성하고, 이를 MyBatis 쿼리에 매개변수로 전달
    }
    
    @Override
    public int insertItem(ItemVO itemVO) {	// 상품 등록 메서드 구현
        return sqlSession.insert(NAMESPACE + ".insertItem", itemVO);
    }

    @Override
    public int deleteItem(int it_num) {	// 상품 삭제 메서드 구현
        return sqlSession.delete(NAMESPACE + ".deleteItem", it_num);
    }

    @Override
    public ItemVO getItem(int it_num) {	// 상품 수정 메서드 구현
        return sqlSession.selectOne(NAMESPACE + ".getItem", it_num);
    }
    
    @Override
    public int updateItem(ItemVO itemVO) { // 상품 정보를 업데이트하는 메서드 구현
        return sqlSession.update(NAMESPACE + ".updateItem", itemVO);
    }
	
    @Override
    public int countItems() throws Exception {	// 총 아이템 수를 반환하는 메서드 구현
    	return sqlSession.selectOne(NAMESPACE + ".countItems");
    }
    
    @Override
    public int countItemsByCategory(String catecode) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".countItemsByCategory", catecode);
    }
}
