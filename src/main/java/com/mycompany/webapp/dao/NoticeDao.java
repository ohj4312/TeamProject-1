package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;

@Repository
public class NoticeDao {

	@Resource
	private SqlSessionTemplate sst;
	
	public int countAll() {
		int rows = sst.selectOne("mybatis.mapper.notice.countAll");
		return rows;
	}

	public List<Notice> selectByPage(Pager pager) {
		List<Notice> list = sst.selectList("mybatis.mapper.notice.selectByPage", pager);
		return list;
	}

	public int insert(Notice notice) {
		int rows = sst.insert("mybatis.mapper.notice.insert", notice);
		return rows;
		
	}

	public Notice selectByBno(int nnumber) {
		Notice notice = sst.selectOne("mybatis.mapper.notice.selectByBno", nnumber);
		return notice;
	}

	public int deleteByBno(int nnumber) {
		int rows = sst.delete("mybatis.mapper.notice.deleteByBno", nnumber);
		return rows;
	}

	public int updateNotice(Notice notice) {
		int rows = sst.update("mybatis.mapper.notice.update", notice);
		return rows;
	}

}
