package com.chunil.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chunil.domain.Standard;
@Repository
public class StandardDAOImpl implements StandardDAO{

	@Resource(name="session")
	private SqlSession sqlSession;
	
	//비가동현황
	@Override
	public List<Standard> getNonTimeDataList(Standard standard) {
	    return sqlSession.selectList("standard.getNonTimeDataList", standard);
	}

	@Override
	public void saveNonTime(Standard standard) {
	    sqlSession.insert("standard.saveNonTime", standard);
	}

	@Override
	public void updateNonTime(Standard standard) {
	    sqlSession.insert("standard.updateNonTime", standard);
	}

	@Override
	public void deleteNonTime(String non_time_idx) {
	    sqlSession.delete("standard.deleteNonTime", non_time_idx);
	}

	@Override
	public List<Standard> getNonTimeDataView(Standard standard) {
	    return sqlSession.selectList("standard.getNonTimeDataView", standard);
	}
}
