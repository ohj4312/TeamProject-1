package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.NoticeDao;
import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;

@Service
public class NoticeService {
	
	@Resource
	private NoticeDao noticeDao;
	
	public int getTotalRows() {
		int totalRows = noticeDao.countAll();
		return totalRows;
	}

	public List<Notice> getnoticeList(Pager pager) {
		List<Notice> list = noticeDao.selectByPage(pager);
		return list;
	}

	public void noticeWrite(Notice notice) {
		noticeDao.insert(notice);
		
	}

	public Notice getnotice(int nnumber) {
		Notice notice = noticeDao.selectByBno(nnumber);
		return notice;
	}

	public void noticeDelete(int nnumber) {
		int rows = noticeDao.deleteByBno(nnumber);
		
	}

	public void noticeUpdate(Notice notice) {
		int rows = noticeDao.updateNotice(notice);
		
	}

}
