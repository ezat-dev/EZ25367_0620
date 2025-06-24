package com.chunil.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chunil.domain.Monitoring;
@Repository
public class MonitoringDAOImpl implements MonitoringDAO{

	
	@Resource(name="session")
    private SqlSession sqlSession;
	
	@Override
    public List<Monitoring> gettrend(Monitoring monitoring) { 
      
        return sqlSession.selectList("monitoring.gettrend", monitoring);
    }
	
	@Override
	public Monitoring alarmList() {
		return sqlSession.selectOne("monitoring.alarmList");
	}
}
