package com.goodeecoffee.gc.member.service;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.member.dto.MemberDTO;

public interface IMemberService {

	void memberInsert(MemberDTO member);

	void memberWithdraw(MemberDTO member);

	List<Map<String, Object>> memberList(Map<String, Object> map);

	MemberDTO memberSelect(int mID);

	void memberUpdate(MemberDTO member);

}
