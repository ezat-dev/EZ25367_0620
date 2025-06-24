package com.chunil.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunil.dao.MonitoringDAO;
import com.chunil.domain.Monitoring;
@Service
public class MonitoringServiceImpl implements MonitoringService{
	
	@Autowired
	private MonitoringDAO monitoringDao;
	
	@Override
	public List<Monitoring > gettrend(Monitoring monitoring) {
	    return monitoringDao.gettrend(monitoring); 	   
	}
}
