package com.goodeecoffee.gc.payment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.goodeecoffee.gc.payment.dao.IPaymentDAO;
import com.goodeecoffee.gc.payment.dto.OrderDTO;

@Service("paymentService")
public class PaymentService implements IPaymentService{
	
	@Resource(name="paymentDAO")
	private IPaymentDAO paymentDAO;

	/*메뉴 불러오기*/
	@Override
	public List<Map<String, Object>> coffeeMenu(Map<String, Object> map) {
		return paymentDAO.coffeeMenu(map);
	}
	@Override
	public List<Map<String, Object>> beverageMenu(Map<String, Object> map) {
		return paymentDAO.beverageMenu(map);
	}
	@Override
	public List<Map<String, Object>> teaMenu(Map<String, Object> map) {
		return paymentDAO.teaMenu(map);
	}
	@Override
	public List<Map<String, Object>> adeMenu(Map<String, Object> map) {
		return paymentDAO.adeMenu(map);
	}
	@Override
	public List<Map<String, Object>> shakeMenu(Map<String, Object> map) {
		return paymentDAO.shakeMenu(map);
	}

	@Override
	public List<Map<String, Object>> bakeryMenu(Map<String, Object> map) {
		return paymentDAO.bakeryMenu(map);
	}
	@Override
	public List<Map<String, Object>> category(Map<String, Object> map) {
		return paymentDAO.category(map);
	}
	
	/*결제*/
	@Override
	public List<Map<String, Object>> paymentList(Map<String, Object> map) {
		return paymentDAO.paymentList(map);
	}
	@Override
	public void insertOrder(OrderDTO order) {//카드 or 현금 결제
		paymentDAO.insertOrder(order);
	}
	@Override
	public void updateOrder(int order_id) {
		paymentDAO.updateOrder(order_id);
	}

}
