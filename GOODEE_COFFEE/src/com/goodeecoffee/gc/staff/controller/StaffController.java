package com.goodeecoffee.gc.staff.controller;

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

import com.goodeecoffee.gc.staff.dto.StaffDTO;
import com.goodeecoffee.gc.staff.service.IStaffService;

@Controller
public class StaffController {
	
	@Resource(name = "staffService")
	private IStaffService staffService;
	
	@RequestMapping(value="/staff_register", method = RequestMethod.GET)
	public String register() {		
		return "staff_register";
	}
	
	@RequestMapping(value="/staff_registerInsert", method = RequestMethod.POST)
	public String registerInsert(HttpServletRequest request, HttpServletResponse response){	
		StaffDTO staff = new StaffDTO();
		 
		String wName = request.getParameter("w_name");
		String wPhone = request.getParameter("w_phone");
		
		staff.setW_name(wName);
		staff.setW_phone(wPhone);
		
		System.out.println(wName);
		System.out.println(wPhone);
		
		staffService.staffInsert(staff);
		 
		
		return "redirect:/staff/staff_list";
	}
	
	@RequestMapping(value="/staff_alterInto", method = RequestMethod.GET)
	public String alterInto(@RequestParam(value="w_id", required=true) Integer wID, Model model) {
		System.out.println(wID);
			
		System.out.println("else");
		System.out.println("wID : " + wID);
		StaffDTO staff = new StaffDTO();
		staff = staffService.staffSelect(wID);
		model.addAttribute("staffSelect", staff);

		return "staff_alterInto";
	}
	
	@RequestMapping(value="/staff_alterIntoUpdate", method = RequestMethod.POST)
	public String alterIntoUpdate(@RequestParam("w_id") int wID,
				@RequestParam("w_name") String wName, @RequestParam("w_phone") String wPhone) {	
		
		System.out.println("w_id : " + wID + ",wName : " + wName);
		
		StaffDTO staff = new StaffDTO();
		staff.setW_id(wID);
		staff.setW_name(wName);
		staff.setW_phone(wPhone);
		staffService.staffUpdate(staff);
		
		return "redirect:/staff/staff_list";
	}
	
	@RequestMapping(value="/staff_withdraw", method = RequestMethod.GET)
	public String withdraw() {
		return "staff_withdraw";
	}
	
	@RequestMapping(value="/staff_withdrawDelete", method = RequestMethod.POST)
	public String withdrawDelete(@RequestParam("w_id") int wID,
			@RequestParam("w_name") String wName, @RequestParam("w_phone") String wPhone) {	
		
		StaffDTO staff = new StaffDTO();
		staff.setW_id(wID);
		staff.setW_name(wName);
		staff.setW_phone(wPhone);
		System.out.println(wID);
		System.out.println(wName);
		System.out.println(wPhone);
		
		staffService.staffWithdraw(staff);
		return "redirect:/staff/staff_list";
	}
	
	
	
	@RequestMapping(value="/staff_commute", method = RequestMethod.GET)
	public String staffCommute() {		
		return "staff_commute";
	}
	
	@RequestMapping(value="/staff_list", method = RequestMethod.GET)
	public String staffList(Map<String, Object> map, Model model) {		

		List<Map<String, Object>> staffList = new ArrayList<Map<String, Object>>();
		staffList = staffService.staffList(map);
		model.addAttribute("staffList", staffList);
		
		return "staff_list";
	}
	
}