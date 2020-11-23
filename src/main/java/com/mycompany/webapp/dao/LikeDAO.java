package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Post_like;

@Repository
public class LikeDAO {
	private Logger logger = LoggerFactory.getLogger(LikeDAO.class);
	@Resource
	private SqlSessionTemplate sst;

	public List<Post_like> likePhotoAllSelect(String memail) {
		
		List<Post_like> likelist = sst.selectList("mybatis.mapper.likephoto.likePhotoAll",memail);
		
		return likelist;
	}

	public  int PhotolikeInsert(Post_like post_like) {
		
		int rows=sst.insert("mybatis.mapper.likephoto.likePhotoInsert",post_like);
		return rows;
	}

	public int likephotoCheck(Post_like post_like) {
		int check = sst.selectOne("mybatis.mapper.likephoto.likepushCheck",post_like);
		return check;
	}

	public int likePhotoDelete(Post_like post_like) {
		int row =sst.delete("mybatis.mapper.likephoto.likePhotoDelete", post_like);
		return row;
	}
}
