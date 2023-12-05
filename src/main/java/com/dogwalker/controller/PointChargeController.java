package com.dogwalker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dogwalker.domain.PointChargeVO;
import com.dogwalker.service.PointChargeService;

@Controller
public class PointChargeController {

	@Autowired
	private PointChargeService pointChargeService;
	
	@GetMapping("/chargeForm")
	public String chargeForm(@SessionAttribute("id") String id) {
		return "member/mypage_dogcoin_fee";
	}
	@PostMapping("/charge")
	@ResponseBody
	public String addPoint(@RequestParam(value="amount")int amount,
						@SessionAttribute("id")String id, PointChargeVO vo) {
		try {
			vo.setAmount(amount);
			vo.setId(id);
			vo.setHistory("포인트 충전");
			pointChargeService.updatebalance(vo);
			pointChargeService.inserthistory(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "member/mypage_dogcoin_fee";
		}
		
		return "success";
	}
	
}
	
	
	
	
	//넘사벽 갓건하 피드백 반박시 꿀밤

	
