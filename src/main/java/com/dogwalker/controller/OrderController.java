package com.dogwalker.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dogwalker.domain.CartVO;
import com.dogwalker.domain.MemberVO;
import com.dogwalker.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	
	@Autowired 
	private OrderService orderService;
	
	
	@PostMapping("/directPurchase")
	public ModelAndView directPurchase(HttpSession session, Model model, CartVO cartVO) {
		String id = (String) session.getAttribute("id");

		MemberVO memberInfo = orderService.getOrderById(id);
		
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("it_name", cartVO.getIt_name());
		model.addAttribute("it_price", cartVO.getIt_price());

		return new ModelAndView("order/order_page");
	}
	@RequestMapping("/payFail")
    public String payFail() {
        return "redirect:/main";  // 'order/pay_fail'는 실패 페이지의 JSP 파일 경로를 나타냅니다. 실제 경로에 따라 수정해주세요.
    }
	
}
