package com.chunil.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
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
    
   

}
