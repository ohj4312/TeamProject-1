package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.SelfGuideDAO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.SelfGuide;

@Service
public class SelfGuideService {

	private static final Logger logger = LoggerFactory.getLogger(SelfGuideService.class);
	
	@Resource
	SelfGuideDAO sgDAO;
	
	
	
	public int setSelfWrite(SelfGuide sg) {
		int row=sgDAO.insertSelfGuide(sg);
		return row;
	}
	
	public int getRows() {
		return sgDAO.countAll();
	}

	public List<SelfGuide> getselfguideList(Pager pager) {
		
		return sgDAO.selectByPage(pager);
	}

	public List<SelfGuide> getselfguidephotoList(SelfGuide sg) {
		
		return sgDAO.selectByPage(sg);
	}
 
	public SelfGuide selectSelfPhoto(int snumber) {
		SelfGuide sg = sgDAO.selectSelfPhoto(snumber);
		
		
		
		 
		return sg;
	}

	public List<SelfGuide> selectSelfPhotoList(String swriter) {
		List<SelfGuide> list= sgDAO.selectSelfPhotoList(swriter);
		return list;
	}

	public List<SelfGuide> getselfFilter(String filter) {
		List<SelfGuide> filterlist=sgDAO.selectFilter(filter);
		return filterlist;
	}

	public int updatehitcount(int hit_count) {
		hit_count = hit_count +1;
		return sgDAO.updatehitcount(hit_count);
	}

	public void deleteSelfguide(int snumber) {
		sgDAO.deleteSelf(snumber);
	}



	
}
