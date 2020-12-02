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

	
	public List<SelfGuide> selectSelfList(int snumber){
		return sst.selectList("mybatis.mapper.selfguide.selectSelfList" , snumber);
		
	}


	public int insertSelfGuide(SelfGuide sg) {
		logger.info("잘들어갈까요안들어갈까요~?");
		int row=sst.insert("mybatis.mapper.selfguide.insertSelfGuide" , sg);
		logger.info("1이면 성공: "+row);
		return row;
	}
	
	
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


	public List<SelfGuide> selectSelfPhotoList(String swriter) {
		return sst.selectList("mybatis.mapper.selfguide.selectSelfPhotoList2",swriter);
	}


	public List<SelfGuide> selectFilter(String filter) {
		return sst.selectList("mybatis.mapper.selfguide.selectSelfListFilter",filter);
	}


	public void updatehitcount(SelfGuide sg) {
		sst.update("mybatis.mapper.selfguide.updatehitcount",sg);
	}


	public List<SelfGuide> getselfguidephotoList(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.getselfguidephotoList",sg);
	}

	
	
}
