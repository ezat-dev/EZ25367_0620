package com.chunil.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chunil.domain.Standard;

public interface StandardDAO {	
	//비가동 현황
	List<Standard> getNonTimeDataList(Standard standard);
	void saveNonTime(Standard standard); 
	void updateNonTime(Standard standard); 
	void deleteNonTime(String non_time_idx); 
	//비가동 뷰
	List<Standard> getNonTimeDataView(Standard standard);
}
