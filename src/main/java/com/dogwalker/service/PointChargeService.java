package com.dogwalker.service;

import com.dogwalker.domain.PointChargeVO;

public interface PointChargeService {

	// 포인트 충전 메소드
	public void updatebalance(PointChargeVO pointChargeVO)throws Exception;
	
	public void inserthistory(PointChargeVO pointChargeVO)throws Exception;

	/*
	 * // 포인트 충전 메소드 int insertPointCharge(PointChargeVO pointCharge);
	 * 
	 * // 포인트 충전 내역 및 이력 조회 메소드 List<PointChargeVO> getPointChargeHistory(String
	 * user_id); //포인트 충전 public void updateCharge(PointChargeVO pointCharge);
	 * 
	 * public PointChargeVO getChargeInfo(String id);
	 * 
	 * public void addChargeInfo(PointChargeVO pointChargeVO);
	 * 
	 * public void updateChargeInfo(PointChargeVO pointChargeVO);
	 * 
	 * public void deleteChargeInfo(String id);
	 * 
	 * public void pointCharge(PointChargeVO pointChargeVO);
	 * 
	 * public void pointSave(PointChargeVO pointChargeVO);
	 */

}