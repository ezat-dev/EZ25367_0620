package com.chunil.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chunil.domain.Quality;
import com.chunil.service.QualityService;
import com.chunil.util.CpkCalc;

@Controller
public class QualityController {

	@Autowired
	private QualityService qualityService;
	
	
	
	//온도균일성 테스트
    @RequestMapping(value= "/quality/tusTest", method = RequestMethod.GET)
    public String tusTest(Model model) {
        return "/quality/tusTest.jsp"; // 
    }   
    
    //열처리유 성상분석  
    @RequestMapping(value= "/quality/heatTreatingOil", method = RequestMethod.GET)
    public String heatTreatingOil(Model model) {
        return "/quality/heatTreatingOil.jsp"; // 
    }
    
    //열처리유 성상분석  
    @RequestMapping(value= "/quality/fProof", method = RequestMethod.GET)
    public String fProof(Model model) {
        return "/quality/fProof.jsp"; 
    } 
   
   
   @RequestMapping(value = "/quality/tusTest/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Quality> getqualityList(Quality quality) {
		/*
		 * System.out.println(">>> test_mch_name: " + quality.getMch_name());
		 * System.out.println(">>> test_t_year: " + quality.getT_year());
		 */
        return qualityService.getqualityList(quality);
    }

    @RequestMapping(value = "/quality/tusTest/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> savetusTest(@ModelAttribute Quality quality,
                                           @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
        Map<String, Object> rtnMap = new HashMap<>();

   
        if (quality.getT_month() != null && quality.getT_month().length() >= 4) {
            String year = quality.getT_month().substring(0, 4);
            quality.setT_year(year);
        }



      
        if (uploadFile != null && !uploadFile.isEmpty()) {
            try {
                String originalFilename = uploadFile.getOriginalFilename();
                String savePath = "D:/천일_양식/온도균일성/";

                File dir = new File(savePath);
                if (!dir.exists()) dir.mkdirs();

                File dest = new File(savePath + originalFilename);
                uploadFile.transferTo(dest);

              
                quality.setT_url(originalFilename);

            } catch (IOException e) {
                e.printStackTrace();
                rtnMap.put("result", "fail");
                rtnMap.put("message", "파일 저장 실패");
                return rtnMap;
            }
        }

   
        qualityService.savetusTest(quality);

        System.out.println(">>> mch_name: " + quality.getMch_name());
        System.out.println(">>> id: " + quality.getId());
        System.out.println(">>> t_result: " + quality.getT_result());
        System.out.println(">>> test_t_year: " + quality.getT_year());
        System.out.println(">>> t_url: " + quality.getT_url());

        rtnMap.put("result", "success");
        return rtnMap;
    }

