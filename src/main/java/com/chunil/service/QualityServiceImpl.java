package com.chunil.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunil.dao.QualityDAO;
import com.chunil.domain.Quality;
@Service
public class QualityServiceImpl implements QualityService{

	@Autowired  
	private QualityDAO qualityDao;
	
	@Override
	public List<Quality> getqualityList(Quality quality) {
	    return qualityDao.getqualityList(quality); 	   
	}
	@Override
    public void savetusTest(Quality quality) {
		qualityDao.savetusTest(quality);
    }
	@Override
    public void deltusTest(Quality quality) {
		qualityDao.deltusTest(quality);
    }
	
	@Override
	public List<Quality> getHeatTreatingOil(Quality quality) {
	    return qualityDao.getHeatTreatingOil(quality); 	   
	}
	@Override
    public void saveHeatTreatingOil(Quality quality) {
		qualityDao.saveHeatTreatingOil(quality);
    }
	@Override
    public void delHeatTreatingOil(Quality quality) {
		qualityDao.delHeatTreatingOil(quality);
    }
	
	
	@Override
	public List<Quality> getFproof(Quality quality) {
	    return qualityDao.getFproof(quality); 	   
	}
	@Override
    public void saveFproof(Map<String, Object> param) {
		qualityDao.saveFproof(param);
    }
	@Override
    public void delFproof(Quality quality) {
		qualityDao.delFproof(quality);
    }
	
	
	
	
}
