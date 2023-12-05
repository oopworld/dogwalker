package com.dogwalker.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogwalker.domain.PointChargeVO;

@Repository
public class PointChargeDAOImpl implements PointChargeDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "Point";

	@Override
	public void updatebalance(PointChargeVO pointChargeVO) {
		sqlSession.update(namespace + ".updatebalance", pointChargeVO);
	}
	
	@Override
	public void inserthistory(PointChargeVO pointChargeVO) {
		sqlSession.insert(namespace + ".inserthistory", pointChargeVO);
	}
	
	//넘사벽

	/*
	 * @Override public int insertPointCharge(PointChargeVO pointCharge) { return
	 * sqlSession.insert(namespace + ".insertPointCharge", pointCharge); }
	 * 
	 * @Override public List<PointChargeVO> getPointChargeHistory(String user_id) {
	 * return sqlSession.selectList(namespace + ".getPointChargeHistory", user_id);
	 * } //포인트 충전
	 * 
	 * @Override public void updateCharge(PointChargeVO pointCharge) {
	 * sqlSession.update( namespace + ".getTotalPoint", pointCharge); }
	 * 
	 * 
	 * @Autowired public PointChargeDAOImpl(SqlSession sqlSession) { this.sqlSession
	 * = sqlSession; }
	 * 
	 * 
	 * @Override public PointChargeVO getChargeInfo(String id) { return
	 * sqlSession.selectOne(namespace+".getChargeInfo", id); }
	 * 
	 * @Override public void addChargeInfo(PointChargeVO pointChargeVO) {
	 * sqlSession.insert(namespace+".addChargeInfo", pointChargeVO); }
	 * 
	 * @Override public void updateChargeInfo(PointChargeVO pointChargeVO) {
	 * sqlSession.update(namespace+".updateChargeInfo", pointChargeVO); }
	 * 
	 * @Override public void deleteChargeInfo(String id) {
	 * sqlSession.delete(namespace+".deleteChargeInfo", id); }
	 * 
	 * @Override public void pointCharge(PointChargeVO pointChargeVO) {
	 * sqlSession.update(namespace+".pointCharge", pointChargeVO); }
	 * 
	 * @Override public void pointSave(PointChargeVO pointChargeVO) {
	 * sqlSession.insert(namespace+".pointSave", pointChargeVO); }
	 */
}