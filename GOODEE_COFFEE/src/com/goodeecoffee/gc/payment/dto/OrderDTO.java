package com.goodeecoffee.gc.payment.dto;

import java.sql.Timestamp;

public class OrderDTO {

	/*
	 CREATE TABLE pay_order(    
	    order_id    NUMBER(11) primary key, --주문 아이디
	    s_no        NUMBER(5) NOT NULL,     --직원 아이디
	    order_date  DATE DEFAULT SYSDATE,   --주문 날짜
	    total_price NUMBER(11) NOT NULL,    --총 주문 합계
	    order_state CHAR DEFAULT 'Y',       --결제 상태/ Y는 결제 완료, N은 결제취소로 할 예정
	    card        CHAR DEFAULT 'N',
	    cash        CHAR DEFAULT 'N',
	    --use_point   NUMBER(11) DEFAULT 0,       --포인트사용금액
	    --member_id   NUMBER(11) DEFAULT 'null',  --회원아이디
	    CONSTRAINT FK_order FOREIGN KEY(s_no) REFERENCES staff
	);
	*/
	
	private int order_id;
	private int s_no;
	private Timestamp order_date;
	private int total_price;
	private char order_state;
	private char card;
	private char cash;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public char getOrder_state() {
		return order_state;
	}
	public void setOrder_state(char order_state) {
		this.order_state = order_state;
	}
	public char getCard() {
		return card;
	}
	public void setCard(char card) {
		this.card = card;
	}
	public char getCash() {
		return cash;
	}
	public void setCash(char cash) {
		this.cash = cash;
	}
}
