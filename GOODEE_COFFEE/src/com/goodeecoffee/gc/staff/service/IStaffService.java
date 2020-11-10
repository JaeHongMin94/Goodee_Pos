package com.goodeecoffee.gc.staff.service;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.staff.dto.StaffDTO;

public interface IStaffService {

	void staffInsert(StaffDTO staff);

	void staffWithdraw(StaffDTO staff);

	List<Map<String, Object>> staffList(Map<String, Object> map);

	StaffDTO staffSelect(int wID);

	void staffUpdate(StaffDTO staff);
	
	/*로그인*/
	public String staffLoginCheck(StaffDTO staffDTO);

}