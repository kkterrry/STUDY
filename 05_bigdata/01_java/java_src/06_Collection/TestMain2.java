package com.lec.ex1_list;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class TestMain2 {
	public static void main(String[] args) {
		String name1=null;
		String tel1 = null;
		String ad1 = null;
		
		HashMap<String, Customer> hashmap = new HashMap<String, Customer>();
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
			hashmap.put(tel1, new Customer(name1,tel1,ad1));
		}
		
		System.out.println("\n\n");
		
		if(hashmap.isEmpty()) {
			System.out.println("�Է¹��� ���� �����ϴ�.");
		}
		
		Iterator<String> iterator = hashmap.keySet().iterator();
		
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(hashmap.get(key));
		}
		
	}
}
