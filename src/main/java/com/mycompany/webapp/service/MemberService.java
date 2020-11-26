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

	public Member getMember(String name) {
		
		return memberDAO.selectMember(name);
	}

}
