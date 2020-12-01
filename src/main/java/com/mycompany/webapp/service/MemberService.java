package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.FollowDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.PhotoDAO;
import com.mycompany.webapp.dto.Follows;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.dto.SelfGuide;

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

	public Member getYourHomeSearch(String pwriter, String memail) {
		Member member = memberDAO.getProfilInfo(pwriter);
		
		
		Follows follow = new Follows();
		follow.setFollower(memail);
		follow.setFollowing(pwriter);
		member.setFollowCheking(followDAO.selectChecking(follow));	

		member.setList(photoDAO.selectMemberPhotoList(pwriter));
		member.setFollowerCount(followDAO.selectFollowerCount(pwriter));
		member.setFollowingCount(followDAO.selectFollowingCount(pwriter));
		return member;
		
	}

	public Member getYourHomeSearch(String pwriter) {
		Member member = memberDAO.getProfilInfo(pwriter);
		
		
		member.setList(photoDAO.selectMemberPhotoList(pwriter));
		member.setFollowerCount(followDAO.selectFollowerCount(pwriter));
		member.setFollowingCount(followDAO.selectFollowingCount(pwriter));
		return member;
	}

	public List<SelfGuide> getSelfGuidList(String memail) {
		//List<SelfGuide> list;
		return null;
	}

}
