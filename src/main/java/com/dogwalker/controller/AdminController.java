package com.dogwalker.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model,HttpSession session) {
		if(session.getAttribute("id")==null || !session.getAttribute("id").equals("admin11")) {
			return "redirect:/main";
		}
		
		logger.info("Welcome admin! The client locale is {}.");
		
		
		return "/admin/adminPage";
	}
	
}
