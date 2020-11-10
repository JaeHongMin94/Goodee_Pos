package com.goodeecoffee.gc.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodeecoffee.gc.member.dto.MemberDTO;
import com.goodeecoffee.gc.member.service.IMemberService;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@RequestMapping(value="/member_register", method = RequestMethod.GET)
	public String register() {		
		return "member_register";
	}
	
	@RequestMapping(value="/member_registerInsert", method = RequestMethod.POST)
	public String registerInsert(HttpServletRequest request, HttpServletResponse response){	
		MemberDTO member = new MemberDTO();
		 
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		
		member.setM_name(m_name);
		member.setM_phone(m_phone);
		
		System.out.println(m_name);
		System.out.println(m_phone);
		
		memberService.memberInsert(member);
		 
		
		return "redirect:/member/member_list";
	}
	
	@RequestMapping(value="/member_alterInto", method = RequestMethod.GET)
	public String alterInto(@RequestParam(value="m_id", required=true) Integer mID, Model model) {
		System.out.println(mID);
		
		MemberDTO member = new MemberDTO();
		member = memberService.memberSelect(mID);
		model.addAttribute("memberSelect", member);

		return "member_alterInto";
	}
	
	@RequestMapping(value="/member_alterIntoUpdate", method = RequestMethod.POST)
	public String alterIntoUpdate(@RequestParam("m_id") int mID,
				@RequestParam("m_name") String mName, @RequestParam("m_phone") String mPhone) {	
		
		System.out.println("m_id : " + mID + ",mName : " + mName);
		
		MemberDTO member = new MemberDTO();
		member.setM_id(mID);
		member.setM_name(mName);
		member.setM_phone(mPhone);
		memberService.memberUpdate(member);
		
		return "redirect:/member/member_list";
	}
	
	@RequestMapping(value="/member_withdraw", method = RequestMethod.GET)
	public String withdraw() {
		return "member_withdraw";
	}
	
	@RequestMapping(value="/member_withdrawDelete", method = RequestMethod.POST)
	public String withdrawDelete(@RequestParam("m_id") int mID,
			@RequestParam("m_name") String mName, @RequestParam("m_phone") String mPhone) {	
		
		MemberDTO member = new MemberDTO();
		member.setM_id(mID);
		member.setM_name(mName);
		member.setM_phone(mPhone);

		
		memberService.memberWithdraw(member);
		return "redirect:/member/member_list";
	}

	
	@RequestMapping(value="/member_list", method = RequestMethod.GET)
	public String memberList(Map<String, Object> map, Model model) {		

		List<Map<String, Object>> memberList = new ArrayList<Map<String, Object>>();
		memberList = memberService.memberList(map);
		model.addAttribute("memberList", memberList);
		
		return "member_list";
	}
	
}