package com.goodeecoffee.gc.menu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodeecoffee.gc.menu.dto.MenuDTO;

@Repository("menuDAO")
public class MenuDAO implements IMenuDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> categoryLists(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.category", map);
	}

	@Override
	public void insertCategory(String category_name) {
		sqlSession.insert("mapper.categoryInsert", category_name);
		
	}

	@Override
	public void deleteCategory(String category_name) {
		sqlSession.delete("mapper.categoryDelete", category_name);
		
	}

	@Override
	public List<Map<String, Object>> menuList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.menuList", map);
	}

	@Override
	public void insertMenu(MenuDTO menu) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.menuInsert", menu);
	}
	
	@Override
	public void deleteMenu(List<String> menuList) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.menuDelete", menuList);
	}


}
