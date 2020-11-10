package com.goodeecoffee.gc.member.dto;

import oracle.sql.DATE;

/*by 박가연*/
public class MemberDTO {
	
	/*
		CREATE TABLE member(    
	    m_id    NUMBER(5) PRIMARY KEY, --회원 아이디
	    m_name  VARCHAR2(10) NOT NULL, --회원 이름
	    m_phone VARCHAR2(20) NOT NULL, --회원 연락처
	    point   NUMBER(5) DEFAULT '0', --회원포인트
	    total   NUMBER(5) DEFAULT '0', --회원 총 결제내역
	    indate  DATE DEFAULT SYSDATE,  --회원 등록 날짜
	    use CHAR(1) DEFAULT 'N'        --회원탈퇴
	);
	*/
	
	private int m_id;
	private String m_name;
	private String m_phone;
	private int point;
	private int total;
	private DATE indate;
	private String use;
	
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public DATE getIndate() {
		return indate;
	}
	public void setIndate(DATE indate) {
		this.indate = indate;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}

}