    @RequestMapping(value = "/quality/tusTest/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deltusTest(@RequestBody Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (quality.getId() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        qualityService.deltusTest(quality);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }
    
    @RequestMapping(value = "/download_tusTest", method = RequestMethod.GET)
    public void downloadExcel(@RequestParam("filename") String filename,
                              HttpServletResponse response) throws IOException {

        String baseDir = "D:/천일_양식/온도균일성/";

       
        if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        File file = new File(baseDir + filename);
      
        if (!file.exists()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mimeType = Files.probeContentType(file.toPath());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setContentLengthLong(file.length());

   
        String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");


        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int len;
            while ((len = fis.read(buffer)) != -1) {
                os.write(buffer, 0, len);
            }
            os.flush();
        }
    }

    
    
    @RequestMapping(value = "/quality/heatTreatingOil/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Quality> getHeatTreatingOil(Quality quality) {
		
        return qualityService.getHeatTreatingOil(quality);
    }
    
    @RequestMapping(value = "/quality/heatTreatingOil/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveHeatTreatingOil(@ModelAttribute Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();


        qualityService.saveHeatTreatingOil(quality);

        rtnMap.put("result", "success");
        return rtnMap;
    }

    @RequestMapping(value = "/quality/heatTreatingOil/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delHeatTreatingOil(@RequestBody Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (quality.getId() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        qualityService.delHeatTreatingOil(quality);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }
    
   
    @RequestMapping(value = "/quality/fProof/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Quality> getfProof(Quality quality) {
		
        if (quality.getY_m() != null && quality.getY_m().contains("-")) {
            quality.setY_m( quality.getY_m().replace('-', '/') );
        }
    	
        return qualityService.getFproof(quality);
    }
    
    @RequestMapping(value = "/quality/fProof/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveFproof(@RequestBody Map<String, Object> param) {       
        Map<String, Object> rtnMap = new HashMap<>();
        try {
            qualityService.saveFproof(param);
            rtnMap.put("result", "success");
        } catch (Exception e) {
            rtnMap.put("result", "fail");
            rtnMap.put("message", e.getMessage());
        }
        return rtnMap;
    }


    @RequestMapping(value = "/quality/fProof/del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delfProof(@RequestBody Quality quality) {
        Map<String, Object> rtnMap = new HashMap<>();

        if (quality.getId() == null) {
            rtnMap.put("data", "행 선택하세요");
            return rtnMap;
        }

        qualityService.delFproof(quality);

        rtnMap.put("data", "success"); 
        return rtnMap;
    }
    
   
    
    
    
    
    
  //Cpk - 이동
    @RequestMapping(value= "/quality/cpk", method = RequestMethod.GET)
    public String cpkInit(Model model) {
        return "/quality/cpk.jsp"; // 
    }
    
    //Cpk - 이력
    @RequestMapping(value = "/quality/cpk/standard/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cpkStandardList(
    		@RequestParam String h_pnum,
    		@RequestParam String h_sdate,
    		@RequestParam String h_edate) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
	 
    	//선택한 품번의 기준정보
    	Quality quality = new Quality();
    	quality.setH_pnum(h_pnum);
    	quality.setH_sdate(h_sdate);
    	quality.setH_edate(h_edate);
    	
    	Quality standardQuality = qualityService.cpkStandardList(quality);
    	List<Quality> rtnList = new ArrayList<Quality>();

		HashMap<String, Object> rowMap = new HashMap<String, Object>();
		rowMap.put("h_pnum", standardQuality.getH_pnum());
		rowMap.put("h_pname", standardQuality.getH_pname());
		rowMap.put("h_gang", standardQuality.getH_gang());
		rowMap.put("h_t_gb", standardQuality.getH_t_gb());
		rowMap.put("h_hard_up", standardQuality.getH_hard_up());
		rowMap.put("h_hard_dw", standardQuality.getH_hard_dw());
    		
		rtnList.add(standardQuality);
    	rtnMap.put("standardData",rtnList);
    	
    	CpkCalc cpkCalc = new CpkCalc();
    	int n = 3;
    	double d2 = 0;
    	double a2 = 0;
    	double d4 = 0;
    	
    	
    	
    	String xm_average = "";
    	String xm_avgList = "";
    	String xm_range = "";
    	String rm_rangeList = "";
    	
    	double x_ucl = 0;
    	double x_cl = 0;
    	double x_lcl = 0;
    	
    	double r_ucl = 0;
    	double r_cl = 0;
    	
    	//선택한 품번의 기간내에 입력한 경도값
    	List<Quality> cpkList = qualityService.cpkValueList(quality);
    	rtnMap.put("cpkValueData",cpkList);
    	
    	d2 = cpkCalc.d2(n);
    	a2 = cpkCalc.a2(n);
    	d4 = cpkCalc.d4(n);
		double max_val = 0.0;
		double min_val = 0.0;
		
		max_val = Double.parseDouble(standardQuality.getH_hard_up());
		min_val = Double.parseDouble(standardQuality.getH_hard_dw());
		
		List<Quality> trendList = new ArrayList<Quality>();
    	for(int i=0; i<cpkList.size(); i++) {
    		Quality rowQuality = new Quality();
    		int xm_av_idx = 0;
    		int x_max = 0;
    		int x_min = 0;
    		

    		
    		
    		float h_x1 = cpkList.get(i).getH_x1();
    		float h_x2 = cpkList.get(i).getH_x2();
    		float h_x3 = cpkList.get(i).getH_x3();
    		
    		if(h_x1 != 0) {xm_av_idx++;}
    		if(h_x2 != 0) {xm_av_idx++;}
    		if(h_x3 != 0) {xm_av_idx++;}
    		
    		xm_average = cpkCalc.xm_average((h_x1 + h_x2 + h_x3), xm_av_idx);
    		xm_avgList = cpkCalc.xm_average2((h_x1 + h_x2 + h_x3), xm_av_idx);
    		
    		rm_rangeList = cpkCalc.xm_range(h_x1,h_x2,h_x3);
    		xm_range = cpkCalc.xm_range2(h_x1,h_x2,h_x3);
    		
    		x_ucl = Double.parseDouble(cpkCalc.x_Bar_UCL(n));
    		x_cl = Double.parseDouble(cpkCalc.x_Bar_CL());
    		x_lcl = Double.parseDouble(cpkCalc.x_Bar_LCL(n));
    		
    		r_ucl = Double.parseDouble(cpkCalc.r_UCL(n));
    		r_cl = Double.parseDouble(cpkCalc.r_CL());
    		
    		
    		rowQuality.setG_ucl_x(x_ucl);
    		rowQuality.setG_cl_x(x_cl);
    		rowQuality.setG_lcl_x(x_lcl);
    		
    		rowQuality.setG_ucl_r(r_ucl);
    		rowQuality.setG_cl_r(r_cl);
    		rowQuality.setG_max(max_val);
    		rowQuality.setG_min(min_val);
    		rowQuality.setG_avg(cpkList.get(i).getH_avg());
    		rowQuality.setG_range(cpkList.get(i).getH_range());
//    		rowQuality.setG_tdatetime(cpkList.get(i).getH_day()+" "+);
    		trendList.add(rowQuality);
    	}
    	
    	Quality quaCpk = new Quality();
    	
    	String xbar_average = cpkCalc.xbar_average();
    	String range_average = cpkCalc.range_average();
    	String xbar_ucl = (Math.round(Double.parseDouble(cpkCalc.x_Bar_UCL(n)) * 100)/100.0)+"";
    	String xbar_cl = (Math.round(Double.parseDouble(cpkCalc.x_Bar_CL()) * 100)/100.0)+"";
    	String xbar_lcl = (Math.round(Double.parseDouble(cpkCalc.x_Bar_LCL(n)) * 100)/100.0)+"";
    	
    	String rbar_ucl = (Math.round(Double.parseDouble(cpkCalc.r_UCL(n)) * 100)/100.0)+"";
    	String rbar_cl = (Math.round(Double.parseDouble(cpkCalc.r_CL()) * 100)/100.0)+"";
    	String r_bar_d2 = cpkCalc.r_Bar_d2(n);
    	String cp = cpkCalc.cp(max_val, min_val, n);
    	String k = cpkCalc.k(max_val, min_val);
    	String cpk = cpkCalc.cpk(max_val, min_val, n);
    	
    	quaCpk.setN(n);
    	quaCpk.setD2(d2);
    	quaCpk.setA2(a2);
    	quaCpk.setD4(d4);
    	
    	quaCpk.setUcl_x(xbar_ucl);
    	quaCpk.setCl_x(xbar_cl);
    	quaCpk.setLcl_x(xbar_lcl);
    	
    	quaCpk.setUcl_r(rbar_ucl);
    	quaCpk.setCl_r(rbar_cl);
    	quaCpk.setLcl_r("-");
    	
    	quaCpk.setR_d2(r_bar_d2);
    	quaCpk.setCp(cp);
    	quaCpk.setK(k);
    	quaCpk.setCpk(cpk);
    	
    	
    	rtnMap.put("cpkValueCalcData",quaCpk);
    	rtnMap.put("trendData",trendList);
    	
    	return rtnMap;
    }
}
