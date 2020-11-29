package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.FollowDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.PhotoDAO;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;

@Service
public class MemberService {

	
	@Resource
	MemberDAO memberDAO;
	
	@Resource
	PhotoDAO photoDAO;
	
	@Resource
	FollowDAO followDAO;
	
	
	public boolean memberJoin(Member member) {
		if(memberDAO.insert(member) > 0) {
			return true;
		}else {
			return false;
		}
	}

	public Member getMember(String name) {
		
		return memberDAO.selectMember(name);
	}

	public Member getYourHomeSearch(String pwriter) {
		Member member = memberDAO.getProfilInfo(pwriter);
		member.setList(photoDAO.selectMemberPhotoList(pwriter));
		member.setFollowerCount(followDAO.selectFollowerCount(pwriter));
		member.setFollowingCount(followDAO.selectFollowingCount(pwriter));
		return member;
		
	}

}
