package com.lec.ex05_lib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class BookLib implements ILendable {
	private String borrower;
	private byte state;
	private String checkOutDate;
	private String bookNo;
	private String bookTitle;
	private String writer;
	Date checkoutDate;
	Date checkinDate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd�� E����");
	
	
	
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	

	public String getBorrower() {
		return borrower;
	}


	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}


	public byte getState() {
		return state;
	}


	
	public void setState(byte state) {
		this.state = state;
	}


	public String getBookNo() {
		return bookNo;
	}


	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}


	public String getBookTitle() {
		return bookTitle;
	}


	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	
	public Date getCheckoutDate() {
		return checkoutDate;
	}


	public void setCheckoutDate(Date checkoutDate) {
		this.checkoutDate = checkoutDate;
	}


	public Date getCheckinDate() {
		return checkinDate;
	}


	public void setCheckinDate(Date checkinDate) {
		this.checkinDate = checkinDate;
	}


	@Override
	public void checkOut(String borrower) throws Exception {
		if(state != STATE_NORMAL) {
			throw new Exception("�������� �����Դϴ�.");
		}
		//����ó�� ����
		this.borrower = borrower;
		checkoutDate = new Date();
		state = STATE_BORROWED;
		// ���� �ϼ��� �޼���: "����" ������ ����Ǿ����ϴ�.
		System.out.println("\""+this.getBookTitle()+"\" ������ ����Ǿ����ϴ�");
		System.out.println("[������]"+borrower);
		System.out.println("[������]"+sdf.format(checkoutDate));
	}

	@Override
	public void checkIn() throws Exception {
		if(state != STATE_BORROWED) {
			throw new Exception("�볳���� ������ �ƴմϴ�.");
		}
		
		// �ݳ�ó�� ����
		checkinDate = new Date();
		
		long diff = checkinDate.getTime()-checkoutDate.getTime();
		long day = diff/(1000*60*60*24);				//�� ���� ���� ������ �����°�?
		if(day>14) {
			long money = (day-14)*100;
			System.out.println(money+"�� ��ü�Ḧ �����ϼž� �մϴ�.(y/n)");
			Scanner sc = new Scanner(System.in);
			String c = sc.next();
			if(c.equalsIgnoreCase("y")) {
				System.out.println("�ݳ��Ϸ�");
			}else {
				System.out.println("�ݳ��̿Ϸ� ��ü�Ḧ ���ʽÿ�");
			}
		}
		borrower = null;
		checkinDate = null;
		state = STATE_NORMAL;
		// ���� �ϼ��� �޼���: "����" ������ ����Ǿ����ϴ�.
		System.out.println("\""+this.getBookTitle()+"\" ������ �ݳ��Ǿ����ϴ�");
		

	}
	
	@Override
	public String toString() {
		//java(890��-01)" ȫ�浿�� ���Ⱑ��
		//"hadoop(890��-02)" ȫ�ϵ��� ����(20-12-16 ������) ��
		if(state==STATE_NORMAL) {
			return bookTitle +"("+bookNo+")"+ getBookTitle()+"���Ⱑ��";
		}else {
			return bookTitle +"("+bookNo+")"+ getBookTitle()+"����("+sdf.format(getCheckoutDate())+")";
		}
	}
}
