package com.goodeecoffee.gc.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.goodeecoffee.gc.admin.dto.AdminDTO;

@Repository("adminDAO")
public class AdminDAO implements IAdminDAO{
	
	@Inject
    SqlSession sqlSession;

	@Override
	public String adminLoginCheck(AdminDTO adminDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.adminLoginCheck", adminDTO);
	}
	
}
