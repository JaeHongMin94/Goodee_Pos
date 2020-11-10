package com.goodeecoffee.gc.staff.dto;

import oracle.sql.DATE;

public class StaffDTO {
	
	private int w_id;
    private String w_name;
    private String w_pwd;
    private String w_phone;
	private DATE indate;
    private String use;    
    
    public StaffDTO() {}
	
	public StaffDTO(int userId, String userPwd, String name) {
		super();
		this.w_id = userId;
		this.w_pwd = userPwd;
		this.w_name = name;
	}

    
    public String getW_phone() {
		return w_phone;
	}
	public void setW_phone(String w_phone) {
		this.w_phone = w_phone;
	}
    public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getW_pwd() {
		return w_pwd;
	}
	public void setW_pwd(String w_pwd) {
		this.w_pwd = w_pwd;
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