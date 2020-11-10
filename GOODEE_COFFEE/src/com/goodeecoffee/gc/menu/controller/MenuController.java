package com.goodeecoffee.gc.menu.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goodeecoffee.gc.menu.dto.MenuDTO;
import com.goodeecoffee.gc.menu.service.IMenuService;

@Controller
public class MenuController {

	@Resource(name = "menuService")
	private IMenuService menuService;

	@RequestMapping(value = "/menuBoard", method = RequestMethod.GET)
	public String menu(Map<String, Object> map, Model model) {

		List<Map<String, Object>> categoryList = new ArrayList<Map<String, Object>>();
		categoryList = menuService.categoryLists(map);
		model.addAttribute("category", categoryList);

		List<Map<String, Object>> menuList = new ArrayList<Map<String, Object>>();
		menuList = menuService.menuList(map);
		model.addAttribute("menuList", menuList);

		return "menuBoard";
	}

	@RequestMapping(value = "/categoryInsert", method = RequestMethod.POST)
	public String categoryInsert(HttpServletRequest request) {
		// 요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String categoryName = request.getParameter("category_name");
		System.out.println(categoryName);
		// System.out.println("categoryInsert()");
		menuService.insertCategory(categoryName);

		return "redirect:/menu/menuBoard";
	}

	@RequestMapping(value = "/categoryDelete", method = RequestMethod.GET)
	public String categoryDelete(HttpServletRequest request) {
		// 요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String categoryName = request.getParameter("category_name");
		System.out.println(categoryName);
		// System.out.println("categoryInsert()");
		menuService.deleteCategory(categoryName);

		return "redirect:/menu/menuBoard";
	}

	
	 @RequestMapping(value="/menuInsert", method=RequestMethod.GET)
	 public String menuInsert(HttpServletRequest request) { //요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
		 try {
			 request.setCharacterEncoding("UTF-8");
		 } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		 MenuDTO menu = new MenuDTO();
		 
		 int categoryNo = Integer.parseInt(request.getParameter("category_no"));
		 String menuName = request.getParameter("menu_name");
		 int price = Integer.parseInt(request.getParameter("price"));
		 
		 menu.setCategory_no(categoryNo);
		 menu.setMenu_name(menuName);
		 menu.setPrice(price);
		 //menu.setDescription(null);
		 
		 System.out.println(categoryNo);
		 System.out.println(menuName);
		 System.out.println(price);
		 //System.out.println("categoryInsert()");
		 menuService.insertMenu(menu);
		 
		 
		 return "redirect:/menu/menuBoard";
	 }
	 
	 @RequestMapping(value = "/deleteMenu", method = RequestMethod.GET)
		public String deleteMenu(Map<String, Object> map, HttpServletRequest request) {
			// 요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String[] menuStringList = request.getParameterValues("menuID");
			List<String> menuList = new ArrayList<String>(menuStringList.length);
			for(String menu : menuStringList) {
				menuList.add(menu);
				System.out.println("==========메뉴 번호=============");
				System.out.println(menu);
			}
			menuService.deleteMenu(menuList);


			return "redirect:/menu/menuBoard";
	 }

}
