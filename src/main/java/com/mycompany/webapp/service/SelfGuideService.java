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
	
	public int getRows(String filter) {

		if(filter.equals("All")) {
			return sgDAO.countAll();
		}else {
			return sgDAO.countFilter(filter);
		}
	}

	/*public List<SelfGuide> getselfguideList(Pager pager) {
		
		return sgDAO.selectByPage(pager); 
	}*/

	
	//self detail 부분
	public SelfGuide selectSelfPhoto(SelfGuide sg) {
		sg = sgDAO.selectSelfPhoto(sg);
		
		
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
	
	public List<SelfGuide> getselfguidephotoList(Pager pager) {
		// TODO Auto-generated method stub
		return sgDAO.getselfguidephotoList(pager);
	} 

	public void deleteSelfguide(int snumber) {
		sgDAO.deleteSelf(snumber);
	}

	public void updatehitcount(SelfGuide sg) {
		
		sgDAO.updatehitcount(sg);
	}

	public void changeSelfPhoto(SelfGuide sg) {
		sgDAO.updateSelfPhoto(sg);
		
	}

	public List<SelfGuide> getOrder() {
		List<SelfGuide> selforder=sgDAO.selectOrder();
		return selforder;
	}

	public List<SelfGuide> getselfguidephotoListFilter(SelfGuide sg) {
		if(sg.getStype().equals("All")) {
			//필터가 적용안 될 경우
			if(sg.getSwriter() == null) {
				return sgDAO.selectByPage(sg);
			}else {
				return sgDAO.selectByPageMember(sg);
			}
		}else {
			//필터가 적용될 경우
			if(sg.getSwriter() == null) {
				return sgDAO.selectByPageFilter(sg);
			}else {
				return sgDAO.selectByMemberFilter(sg);
			}
		}
		
	}	
}
