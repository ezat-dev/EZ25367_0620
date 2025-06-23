package com.chunil.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chunil.domain.Quality;

@Repository
public class QualityDAOImpl implements QualityDAO{

	@Resource(name="session")
    private SqlSession sqlSession;
	
	 @Override
	    public List<Quality> getqualityList(Quality quality) {
	      
	        return sqlSession.selectList("quality.getqualityList", quality);
	    }
	    @Override
	    public void savetusTest(Quality quality) {
	    	sqlSession.insert("quality.savetusTest",quality);
	    }
	    
	    @Override
	    public void deltusTest(Quality quality) {
	    	sqlSession.delete("quality.deltusTest",quality);
	    }
	    
	    
		 	@Override
		    public List<Quality> getHeatTreatingOil(Quality quality) {
		      
		        return sqlSession.selectList("quality.getHeatTreatingOil", quality);
		    }
		    @Override
		    public void saveHeatTreatingOil(Quality quality) {
		    	sqlSession.update("quality.saveHeatTreatingOil",quality);
		    }
		    
		    @Override
		    public void delHeatTreatingOil(Quality quality) {
		    	sqlSession.update("quality.delHeatTreatingOil",quality);
		    }
}
