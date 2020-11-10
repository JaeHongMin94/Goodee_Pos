package com.goodeecoffee.gc.menu.service;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.menu.dto.MenuDTO;

public interface IMenuService {

	List<Map<String, Object>> categoryLists(Map<String, Object> map);

	void insertCategory(String categoryName);

	void deleteCategory(String categoryName);

	List<Map<String, Object>> menuList(Map<String, Object> map);

	void insertMenu(MenuDTO menu);
	
	void deleteMenu(List<String> menuList);



}
