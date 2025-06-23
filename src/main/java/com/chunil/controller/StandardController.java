package com.chunil.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunil.domain.Standard;
import com.chunil.service.StandardService;
@Controller
public class StandardController {

	@Autowired
	 private StandardService standardService;
	
	//설비 비가동현황()
	@RequestMapping(value= "/standard/nonTime", method = RequestMethod.GET)
	public String nonTime(Model model) {
	    return "/standard/nonTime.jsp"; // 
	}

	//비가동현황
	@RequestMapping(value = "/standard/nonTime/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getnonTimeList(
	        @RequestParam(required = false) String startDate,
	        @RequestParam(required = false) String endDate,
	        @RequestParam(required = false) String equipment_name) {
	    
		System.out.println("=== /standard/nonTime/list 요청 ===");
	    System.out.println("startDate: " + startDate);
	    System.out.println("endDate: " + endDate);
	    System.out.println("equipment_name: " + equipment_name);
	    System.out.println("===============================");
	    
	    Map<String, Object> rtnMap = new HashMap<>();
	    try {
	        Standard standard = new Standard();
	        standard.setStartDate(startDate);
	        standard.setEndDate(endDate);
	        standard.setEquipment_name(equipment_name);

	        List<Standard> allList = standardService.getNonTimeDataList(standard);
	        							
	        rtnMap.put("status", "success");
	        rtnMap.put("data", allList);
	        rtnMap.put("count", allList.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	        rtnMap.put("status", "error");
	        rtnMap.put("message", e.getMessage());
	    }

	    return rtnMap;
	}

	//비가동현황
	@RequestMapping(value = "/standard/nonTime/view", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getnonTimeView(
	        @RequestParam(required = false) String startDate,
	        @RequestParam(required = false) String endDate,
	        @RequestParam(required = false) String equipment_name) {
	    
	    Map<String, Object> rtnMap = new HashMap<>();
	    try {
	        Standard standard = new Standard();
	        standard.setStartDate(startDate);
	        standard.setEndDate(endDate);
	        standard.setEquipment_name(equipment_name);

	        List<Standard> allListView = standardService.getNonTimeDataView(standard);

	        rtnMap.put("status", "success");
	        rtnMap.put("data", allListView);
	        rtnMap.put("count", allListView.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	        rtnMap.put("status", "error");
	        rtnMap.put("message", e.getMessage());
	    }

	    return rtnMap;
	}

	// 비가동
	@RequestMapping(value = "/standard/nonTime/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveNonTime(@ModelAttribute Standard standard) {
	    Map<String, Object> rtnMap = new HashMap<>();
	    
	    try {
	        if (standard.getEquipment_name() == null || standard.getEquipment_name().trim().isEmpty()) {
	            rtnMap.put("result", "fail");
	            rtnMap.put("message", "설비명을 입력하시오!");
	            return rtnMap;
	        }

	        standardService.saveNonTime(standard);

	        rtnMap.put("result", "success");
	    } catch (Exception e) {
	        rtnMap.put("result", "fail");
	        rtnMap.put("message", "저장 중 오류가 발생했습니다: " + e.getMessage());
	    }

	    return rtnMap;
	}

	// 비가동
	@RequestMapping(value = "/standard/nonTime/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateNonTime(@ModelAttribute Standard standard) {
	    Map<String, Object> rtnMap = new HashMap<>();
	    
	    System.out.println("=== Received Standard object (updateNonTime) ===");
	    System.out.println("equipment_name: " + standard.getEquipment_name());
	    System.out.println("info_list: " + standard.getInfo_list());
	    System.out.println("start_time: " + standard.getStart_time());
	    System.out.println("end_time: " + standard.getEnd_time());
	    System.out.println("non_time_memo: " + standard.getNon_time_memo());
	    System.out.println("non_time_idx: " + standard.getNon_time_idx());
	    System.out.println("machine_code: " + standard.getMachine_code());
	    System.out.println("===============================================");

	    try {
	        if (standard.getEquipment_name() == null || standard.getEquipment_name().trim().isEmpty()) {
	            rtnMap.put("result", "fail");
	            rtnMap.put("message", "설비명을 입력하시오!");
	            return rtnMap;
	        }

	        standardService.updateNonTime(standard);

	        rtnMap.put("result", "success");
	    } catch (Exception e) {
	        rtnMap.put("result", "fail");
	        rtnMap.put("message", "저장 중 오류가 발생했습니다: " + e.getMessage());
	    }

	    return rtnMap;
	}

	// 비가동 삭제
	@RequestMapping(value = "/standard/nonTime/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteNonTime(@RequestBody Map<String, String> requestData) {
	    String non_time_idx = requestData.get("non_time_idx");
	    System.out.println("받은 non_time_idx: " + non_time_idx);

	    Map<String, Object> result = new HashMap<>();
	    try {
	        standardService.deleteNonTime(non_time_idx);
	        result.put("result", "success");
	    } catch (Exception e) {
	        result.put("result", "fail");
	        result.put("message", e.getMessage());
	    }
	    return result;
	}
}
