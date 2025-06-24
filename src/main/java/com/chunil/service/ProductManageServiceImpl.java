package com.chunil.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunil.dao.ProductManageDAO;
import com.chunil.domain.DroppedGoods;

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
	

}
