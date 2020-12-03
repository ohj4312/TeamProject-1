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

	
 
	public SelfGuide selectSelfPhoto(SelfGuide sg) {
		sg = sgDAO.selectSelfPhoto(sg.getSnumber());
		
		
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

	public List<SelfGuide> getselfguidephotoList(SelfGuide sg) {
		
		
		return sgDAO.getselfguidephotoList(sg);
	}

	public void deleteSelfguide(int snumber) {
		sgDAO.deleteSelf(snumber);
	}

	public void updatehitcount(SelfGuide sg) {
		
		sgDAO.updatehitcount(sg);;
	}

	public void changeSelfPhoto(SelfGuide sg) {
		sgDAO.updateSelfPhoto(sg);
		
	}

	public List<SelfGuide> getOrder() {
		List<SelfGuide> selforder=sgDAO.selectOrder();
		return selforder;
	}

	public int getFilterRows(String stype) {
		return sgDAO.getFilterRows(stype);
	} 

	
	



	
}
