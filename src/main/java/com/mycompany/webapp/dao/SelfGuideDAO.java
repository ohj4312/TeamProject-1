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
	
	public int countFilter(String filter) {
		return sst.selectOne("mybatis.mapper.selfguide.countFilter", filter);
	}

	public List<SelfGuide> selectByPage(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.selectByPage", sg);
	}

	public List<SelfGuide> selectByPageMember(SelfGuide sg) {
		
		return sst.selectList("mybatis.mapper.selfguide.selectByPageList",sg);
	}
	
	//self detail 부분
	public SelfGuide selectSelfPhoto(SelfGuide sg) {
		
		return sst.selectOne("mybatis.mapper.selfguide.selectSelfPhotoList",sg);
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
		sst.update("mybatis.mapper.selfguide.updateselfhitcount",sg);
	}


	public List<SelfGuide> getselfguidephotoList(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.getselfguidephotoList",sg);
	}
	
	public List<SelfGuide> getselfguidephotoList(Pager pager) {
		// TODO Auto-generated method stub
		return sst.selectList("mybatis.mapper.selfguide.selectByPage",pager);
	}
	
	public List<SelfGuide> getselfguidephotoListFilter(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.getselfguidephotoListFilter",sg);
	}
	
	public List<SelfGuide> selectByPageFilter(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.selectByPageFilter",sg);
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


	public List<SelfGuide> selectByMemberFilter(SelfGuide sg) {
		return sst.selectList("mybatis.mapper.selfguide.getselfguidephotoListFilter",sg);
		
	}	
}
