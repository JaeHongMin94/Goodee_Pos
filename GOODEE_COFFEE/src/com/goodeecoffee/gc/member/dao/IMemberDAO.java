package com.goodeecoffee.gc.member.dao;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.member.dto.MemberDTO;

public interface IMemberDAO {
	
	void memberInsert(MemberDTO member);


	void memberWithdraw(MemberDTO member);


	List<Map<String, Object>>memberList(Map<String, Object> map);


	MemberDTO memberSelect(int m_id);


	void memberUpdate(MemberDTO member);

}