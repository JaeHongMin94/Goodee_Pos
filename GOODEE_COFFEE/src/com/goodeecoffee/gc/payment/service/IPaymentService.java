package com.goodeecoffee.gc.payment.service;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.payment.dto.OrderDTO;

public interface IPaymentService {
	
	/*메뉴 불러오기*/
	List<Map<String, Object>> category(Map<String, Object> map);

	List<Map<String, Object>> coffeeMenu(Map<String, Object> map);
	
	List<Map<String, Object>> beverageMenu(Map<String, Object> map);
	
	List<Map<String, Object>> teaMenu(Map<String, Object> map);
	
	List<Map<String, Object>> adeMenu(Map<String, Object> map);
	
	List<Map<String, Object>> shakeMenu(Map<String, Object> map);
	
	List<Map<String, Object>> bakeryMenu(Map<String, Object> map);
	
	/*결제*/
	List<Map<String, Object>> paymentList(Map<String, Object> map);
	void insertOrder(OrderDTO order);
	void updateOrder(int order_id);
}
