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
		int row=sst.insert("mybatis.mapper.selfguide.insertSelfGuide" , sg);
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
	
	public List<SelfGuide> getselfguidephotoList(Pager pager) {
		// TODO Auto-generated method stub
		return sst.selectList("mybatis.mapper.selfguide.selectByPage",pager);
	}


	public void deleteSelf(int snumber) {
		logger.info("deleteDAO도!!!!!!실행된다!!!!!!!!!!!!!!!!!!!!!!!!!");
		int row=sst.delete("mybatis.mapper.selfguide.deleteSelf", snumber);
		logger.info("잘삭제되면 1이다: "+row);
	}


	public void updateSelfPhoto(SelfGuide sg) {
		logger.info("여기는 DAO updateSelfPhoto() 메에에에에ㅔ에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ소드");
		sst.update("mybatis.mapper.selfguide.updateSelfPhoto", sg);
	}


	public List<SelfGuide> selectOrder() {
		List<SelfGuide> topThree=sst.selectList("mybatis.mapper.selfguide.selectOrder");
		return topThree;
	}


	public int getFilterRows(String stype) {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.selfguide.countFilterAll",stype);
	}



	
	
}
