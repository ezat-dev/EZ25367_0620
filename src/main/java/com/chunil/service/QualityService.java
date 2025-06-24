package com.chunil.service;

import java.util.List;
import java.util.Map;

import com.chunil.domain.Quality;

public interface QualityService {

	
	
	// 온도 균일성
    List<Quality> getqualityList(Quality quality); 
    
    void savetusTest(Quality quality);
    
    void deltusTest(Quality quality);
    
    //열처리유 성산분석
    List<Quality> getHeatTreatingOil(Quality quality); 
    
    void saveHeatTreatingOil(Quality quality);
    
    void delHeatTreatingOil(Quality quality);
    
    //f/r
    List<Quality> getFproof(Quality quality); 
    
    void saveFproof(Map<String, Object> param);
    
    void delFproof(Quality quality);
    
	Quality cpkStandardList(Quality quality);

	List<Quality> cpkValueList(Quality quality);
    
}
