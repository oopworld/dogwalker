package com.dogwalker.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dogwalker.domain.ItemVO;
import com.dogwalker.service.ItemService;
import com.dogwalker.util.FileUtil;
import com.dogwalker.util.Pagination;

@Controller
@RequestMapping("/admin")
public class AdminItemController {

    private final ItemService itemService;
    
    @Autowired
    public AdminItemController(ItemService itemService) {
        this.itemService = itemService;
    }
    
    
    /*상품 목록 조회*/
    
    @GetMapping("/admin_itlist")
    public String itemList(Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "8") int pageSize,
            @RequestParam(value ="searchWord", required = false) String searchWord,
            @RequestParam(value ="catecode", required = false) String catecode,
            HttpSession session) throws Exception {
        
    	if(session.getAttribute("id")==null || !session.getAttribute("id").equals("admin11")) {
			return "redirect:/main";
		}
        
        
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
        
        List<ItemVO> adminItems = itemService.getAllItemsList(pagination.getOffset(), pageSize, searchWord, catecode);
        
        model.addAttribute("catecode", catecode);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("totalPages", pagination.getTotalPages());
        model.addAttribute("startPage", pagination.getStartPage());
        model.addAttribute("endPage", pagination.getEndPage());
        model.addAttribute("page", page);
        model.addAttribute("adminItems", adminItems);
        
        
        return "admin/admin_itlist";
    }


    
    //상품 등록
    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ItemVO item, @RequestParam("insertImg") MultipartFile file) throws Exception {
        handleFileUpload(item, file);
        itemService.insertItem(item);
        return "redirect:/admin/admin_itlist";
    }
    
    
    //상품 수정
    @PostMapping("/updateProduct")
    public String updateProduct(@ModelAttribute ItemVO item, @RequestParam("insertImg") MultipartFile file, 
                                @RequestParam("it_num") int it_num, @RequestParam("page") int page) throws Exception {

    	item.setIt_num(it_num);
    	if (file.isEmpty()) {
            item.setIt_img(itemService.getItem(it_num).getIt_img());
        } else {
            handleFileUpload(item, file);
        }

        itemService.updateItem(item);
        return "redirect:/admin/admin_itlist?page=" + page;
    }
    
    
    //상품 삭제
    @PostMapping("/deleteProduct")
    public String deleteItem(@RequestParam int it_num) throws Exception {
        itemService.deleteItem(it_num);
        return "redirect:/admin/admin_itlist";
    }
    
    
    //파일 업로드 처리
    private void handleFileUpload(ItemVO item, MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String savedFileName = FileUtil.rename(file.getOriginalFilename());
            File uploadFile = new File(FileUtil.UPLOAD_PATH, savedFileName);
            file.transferTo(uploadFile);
            item.setIt_img("/resources/upload/" + savedFileName);
        }
    }
}
