package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.SelfBookMarkDAO;
import com.mycompany.webapp.dto.Post_bookmark;
import com.mycompany.webapp.dto.SelfGuide;

@Service
public class SelfBookMarkService {
	
	@Resource
	private SelfBookMarkDAO selfbookmarkDAO;
	
	//등 록
	public void selfRegister(Post_bookmark pb) {
		
		selfbookmarkDAO.insertselfBookMark(pb);
	}
	
	//삭 제
	public void selfcancelBookMark(Post_bookmark pb) {
		
		selfbookmarkDAO.cancelselfBookMark(pb);
	}
	
	//체 크
	public int selfcheckBookMark(Post_bookmark pb) {
		
		return selfbookmarkDAO.checkselfBookMark(pb);
	}
	
	//리스트 조회
	public List<SelfGuide> selfgetBookMarkList(String memail) {
		List<SelfGuide> list= selfbookmarkDAO.selectselfBookMark(memail);
		return list;
	}

	public List<SelfGuide> getBookMarkList(String memail) {
		// TODO Auto-generated method stub
		return selfbookmarkDAO.selectBookMark(memail);
	}

}
