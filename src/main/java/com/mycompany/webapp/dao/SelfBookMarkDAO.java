package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Post_bookmark;
import com.mycompany.webapp.dto.SelfGuide;

@Repository
public class SelfBookMarkDAO {
	
	@Resource
	private SqlSessionTemplate sst;
	
	public void insertselfBookMark(Post_bookmark pb) {
		sst.insert("mybatis.mapper.selfbookmark.insertselfBookMark",pb);
		
	}

	public void cancelselfBookMark(Post_bookmark pb) {
		sst.delete("mybatis.mapper.selfbookmark.deleteselfBookMark",pb);
		
	}

	public int checkselfBookMark(Post_bookmark pb) {
		
		return sst.selectOne("mybatis.mapper.selfbookmark.checkselfBookMark",pb);
	}

	public List<SelfGuide> selectselfBookMark(String memail) {
		
		return sst.selectList("mybatis.mapper.selfbookmark.selectselfBookMark",memail);
	}

	

	

}
