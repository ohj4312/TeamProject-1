package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.SelfGuide;

@Repository
public class SelfGuideDAO {
	@Resource
	private SqlSessionTemplate sst;
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideDAO.class);

	
	
	
	public int countAll() {
		return sst.selectOne("mybatis.mapper.selfguide.countAll");
	}

	public List<SelfGuide> selectByPage(Pager pager) {
		return sst.selectList("mybatis.mapper.selfguide.selectByPage", pager);
	}

	public List<SelfGuide> selectByPage(SelfGuide sg) {
		
		return sst.selectList("mybatis.mapper.selfguide.selectByPageList",sg);
	}

	public SelfGuide selectSelfPhoto(int snumber) {
		
		return sst.selectOne("mybatis.mapper.selfguide.selectSelfPhotoList",snumber );
	}

	public void updateHitCount(SelfGuide sg) {
		sst.update("mybatis.mapper.selfguide.updateHitCount",sg);
		
	}

	
	
}
