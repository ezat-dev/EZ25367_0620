package com.chunil.service;

import java.util.List;

import com.chunil.domain.Standard;




public interface StandardService {

	//비가동 현황
	List<Standard> getNonTimeDataList(Standard standard);
	void saveNonTime(Standard standard); 
	void updateNonTime(Standard standard); 
	void deleteNonTime(String non_time_idx); 
	//비가동 뷰
	List<Standard> getNonTimeDataView(Standard standard);
}
