package com.chunil.dao;

import java.util.List;

import com.chunil.domain.Monitoring;

public interface MonitoringDAO {

	
	List<Monitoring> gettrend(Monitoring monitoring); 
	
	Monitoring alarmList();
}
