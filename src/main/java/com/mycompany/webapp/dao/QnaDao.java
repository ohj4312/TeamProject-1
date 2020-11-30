package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
@Repository
public class QnaDao {

	@Resource
	private SqlSessionTemplate sst;
	
	public  List<Qna> selectAll() {
		List<Qna> list = sst.selectList("mybatis.mapper.qna.selectAll");
		return list;
	}

	public List<Qna> selectByPage(Pager pager) {
		List<Qna> list = sst.selectList("mybatis.mapper.qna.selectByPage", pager);
		return list;
	}

	public int countAll() {
		int rows = sst.selectOne("mybatis.mapper.qna.countAll");
		return rows;
	}

	public int insert(Qna qna) {
		int rows = sst.insert("mybatis.mapper.qna.insert", qna); 
		return rows;
	}

	public Qna selectByBno(int qnumber) {
		Qna qna = sst.selectOne("mybatis.mapper.qna.selectByBno", qnumber);
		return qna;
	}

}
