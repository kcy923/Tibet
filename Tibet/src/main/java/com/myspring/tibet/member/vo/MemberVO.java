package com.myspring.tibet.member.vo;

import java.util.Date;

import org.springframework.stereotype.Component;


@Component("memberVO")
public class MemberVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_birth;
	private String user_phone;
	private String user_email;
	private String user_addr;
	private int user_gender;
	private String user_membership;
	private Date user_joinDate;
	private int user_reserves;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public int getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(int user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_membership() {
		return user_membership;
	}

	public void setUser_membership(String user_membership) {
		this.user_membership = user_membership;
	}

	public Date getUser_joinDate() {
		return user_joinDate;
	}

	public void setUser_joinDate(Date user_joinDate) {
		this.user_joinDate = user_joinDate;
	}

	public int getUser_reserves() {
		return user_reserves;
	}

	public void setUser_reserves(int user_reserves) {
		this.user_reserves = user_reserves;
	}
}


