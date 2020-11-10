package com.goodeecoffee.gc.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.goodeecoffee.gc.member.dao.IMemberDAO;
import com.goodeecoffee.gc.member.dto.MemberDTO;


@Service("memberService")
public class MemberService implements IMemberService{
	
	
	@Resource(name="memberDAO")
	private IMemberDAO memberDAO;

	@Override
	public void memberInsert(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.memberInsert(member);
	}

	@Override
	public void memberWithdraw(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.memberWithdraw(member);
	}

	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.memberList(map);
	}

	@Override
	public MemberDTO memberSelect(int mID) {
		// TODO Auto-generated method stub
		return memberDAO.memberSelect(mID);
	}

	@Override
	public void memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.memberUpdate(member);
	}

}
