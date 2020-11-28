package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QnaDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
@Service
public class QnaService {
	
	@Resource
	private QnaDao qnaDao;
	
	public List<Qna> getqnaList() {
		List<Qna> list = qnaDao.selectAll();
		return list;
	}

	public List<Qna> getqnaList(Pager pager) {
		List<Qna> list = qnaDao.selectByPage(pager);
		return list;
	}

	public int getTotalRows() {
		int totalRows = qnaDao.countAll();
		return totalRows;
	}

	public void qnaWrite(Qna qna) {
		qnaDao.insert(qna);
		
	}

	

}
