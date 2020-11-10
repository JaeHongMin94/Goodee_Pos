package com.goodeecoffee.gc.payment.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodeecoffee.gc.payment.dto.OrderDTO;

@Repository("paymentDAO")
public class PaymentDAO implements IPaymentDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*메뉴불러오기*/
	@Override
	public List<Map<String, Object>> coffeeMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.coffeeMenuList", map);
	}
	@Override
	public List<Map<String, Object>> beverageMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.beverageMenuList", map);
	}
	@Override
	public List<Map<String, Object>> teaMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.teaMenuList", map);
	}
	@Override
	public List<Map<String, Object>> adeMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.adeMenuList", map);
	}
	@Override
	public List<Map<String, Object>> shakeMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.shakeMenuList", map);
	}
	@Override
	public List<Map<String, Object>> bakeryMenu(Map<String, Object> map) {
		return sqlSession.selectList("mapper.bakeryMenuList", map);
	}
	@Override
	public List<Map<String, Object>> category(Map<String, Object> map) {
		return sqlSession.selectList("mapper.categoryList", map);
	}
	
	/*결제*/
	@Override
	public List<Map<String, Object>> paymentList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.paymentList", map);
	}
	@Override
	public void insertOrder(OrderDTO order) {
		sqlSession.insert("mapper.orderInsert", order);
	}
	@Override
	public void updateOrder(int order_id) {
		sqlSession.update("mapper.orderUpdate", order_id);
	}
}
