package com.dogwalker.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogwalker.dao.PointChargeDAO;
import com.dogwalker.domain.PointChargeVO;

@Service("pointChargeService")
public class PointChargeServiceImpl implements PointChargeService {

	@Autowired
	private PointChargeDAO pointChargeDAO;

	// 포인트 충전
	@Override
	public void updatebalance(PointChargeVO pointChargeVO)throws Exception{
		pointChargeDAO.updatebalance(pointChargeVO);
	
	}
	@Override
	public void inserthistory(PointChargeVO pointChargeVO)throws Exception{
		pointChargeDAO.inserthistory(pointChargeVO);
	
	}
	
	//넘사벽 갓건하 피드백 반박시 꿀밤

	/*
	 * @Override public int getTotalPoint(String user_id) { return
	 * pointChargeDAO.getTotalPoint(user_id); }
	 * 
	 * @Override public int insertPointCharge(PointChargeVO pointCharge) { return
	 * pointChargeDAO.insertPointCharge(pointCharge); }
	 * 
	 * @Override public List<PointChargeVO> getPointChargeHistory(String user_id) {
	 * return pointChargeDAO.getPointChargeHistory(user_id); }
	 * 
	 * 
	 * 
	 * 
	 * @Autowired public PointChargeServiceImpl(PointChargeDAO pointDAO) {
	 * this.pointDAO = pointDAO; }
	 * 
	 * 
	 * @Override public PointChargeVO getChargeInfo(String id) { return
	 * pointDAO.getChargeInfo(id); }
	 * 
	 * @Override public void addChargeInfo(PointChargeVO pointChargeVO) {
	 * pointDAO.addChargeInfo(pointChargeVO); }
	 * 
	 * @Override public void updateChargeInfo(PointChargeVO pointChargeVO) {
	 * pointDAO.updateChargeInfo(pointChargeVO); }
	 * 
	 * @Override public void deleteChargeInfo(String id) {
	 * pointDAO.deleteChargeInfo(id); }
	 * 
	 * @Override public void pointCharge(PointChargeVO pointChargeVO) {
	 * 
	 * pointChargeVO.setSaveTime(new Date());
	 * 
	 * Map<String, Object> paramMap = new HashMap<>(); paramMap.put("id",
	 * pointChargeVO.getId()); paramMap.put("amount", pointChargeVO.getAmount());
	 * 
	 * pointDAO.addChargeInfo(pointChargeVO); pointDAO.pointCharge(paramMap);
	 * 
	 * pointDAO.pointCharge(pointChargeVO); }
	 * 
	 * @Override public void pointSave(PointChargeVO pointChargeVO) {
	 * 
	 * pointChargeVO.setSaveTime(new Date()); pointDAO.addChargeInfo(pointChargeVO);
	 * 
	 * pointDAO.pointSave(pointChargeVO); }
	 * 
	 * 
	 * @Override public void insertPoint(PointChargeVO pointVO) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @Override public List<PointChargeVO> selectPointList() { // TODO
	 * Auto-generated method stub return null; }
	 */
}
