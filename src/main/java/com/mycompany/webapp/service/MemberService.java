package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dto.Member;

@Service
public class MemberService {

	
	@Resource
	MemberDAO memberDAO;
	
	
	public boolean memberJoin(Member member) {
		if(memberDAO.insert(member) > 0) {
			return true;
		}else {
			return false;
		}
	}


	public Member login(Member member) {
		Member loginMember = memberDAO.selectMember(member); 
		if(loginMember.getMemail().isEmpty()) {
			loginMember.setLoginResult(false);
			return loginMember;
		}else {
			if(member.getMemail().equals(loginMember.getMemail()) && member.getMpassword().equals(loginMember.getMpassword())) {
				loginMember.setLoginResult(true);
				return loginMember;
			}
			loginMember.setLoginResult(false);
			return loginMember;
			
		}
		
	}

}
