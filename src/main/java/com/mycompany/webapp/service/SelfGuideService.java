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
	
	/*
	 * public SelfGuide selectSelfPhoto(int snumber) { List<SelfGuide>
	 * list=sgDAO.selectSelfList(snumber); return (SelfGuide) list; }
	 */

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


	
}
