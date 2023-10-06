package com.example.mvc.model.dao;

import java.util.ArrayList;

import com.example.mvc.model.dto.Member;

public class MemberRepository {

	private static MemberRepository instance = new MemberRepository();
	private ArrayList<Member> members = new ArrayList<>();
	
	public static MemberRepository getInstance() {
		return instance;
	}
	
	public void addMember(Member member) {
		members.add(member);
	}
	public Member getMemberById(String memberId) {
		for(Member member : members)
			if(member.getMemberId().equals(memberId))
				return member;
		
		return null;
	}
}
