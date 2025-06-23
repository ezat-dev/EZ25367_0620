package com.chunil.dao;

import java.util.List;

import com.chunil.domain.Quality;

public interface QualityDAO {

	
	
    List<Quality> getqualityList(Quality quality); 
    
    void savetusTest(Quality quality);
    
    void deltusTest(Quality quality);
    
    List<Quality> getHeatTreatingOil(Quality quality); 
    
    void saveHeatTreatingOil(Quality quality);
    
    void delHeatTreatingOil(Quality quality);
}
