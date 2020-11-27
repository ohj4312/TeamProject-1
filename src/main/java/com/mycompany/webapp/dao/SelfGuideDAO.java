package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.SelfGuide;

@Repository
public class SelfGuideDAO {
	@Resource
	private SqlSessionTemplate sst;
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideDAO.class);

	
	public List<SelfGuide> selectSelfList(int snumber){
		return sst.selectList("mybatis.mapper.photo.selectSelfList" , snumber);
		
	}
}
