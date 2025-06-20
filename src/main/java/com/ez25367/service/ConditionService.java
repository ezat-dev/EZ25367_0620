package com.ez25367.service;

import java.util.List;

import com.ez25367.domain.Condition;
import com.ez25367.domain.CorrStatus;
import com.ez25367.domain.StandardData;

public interface ConditionService {
	
	//기준정보 조회
	List<Condition> getStandardDataList(Condition condition);
	
	//기준정보 생성
	boolean insertStandardData(Condition condition);
	
	//기준정보 수정
	boolean updateStandardData(Condition condition);
	
	//기준정보 삭제
	boolean deleteStandardData(Condition condition);
	  //-----------------------------------------------------
    
	//기준정보
	List<Condition> getStandardInfoList(Condition params); 
    
    void saveDivisionWeight(Condition condition);
    
    void delDivisionWeight(Condition condition);
    
    //TC조절 이력
    List<Condition> getCorrStatusList(Condition params); 
    
    void delCorrStatus(Condition params); 
   
    void saveCorrStatus(Condition condition);
    
    //조건관리
    List<Condition> getconditionList(Condition condition);
    void machinePartTempUpdate(Condition condition);
    
    
    //액교반일지
 
    List<Condition> getMachineliquidmanage(Condition condition); 
    void insertMachineliquidmanage(Condition condition); 
    
    List<Condition> getMachineliquidmanage2(Condition condition); 
    void insertMachineliquidmanage2(Condition condition); 

    void deleteMachineliquidmanage(Condition condition); 
    void deleteMachineliquidmanage2(Condition condition); 
    
}
