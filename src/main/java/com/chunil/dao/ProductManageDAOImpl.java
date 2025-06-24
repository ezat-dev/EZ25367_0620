package com.chunil.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.chunil.domain.DroppedGoods;
import com.chunil.domain.ProductManage;

@Repository
public class ProductManageDAOImpl implements ProductManageDAO {
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Override
	public List<DroppedGoods> getDroppedGoodsList() {
		return sqlSession.selectList("droppedGoods.getDroppedGoodsList");
	}
	
	public void updateDroppedGoods(Map<String, Object> param) {
  		sqlSession.update("droppedGoods.updateDroppedGoods",param);
  	}
	@Override
	public List<ProductManage> heatTreatmentList(ProductManage productManage) {
		return sqlSession.selectList("productManage.heatTreatmentList",productManage);
	}

	@Override
	public int heatTreatmentSave(ProductManage productManage) {
		//이미 있는지 없는지
		int chkValue = 0;
		ProductManage chkProductManage = sqlSession.selectOne("productManage.heatTreatmentDuplicateChk",productManage);
		
		if(chkProductManage == null) {
			sqlSession.insert("productManage.heatTreatmentSave",productManage);
			chkValue = 0;
		}else {
			sqlSession.update("productManage.heatTreatmentUpdate",productManage);
			chkValue = 1;
		}
		
		return chkValue;
	}

	@Override
	public List<ProductManage> heatTreatmentPumbunList(ProductManage productManage) {
		return sqlSession.selectList("productManage.heatTreatmentPumbunList",productManage);
	}

	@Override
	public int heatTreatmentDelete(ProductManage productManage) {
		return sqlSession.delete("productManage.heatTreatmentDelete",productManage);
	}

	@Override
	public List<ProductManage> alarmRecordList(ProductManage productManage) {
		return sqlSession.selectList("productManage.alarmRecordList",productManage);
	}

	@Override
	public List<ProductManage> alarmFrequencyList(ProductManage productManage) {
		return sqlSession.selectList("productManage.alarmFrequencyList",productManage);
	}

	@Override
	public List<ProductManage> integrationMonitoringList() {
		return sqlSession.selectList("productManage.integrationMonitoringList");
	}

}
