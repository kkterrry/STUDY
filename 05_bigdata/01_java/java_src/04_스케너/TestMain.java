package com.lec.ex01;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		Friend[] F = {new Friend("ȫ�浿","010-9999-1234","05-22"),
					  new Friend("������","010-3333-1123","06-11")};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false;
		do {
			System.out.print("�˻��� ��ȭ��ȣ ���ڸ���(��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�): ");
			String searchTel = sc.next();
			if(searchTel.equalsIgnoreCase("x")) {
				break;
			}
			
			searchOk = false;
			for(int idx=0;idx<F.length;idx++) {
				
				String postTel = F[idx].getPhone().substring(F[idx].getPhone().lastIndexOf("-")+1);
				if(searchTel.equals(postTel)) {
					System.out.println(F[idx]);
					searchOk = true;
				}
			}
			if(!searchOk) {
				System.out.println("�ش� ��ȭ��ȣ�� ģ���� �����ϴ�");
			}	
		}while(true);
		
		
		
	}
}
