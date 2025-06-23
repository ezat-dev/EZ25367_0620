package com.chunil.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunil.dao.StandardDAO;
import com.chunil.domain.Standard;

@Service 
public class StandardServiceImpl implements StandardService{

	@Autowired
	private StandardDAO standardDAO;
	

    	@Override
	    public List<Standard> getNonTimeDataList(Standard standard) {
	        return standardDAO.getNonTimeDataList(standard); 	   
	    }
	    @Override
	    public void saveNonTime(Standard standard) {
	    	standardDAO.saveNonTime(standard); 	   
	    }
	    @Override
	    public void updateNonTime(Standard standard) {
	    	standardDAO.updateNonTime(standard); 	   
	    }
	    
	    @Override
	    public void deleteNonTime(String non_time_idx) {
	    	standardDAO.deleteNonTime(non_time_idx); 	   
	    }
	    @Override
	    public List<Standard> getNonTimeDataView(Standard standard) {
	         return standardDAO.getNonTimeDataView(standard); 	   
	    }
}
