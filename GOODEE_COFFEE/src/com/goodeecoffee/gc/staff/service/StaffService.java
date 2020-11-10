package com.goodeecoffee.gc.staff.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.goodeecoffee.gc.staff.dao.IStaffDAO;
import com.goodeecoffee.gc.staff.dto.StaffDTO;

@Service("staffService")
public class StaffService implements IStaffService{
	
	/*
	@Inject
	MemberDAO memberDAO;
	*/
	
	@Resource(name="staffDAO")
	private IStaffDAO staffDAO;

	@Override
	public void staffInsert(StaffDTO staff) {
		// TODO Auto-generated method stub
		staffDAO.staffInsert(staff);
	}

	@Override
	public void staffWithdraw(StaffDTO staff) {
		// TODO Auto-generated method stub
		staffDAO.staffWithdraw(staff);
	}

	@Override
	public List<Map<String, Object>> staffList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.staffList(map);
	}

	@Override
	public StaffDTO staffSelect(int wID) {
		// TODO Auto-generated method stub
		return staffDAO.staffSelect(wID);
	}

	@Override
	public void staffUpdate(StaffDTO staff) {
		// TODO Auto-generated method stub
		staffDAO.staffUpdate(staff);
	}
	
	
	/*로그인*/
	@Override
	public String staffLoginCheck(StaffDTO staffDTO) {
		// TODO Auto-generated method stub
		return staffDAO.staffLoginCheck(staffDTO);
	}
	

}