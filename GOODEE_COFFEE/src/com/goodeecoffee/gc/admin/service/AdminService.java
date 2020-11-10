package com.goodeecoffee.gc.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodeecoffee.gc.admin.dao.AdminDAO;
import com.goodeecoffee.gc.admin.dto.AdminDTO;

@Service("adminService")
public class AdminService implements IAdminService{
	
	@Inject
	AdminDAO adminDAO;

	@Override
	public String adminLoginCheck(AdminDTO adminDTO) {
		// TODO Auto-generated method stub
		return adminDAO.adminLoginCheck(adminDTO);
	}
	
}
