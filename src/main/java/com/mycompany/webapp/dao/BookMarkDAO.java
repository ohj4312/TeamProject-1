package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
 
import com.mycompany.webapp.dto.Post_bookmark;

public class BookMarkDAO {

	@Resource
	private SqlSessionTemplate sst;
	
	public List<Post_bookmark> selectBookMark(Post_bookmark bookmark) {
		List<Post_bookmark> list = sst.selectList("mybatis.mapper.bookmark.selectBookMark",bookmark);
		return list;
	}

	public int insertBookMark(Post_bookmark bookmark) {
		int rows = sst.insert("mybatis.mapper.bookmark.insertBookMark",bookmark);
		return rows;
	}

	//delete 부분.
	
	
}
