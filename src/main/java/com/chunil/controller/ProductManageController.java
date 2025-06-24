package com.chunil.controller;

import java.util.ArrayList;
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

import com.chunil.domain.DroppedGoods;
import com.chunil.domain.ProductManage;
import com.chunil.service.ProductManageService;


@Controller
public class ProductManageController {
	
	@Autowired
	private ProductManageService productManageService; 
	
	
	
	//낙하품관리 로드
    @RequestMapping(value= "/productionManagement/droppedGoods", method = RequestMethod.GET)
    public String droppedGoods(Model model) {
        return "/productionManagement/droppedGoods.jsp";  
    }
    
    
  //낙하품관리 조회
    @RequestMapping(value = "/productionManagement/droppedGoods/getDroppedGoodsList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getDroppedGoodsList() {

        Map<String, Object> rtnMap = new HashMap<>();

        
        List<DroppedGoods> droppedGoodsList = productManageService.getDroppedGoodsList();

        List<Map<String, Object>> rtnList = new ArrayList<>();
        for (int i = 0; i < droppedGoodsList.size(); i++) {
        	DroppedGoods dg = droppedGoodsList.get(i);

            Map<String, Object> row = new HashMap<>();
            row.put("d_lot", dg.getD_lot());
            row.put("w_pnum", dg.getW_pnum());
            row.put("item_name", dg.getItem_name());
            row.put("w_sdatetime", dg.getW_sdatetime());
            row.put("w_in_edatetime", dg.getW_in_edatetime());
            row.put("w_edatetime", dg.getW_edatetime());
            row.put("d_in", dg.getD_in());
            row.put("d_qf", dg.getD_qf());
            row.put("d_tf",dg.getD_tf());
            row.put("d_out",dg.getD_out());
            row.put("d_bigo",dg.getD_bigo());

            rtnList.add(row);
        }

        rtnMap.put("last_page", 1); 
        rtnMap.put("data", rtnList);

        return rtnMap;
    }
    
    
    @RequestMapping(value = "/productionManagement/droppedGoods/updateDroppedGoods", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateDroppedGoods(@RequestBody Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            productManageService.updateDroppedGoods(param); 
            result.put("result", "success");
        } catch (Exception e) {
            result.put("result", "fail");
            result.put("message", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
    
    
  //열처리 작업이력 - 이동
    @RequestMapping(value= "/productionManagement/heatTreatment", method = RequestMethod.GET)
    public String heatTreatmentInit(Model model) {
        return "/productionManagement/heatTreatment.jsp"; // 
    }
	
	
    //열처리 작업이력 - 데이터조회
    @RequestMapping(value = "/productionManagement/heatTreatment/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heatTreatmentList(
    		@RequestParam String w_date
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	ProductManage productManage = new ProductManage();
    	productManage.setW_date(w_date);
	 
    	List<ProductManage> productManageList = productManageService.heatTreatmentList(productManage);
    	
    	List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<productManageList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("w_date", productManageList.get(i).getW_date());
			rowMap.put("w_lot", productManageList.get(i).getW_lot());
			rowMap.put("w_idx", productManageList.get(i).getW_idx());
			rowMap.put("w_sdatetime", productManageList.get(i).getW_sdatetime());
			rowMap.put("w_in_edatetime", productManageList.get(i).getW_in_edatetime());
			rowMap.put("w_edatetime", productManageList.get(i).getW_edatetime());
			rowMap.put("w_intime", productManageList.get(i).getW_intime());
			rowMap.put("w_incnt", productManageList.get(i).getW_incnt());
			rowMap.put("w_weight", productManageList.get(i).getW_weight());
			rowMap.put("w_std_weight", productManageList.get(i).getW_std_weight());
			rowMap.put("w_pnum", productManageList.get(i).getW_pnum());
			rowMap.put("w_pname", productManageList.get(i).getW_pname());
			rowMap.put("w_gang", productManageList.get(i).getW_gang());
			rowMap.put("w_t_gb", productManageList.get(i).getW_t_gb());
			rowMap.put("w_cp", productManageList.get(i).getW_cp());
			rowMap.put("w_qf", productManageList.get(i).getW_qf());
			rowMap.put("w_tf", productManageList.get(i).getW_tf());
			rowMap.put("h_val1", productManageList.get(i).getH_val1());
			rowMap.put("h_val2", productManageList.get(i).getH_val2());
			rowMap.put("h_val3", productManageList.get(i).getH_val3());

			rtnList.add(rowMap);
		}
    	
    	rtnMap.put("data",rtnList);
    	rtnMap.put("last_page",1);
	 
    	return rtnMap;
    }

    //열처리 작업이력 - 저장 & 수정
    @RequestMapping(value = "/productionManagement/heatTreatment/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heatTreatmentSave(
    		@ModelAttribute ProductManage productManage
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
    	
    	int chkValue = productManageService.heatTreatmentSave(productManage);
    	
    	rtnMap.put("last_page",1);
    	rtnMap.put("chk",chkValue);
	 
    	return rtnMap;
    }

    //삭제
    @RequestMapping(value = "/productionManagement/heatTreatment/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heatTreatmentDelete(
    		@RequestParam String w_lot
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
    	
    	ProductManage productManage = new ProductManage();
    	productManage.setW_lot(w_lot);
    	productManage.setUser_code(UserController.USER_CODE);
    	productManage.setPage_code("b06");
    	productManage.setWork_url("/productionManagement/heatTreatment");
    	
    	int chkValue = productManageService.heatTreatmentDelete(productManage);
    	
    	rtnMap.put("last_page",1);
    	rtnMap.put("chk",chkValue);
	 
    	return rtnMap;
    }
   
    //열처리 작업이력 품번 - 데이터조회
    @RequestMapping(value = "/productionManagement/heatTreatment/pumbun/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heatTreatmentPumbunList(
    		@RequestParam String w_pnum,
    		@RequestParam String w_gang,
    		@RequestParam String w_t_gb
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	ProductManage productManage = new ProductManage();
    	productManage.setW_pnum(w_pnum);
    	productManage.setW_gang(w_gang);
    	productManage.setW_t_gb(w_t_gb);
	 
    	List<ProductManage> productManageList = productManageService.heatTreatmentPumbunList(productManage);
    	
    	List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<productManageList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("w_pnum", productManageList.get(i).getW_pnum());
			rowMap.put("w_pname", productManageList.get(i).getW_pname());
			rowMap.put("w_gang", productManageList.get(i).getW_gang());
			rowMap.put("w_t_gb", productManageList.get(i).getW_t_gb());
			rowMap.put("w_qf", productManageList.get(i).getW_qf());
			rowMap.put("w_tf", productManageList.get(i).getW_tf());
			rowMap.put("w_cp", productManageList.get(i).getW_cp());
			rowMap.put("w_std_weight", productManageList.get(i).getW_std_weight());
			rowMap.put("w_hardness", productManageList.get(i).getW_hardness());

			rtnList.add(rowMap);
		}
    	
    	rtnMap.put("data",rtnList);
    	rtnMap.put("last_page",1);
	 
    	return rtnMap;
    }

	//알람이력 - 이동
    @RequestMapping(value= "/productionManagement/alarmRecord", method = RequestMethod.GET)
    public String alarmRecordInit(Model model) {
        return "/productionManagement/alarmRecord.jsp"; // 
    }
    
    
    //알람이력 - 데이터조회
    @RequestMapping(value = "/productionManagement/alarmRecord/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmRecordList(
    		@RequestParam String a_sdate,
    		@RequestParam String a_edate
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	ProductManage productManage = new ProductManage();
    	productManage.setA_sdate(a_sdate);
    	productManage.setA_edate(a_edate);
	 
    	List<ProductManage> productManageList = productManageService.alarmRecordList(productManage);
    	
    	List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<productManageList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("a_addr", productManageList.get(i).getA_addr());
			rowMap.put("a_desc", productManageList.get(i).getA_desc());
			rowMap.put("a_stime", productManageList.get(i).getA_stime());
			rowMap.put("a_etime", productManageList.get(i).getA_etime());

			rtnList.add(rowMap);
		}
    	
    	rtnMap.put("data",rtnList);
    	rtnMap.put("last_page",1);
	 
    	return rtnMap;
    }
    
