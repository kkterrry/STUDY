package com.lec.ex10;

public class Main {
	public static void main(String[] args) {
		Person[] p = {new Student("A01", "���л�","JAVA��"),
					  new Student("A02", "ȫ�浿","C++��"),
					  new Staff("S01", "������", "������"),
					  new Staff("S02", "������", "���������"),
					  new Ganasa("G01", "������","���α׷���")
		};
		for(int i =0; i<p.length; i++) {
			p[i].printId();
			p[i].printName();
			if(i<=1) {
				System.out.println("(��)"+((Student)p[i]).getBan());
			}
			if(i<=3 && i>1) {
				System.out.println("(�μ�)"+((Staff)p[i]).getDe());
			}
			if(i>=4)
				System.out.println("(����)"+((Ganasa)p[i]).getCl());
			}
		}
	}
		