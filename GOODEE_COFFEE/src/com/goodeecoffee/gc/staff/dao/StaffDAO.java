package com.goodeecoffee.gc.staff.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodeecoffee.gc.staff.dto.StaffDTO;

@Repository("staffDAO")
public class StaffDAO implements IStaffDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void staffInsert(StaffDTO staff) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.staffInsert", staff);
	}

	@Override
	public void staffWithdraw(StaffDTO staff) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.staffWithdraw", staff);
	}

	@Override
	public List<Map<String, Object>> staffList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.staffList", map);
	}

	@Override
	public StaffDTO staffSelect(int w_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.staffSelect", w_id);
	}

	@Override
	public void staffUpdate(StaffDTO staff) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.staffUpdate", staff);
	}
	
	@Override
	public String staffLoginCheck(StaffDTO staffDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.staffLoginCheck", staffDTO);
	}
}