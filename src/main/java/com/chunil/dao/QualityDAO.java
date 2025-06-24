package com.chunil.dao;

import java.util.List;
import java.util.Map;

import com.chunil.domain.Quality;

public interface QualityDAO {

	
	
    List<Quality> getqualityList(Quality quality); 
    
    void savetusTest(Quality quality);
    
    void deltusTest(Quality quality);
    
    
    List<Quality> getHeatTreatingOil(Quality quality); 
    
    void saveHeatTreatingOil(Quality quality);
    
    void delHeatTreatingOil(Quality quality);
    
    
    //f/r
    List<Quality> getFproof(Quality quality); 
    
    void saveFproof(Map<String, Object> param);
    
    void delFproof(Quality quality);
}
