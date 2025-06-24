package com.chunil.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chunil.domain.DroppedGoods;

@Repository
public interface ProductManageDAO {
	
	List<DroppedGoods> getDroppedGoodsList();
	
	void updateDroppedGoods(Map<String, Object> param);

}
