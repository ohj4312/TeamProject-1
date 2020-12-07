package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(member.getMpassword());
		member.setMpassword(encodedPassword);
		
		member.setMenabled(true);
		member.setMrole("ROLE_USER");
		member.setMgender(0);
		member.setMimage("12345_unnamed.png");
		
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

	public List<SelfGuide> getSelfGuideList(String memail) {
		return memberDAO.selectSelfGuideList(memail);
	}

	public void updateMimage(Member member) {
		memberDAO.updateMimage(member);
		
	}

	public boolean updatePassword(Member member, String update_password) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String matchpassword = memberDAO.selectPassword(member);
		if(passwordEncoder.matches(member.getMpassword(), matchpassword)) {
			String encodedPassword = passwordEncoder.encode(update_password);
			member.setMpassword(encodedPassword);
			memberDAO.updatePassword(member);
			return true;
		}else {
			return false;
		}
		
		
	}

	public void delteMember(Member member) {
		memberDAO.deleteMember(member);
		
	}

}