    //알람발생빈도 - 이동
    @RequestMapping(value= "/productionManagement/alarmFrequency", method = RequestMethod.GET)
    public String alarmFrequencyInit(Model model) {
    	return "/productionManagement/alarmFrequency.jsp"; // 
    }
    
    
    //알람발생빈도 - 데이터조회
    @RequestMapping(value = "/productionManagement/alarmFrequency/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmFrequencyList(
    		@RequestParam String a_sdate,
    		@RequestParam String a_edate
    		) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
    	
    	ProductManage productManage = new ProductManage();
    	productManage.setA_sdate(a_sdate);
    	productManage.setA_edate(a_edate);
    	
    	List<ProductManage> productManageList = productManageService.alarmFrequencyList(productManage);
    	
    	List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
    	for(int i=0; i<productManageList.size(); i++) {
    		HashMap<String, Object> rowMap = new HashMap<String, Object>();
    		rowMap.put("idx", (i+1));
    		rowMap.put("a_addr", productManageList.get(i).getA_addr());
    		rowMap.put("a_desc", productManageList.get(i).getA_desc());
    		rowMap.put("a_cnt", productManageList.get(i).getA_cnt());
    		
    		rtnList.add(rowMap);
    	}
    	
    	rtnMap.put("data",rtnList);
    	rtnMap.put("last_page",1);
    	
    	return rtnMap;
    }
	
	//종합생산현황 - 이동
    @RequestMapping(value= "/productionManagement/integrationProduction", method = RequestMethod.GET)
    public String integrationProductionInit(Model model) {
        return "/productionManagement/integrationProduction.jsp"; // 
    }
    
    //종합생산현황 - 이력
    @RequestMapping(value = "/productionManagement/integrationProduction/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> integrationProductionList() {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	List<ProductManage> monitoringList = productManageService.integrationMonitoringList();
    	
    	List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
    	for(int i=0; i<monitoringList.size(); i++) {
    		HashMap<String, Object> rowMap = new HashMap<String, Object>();
    		rowMap.put("m_pnum", monitoringList.get(i).getM_pnum());
    		rowMap.put("m_pname", monitoringList.get(i).getM_pname());
    		rowMap.put("m_intime", monitoringList.get(i).getM_intime());
    		rowMap.put("m_incnt", monitoringList.get(i).getM_incnt());
    		rowMap.put("m_weight", monitoringList.get(i).getM_weight());
    		rowMap.put("m_std_weight", monitoringList.get(i).getM_std_weight());
    		rowMap.put("m_weight_percent", monitoringList.get(i).getM_weight_percent());
    		
    		rtnList.add(rowMap);
    	}
    	
    	rtnMap.put("data",rtnList);
    	rtnMap.put("last_page",1);
	 
    	return rtnMap;
    }

}
