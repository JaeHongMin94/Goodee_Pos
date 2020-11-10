package com.goodeecoffee.gc.payment.dao;

import java.util.List;
import java.util.Map;

import com.goodeecoffee.gc.payment.dto.OrderDTO;

public interface IPaymentDAO {
	
	/*메뉴불러오기*/
	List<Map<String, Object>> category(Map<String, Object> map);
	List<Map<String, Object>> coffeeMenu(Map<String, Object> map);
	List<Map<String, Object>> beverageMenu(Map<String, Object> map);
	List<Map<String, Object>> teaMenu(Map<String, Object> map);	
	List<Map<String, Object>> adeMenu(Map<String, Object> map);	
	List<Map<String, Object>> shakeMenu(Map<String, Object> map);
	List<Map<String, Object>> bakeryMenu(Map<String, Object> map);
	
	/*결제*/
	List<Map<String, Object>> paymentList(Map<String, Object> map);
	void insertOrder(OrderDTO order); //결제하기
	void updateOrder(int order_id);	  //결제취소

}
