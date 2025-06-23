package com.chunil.service;

import java.util.List;

import com.chunil.domain.Quality;

public interface QualityService {

	
	
	// 온도 균일성
    List<Quality> getqualityList(Quality quality); 
    
    void savetusTest(Quality quality);
    
    void deltusTest(Quality quality);
    
    
    List<Quality> getHeatTreatingOil(Quality quality); 
    
    void saveHeatTreatingOil(Quality quality);
    
    void delHeatTreatingOil(Quality quality);
}
