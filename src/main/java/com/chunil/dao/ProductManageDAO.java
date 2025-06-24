package com.chunil.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chunil.domain.DroppedGoods;
import com.chunil.domain.ProductManage;

@Repository
public interface ProductManageDAO {
	
	List<DroppedGoods> getDroppedGoodsList();
	
	void updateDroppedGoods(Map<String, Object> param);

	
	List<ProductManage> heatTreatmentList(ProductManage productManage);

	int heatTreatmentSave(ProductManage productManage);

	List<ProductManage> heatTreatmentPumbunList(ProductManage productManage);

	int heatTreatmentDelete(ProductManage productManage);

	List<ProductManage> alarmRecordList(ProductManage productManage);

	List<ProductManage> alarmFrequencyList(ProductManage productManage);

	List<ProductManage> integrationMonitoringList();
}
