package com.lec.ex01;

public class Friend {
	private String name;
	private String phone;
	private String birthday;
	
	public Friend(String name, String phone, String birthday) {
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
	}
	
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	@Override
	public String toString() {
		return "�� �� :"+ this.name + "\n" + "�ڵ��� :" + this.phone +"\n" + "�� �� :"+this.birthday+"\n";
	}
	
	
}
