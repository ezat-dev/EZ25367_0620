package com.chunil.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunil.dao.ProductManageDAO;
import com.chunil.domain.DroppedGoods;
import com.chunil.domain.ProductManage;

@Service
public class ProductManageServiceImpl implements ProductManageService{
	
	@Autowired
	private ProductManageDAO productManageDAO;
	
	@Override
  	public List<DroppedGoods> getDroppedGoodsList(){
  		return productManageDAO.getDroppedGoodsList();
  	}
	
	public void updateDroppedGoods(Map<String, Object> param) {
		productManageDAO.updateDroppedGoods(param);
  	}
	
	@Override
	public List<ProductManage> heatTreatmentList(ProductManage productManage) {
		return productManageDAO.heatTreatmentList(productManage);
	}

	@Override
	public int heatTreatmentSave(ProductManage productManage) {
		return productManageDAO.heatTreatmentSave(productManage);
	}

	@Override
	public List<ProductManage> heatTreatmentPumbunList(ProductManage productManage) {
		return productManageDAO.heatTreatmentPumbunList(productManage);
	}

	@Override
	public int heatTreatmentDelete(ProductManage productManage) {
		return productManageDAO.heatTreatmentDelete(productManage);
	}

	@Override
	public List<ProductManage> alarmRecordList(ProductManage productManage) {
		return productManageDAO.alarmRecordList(productManage);
	}

	@Override
	public List<ProductManage> alarmFrequencyList(ProductManage productManage) {
		return productManageDAO.alarmFrequencyList(productManage);
	}

	@Override
	public List<ProductManage> integrationMonitoringList() {
		return productManageDAO.integrationMonitoringList();
	}
}
