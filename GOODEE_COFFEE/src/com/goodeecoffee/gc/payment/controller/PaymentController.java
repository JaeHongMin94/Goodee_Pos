package com.goodeecoffee.gc.payment.controller;

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
import com.goodeecoffee.gc.payment.dto.OrderDTO;
import com.goodeecoffee.gc.payment.service.IPaymentService;

@Controller
public class PaymentController {
	
	@Resource(name="paymentService")
	private IPaymentService paymentService;

	/*메뉴 불러오기*/
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String payment(Map<String, Object> map, Model model) {
		
		List<Map<String, Object>> coffeeMenu = new ArrayList<Map<String, Object>>();
		coffeeMenu = paymentService.coffeeMenu(map);
		model.addAttribute("coffeeMenu", coffeeMenu);
		
		List<Map<String, Object>> beverageMenu = new ArrayList<Map<String, Object>>();
		beverageMenu = paymentService.beverageMenu(map);
		model.addAttribute("beverageMenu", beverageMenu);
		
		List<Map<String, Object>> teaMenu = new ArrayList<Map<String, Object>>();
		teaMenu = paymentService.teaMenu(map);
		model.addAttribute("teaMenu", teaMenu);
		
		List<Map<String, Object>> adeMenu = new ArrayList<Map<String, Object>>();
		adeMenu = paymentService.adeMenu(map);
		model.addAttribute("adeMenu", adeMenu);
		
		List<Map<String, Object>> shakeMenu = new ArrayList<Map<String, Object>>();
		shakeMenu = paymentService.shakeMenu(map);
		model.addAttribute("shakeMenu", shakeMenu);
		
		List<Map<String, Object>> bakeryMenu = new ArrayList<Map<String, Object>>();
		bakeryMenu = paymentService.bakeryMenu(map);
		model.addAttribute("bakeryMenu", bakeryMenu);
		
		List<Map<String, Object>> category = new ArrayList<Map<String, Object>>();
		category = paymentService.category(map);
		model.addAttribute("category", category);
		
		List<Map<String, Object>> paymentList = new ArrayList<Map<String, Object>>();
		paymentList = paymentService.paymentList(map);
		model.addAttribute("paymentList", paymentList);
		
		
		return "payment";
	}
	/*결제 insert*/
	@RequestMapping(value="/orderInsert", method=RequestMethod.GET)
	 public String orderInsert(HttpServletRequest request) { //요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
		 	System.out.println("orderInsert() 실행"); 
		 	try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 	OrderDTO order = new OrderDTO();
		 	int s_no = 1000;//직원아이디 ->로그인값에서 가져오기
			int total_price = Integer.parseInt(request.getParameter("total_price"));
			String payment = request.getParameter("payment");
			char card;
			char cash;
			
			if(payment.equals("card")) {//카드결제
				card = 'Y';
				cash = 'N';
				order.setCard(card);
				order.setCash(cash);
				System.out.println(card);
			}else if(payment.equals("cash")) {//현금결제
				card = 'N';
				cash = 'Y';
				order.setCard(card);
				order.setCash(cash);
				System.out.println(cash);
			}
			
			order.setS_no(s_no);
			
			order.setTotal_price(total_price);

			paymentService.insertOrder(order);

			return "redirect:/payment";
	}
	/*결제 취소*/
	@RequestMapping(value="/orderUpdate", method=RequestMethod.GET)
	 public String orderUpdate(Map<String, Object> map, HttpServletRequest request) { //요청을 utf-8로 설정해주는 것, filter로 바꿔야함.
		 	System.out.println("orderUpdate() 실행"); 
		 	try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int order_id = Integer.parseInt(request.getParameter("order_id"));

			paymentService.updateOrder(order_id);


			return "redirect:/payment";
	}
}
