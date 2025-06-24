package com.chunil.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunil.domain.Monitoring;
import com.chunil.service.MonitoringService;

@Controller
public class MonitoringController {
	
	@Autowired
	private MonitoringService monitoringService;
	
    @RequestMapping(value= "/monitoring/trend", method = RequestMethod.GET)
    public String corrStatus(Model model) {
        return "/monitoring/trend.jsp"; // 
    }

    
    @RequestMapping(value = "/monitoring/trend/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Monitoring> gettrend(Monitoring monitoring) {

        String startDateStr = monitoring.getStartDate();
        String endDateStr = monitoring.getEndDate();

      
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        LocalDateTime startDateTime = LocalDateTime.parse(startDateStr, inputFormatter);
        LocalDateTime endDateTime = LocalDateTime.parse(endDateStr, inputFormatter);

        // 변환 후 다시 문자열로 저장 (초 포함)
        monitoring.setStartDate(startDateTime.format(outputFormatter)); 
        monitoring.setEndDate(endDateTime.format(outputFormatter));

        System.out.println(" 받은 startDate (초 포함): " + monitoring.getStartDate());
        System.out.println(" 받은 endDate (초 포함): " + monitoring.getEndDate());

       
        List<Monitoring> result = monitoringService.gettrend(monitoring);

        System.out.println("조회 결과 개수: " + result.size());

        
        
        return result;
    }
    
  //알람현황 - 이동
    @RequestMapping(value= "/monitoring/alarm", method = RequestMethod.GET)
    public String alarmInit(Model model) {
        return "/monitoring/alarm.jsp"; // 
    }
	
    //알람현황 - 이력
    @RequestMapping(value = "/monitoring/alarm/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmList() {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	Monitoring monitoringList = monitoringService.alarmList();
    	
    	rtnMap.put("data",monitoringList);
	 
    	return rtnMap;
    }

    
}
