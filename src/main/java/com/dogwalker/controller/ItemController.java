package com.dogwalker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dogwalker.domain.ItemVO;
import com.dogwalker.service.ItemService;
import com.dogwalker.util.Pagination;

@Controller
@RequestMapping("/items")
public class ItemController {

    private final ItemService itemService;

    @Autowired
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }
    //상품리스트 페이지
    @GetMapping("/it_list")
    public String itemList(Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
            @RequestParam(value ="searchWord", required = false) String searchWord,
            @RequestParam(value ="catecode", required = false) String catecode) throws Exception {
        
        
        
        if(searchWord == null || searchWord.isEmpty()) {
            searchWord = "";
        }

        if(catecode == null) {
            catecode = "";
        }
        
        int totalItems;
        if (catecode != null && !catecode.isEmpty()) {
            totalItems = itemService.countItemsByCategory(catecode);
        } else {
            totalItems = itemService.countItems();
        }
        
        Pagination pagination = new Pagination(page, pageSize, totalItems);
        
        List<ItemVO> items = itemService.getAllItemsList(pagination.getOffset(), pageSize, searchWord, catecode);
        
        model.addAttribute("catecode", catecode);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("totalPages", pagination.getTotalPages());
        model.addAttribute("startPage", pagination.getStartPage());
        model.addAttribute("endPage", pagination.getEndPage());
        model.addAttribute("page", page);
        model.addAttribute("items", items);
        
        return "items/it_list"; 
    }



    
	//상품상세페이지
    @GetMapping("/it_detail/{it_num}")  //it_num은 상품번호
    public String getItem(Model model, @PathVariable("it_num") int it_num) throws Exception {
        ItemVO item = itemService.getItem(it_num);
        model.addAttribute("item", item);
        return "items/it_detail";
    }
	///////////////////////////////////////////////////////////////상품 관련 컨트롤러///////////////////////////////////////////////////////
    
    
}    
