package com.goodeecoffee.gc.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodeecoffee.gc.member.dto.MemberDTO;
import com.goodeecoffee.gc.staff.dao.IStaffDAO;
import com.goodeecoffee.gc.staff.dto.StaffDTO;

@Repository("memberDAO")
public class MemberDAO implements IMemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void memberInsert(MemberDTO member) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.memberInsert", member);
	}

	@Override
	public void memberWithdraw(MemberDTO member) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.memberWithdraw", member);
	}

	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.memberList", map);
	}

	@Override
	public MemberDTO memberSelect(int m_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.memberSelect", m_id);
	}

	@Override
	public void memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.memberUpdate", member);
	}

	

}