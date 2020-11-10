package com.goodeecoffee.gc.menu.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.goodeecoffee.gc.menu.dao.IMenuDAO;
import com.goodeecoffee.gc.menu.dto.MenuDTO;

@Service("menuService")
public class MenuService implements IMenuService{

	@Resource(name="menuDAO")
	private IMenuDAO menuDAO;
	
	@Override
	public List<Map<String, Object>> categoryLists(Map<String, Object> map) {
		return menuDAO.categoryLists(map);
	}

	@Override
	public void insertCategory(String categoryName) {
		menuDAO.insertCategory(categoryName);
		
	}

	@Override
	public void deleteCategory(String categoryName) {
		menuDAO.deleteCategory(categoryName);
		
	}

	@Override
	public List<Map<String, Object>> menuList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return menuDAO.menuList(map);
	}

	@Override
	public void insertMenu(MenuDTO menu) {
		// TODO Auto-generated method stub
		menuDAO.insertMenu(menu);
	}

	@Override
	public void deleteMenu(List<String> menuList) {
		// TODO Auto-generated method stub
		menuDAO.deleteMenu(menuList);
	}

	

}
