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
<<<<<<< HEAD


	public int insertSelfGuide(SelfGuide sg) {
		int row=sst.insert("mybatis.mapper.photo.insertSelfGuide" , sg);
		logger.info("1이면 성공: "+row);
		return row;
	}
=======
	
	public int countAll() {
		return sst.selectOne("mybatis.mapper.photo.countAll");
	}
	
>>>>>>> branch 'master' of https://github.com/mw7895la/TeamProject
}
