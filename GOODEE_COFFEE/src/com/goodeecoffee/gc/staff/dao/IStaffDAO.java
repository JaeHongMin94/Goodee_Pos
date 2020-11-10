package com.goodeecoffee.gc.staff.dao;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.staff.dto.StaffDTO;

public interface IStaffDAO {

	void staffInsert(StaffDTO staff);


	void staffWithdraw(StaffDTO staff);


	List<Map<String, Object>> staffList(Map<String, Object> map);


	StaffDTO staffSelect(int w_id);


	void staffUpdate(StaffDTO staff);
	
	/*로그인*/
	public String staffLoginCheck(StaffDTO staffDTO);

}