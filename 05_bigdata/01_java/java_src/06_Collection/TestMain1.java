package com.lec.ex1_list;
import java.util.ArrayList;
import java.util.Scanner;

import com.lec.ex2_map.Friends;

public class TestMain1 {
	public static void main(String[] args) {
		String name1=null;
		String tel1 = null;
		String ad1 = null;
		
		ArrayList<Customer> C = new ArrayList<Customer>();
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("�̸� ��ȭ��ȣ �ּҸ� �Է��Ͻÿ�(����� ���� ���(n or N))");
			System.out.print("�̸�:(����� ���� ���(n or N))");
			name1 = sc.nextLine();
			if(name1.equalsIgnoreCase("n")) {
				break;
			}
			System.out.print("��ȭ��ȣ:");
			tel1 = sc.nextLine();
			System.out.print("�ּ�:");
			ad1 = sc.nextLine();
			C.add(new Customer(name1,tel1,ad1));
		}
		
		System.out.println("\n\n");
		if(C.isEmpty()) {
			System.out.println("�Է¹��� ���� �����ϴ�.");
		}
		
		for(Customer c: C) {
			System.out.println(c);
		}
	}
}