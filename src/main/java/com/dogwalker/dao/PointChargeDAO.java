package com.dogwalker.dao;

import com.dogwalker.domain.PointChargeVO;

public interface PointChargeDAO {

	// 포인트 충전 메소드
	public void updatebalance(PointChargeVO pointChargeVO);
	//로그확인
	public void inserthistory(PointChargeVO pointChargeVO);
	
	
	
	//넘사벽 갓건하 피드백 반박시 꿀밤

	/*
	 * // 포인트 충전 메소드 int insertPointCharge(PointChargeVO pointCharge);
	 * 
	 * // 포인트 충전 내역 및 이력 조회 메소드 List<PointChargeVO> getPointChargeHistory(String
	 * user_id); //포인트 충전 맵 public void updateCharge(PointChargeVO pointCharge);
	 * 
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
	 * 
	 * public void pointCharge(String id, int p_point);
	 * 
	 * 
	 */
}