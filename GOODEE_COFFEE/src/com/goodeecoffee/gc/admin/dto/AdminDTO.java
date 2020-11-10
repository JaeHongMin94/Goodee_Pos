package com.goodeecoffee.gc.admin.dto;

import oracle.sql.DATE;

public class AdminDTO {

	private String a_id;
	private String a_pwd;
	private String a_name;
	private DATE indate;
	private String a_use;
	
	public AdminDTO() {}

	public AdminDTO(String userId, String userPwd, String name) {
		super();
		this.a_id = userId;
		this.a_pwd = userPwd;
		this.a_name = name;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public DATE getIndate() {
		return indate;
	}

	public void setIndate(DATE indate) {
		this.indate = indate;
	}

	public String getA_use() {
		return a_use;
	}

	public void setA_use(String a_use) {
		this.a_use = a_use;
	}
	
	
}

	