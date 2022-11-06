package com.lec.ex2Customer;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.*;

import com.lec.ex1person.PersonDto;

public class CustomerMng extends JFrame implements ActionListener {

	private Container contenPane;
	private JPanel jpup, jpdown;
	private JTextField txtPhone, txtName, txtPoint;
	private JButton btnJoin, btnSearch, btnOutput, btnExit;
	private JTextArea jta;
	private JScrollPane scrollpane;
	//
	private CustomerDao dao;
	private ArrayList<CustomerDto> customer;
	
	public CustomerMng(String title) {
		super(title);
		dao = CustomerDao.getInstance();
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(3,2));
		jpdown = new JPanel(new FlowLayout());
		txtPhone = new JTextField(15);
		txtName	= new JTextField(15);
		txtPoint = new JTextField(15);
		
		btnJoin = new JButton("�Է�");
		btnSearch = new JButton("����ȸ");
		btnOutput = new JButton("���");
		btnExit = new JButton("����");
		
		btnJoin.setPreferredSize(new Dimension(150,50));
		btnOutput.setPreferredSize(new Dimension(150,50));
		btnSearch.setPreferredSize(new Dimension(150,50));
		btnExit.setPreferredSize(new Dimension(150,50));
		jta = new JTextArea(10,60);
		scrollpane = new JScrollPane(jta);
		jpup.add(new JLabel("����ȣ",(int)CENTER_ALIGNMENT));
		jpup.add(txtPhone);
		jpup.add(new JLabel("�̸�",(int)CENTER_ALIGNMENT));
		jpup.add(txtName);
		jpup.add(new JLabel("����Ʈ",(int)CENTER_ALIGNMENT));
		jpup.add(txtPoint);
		
		jpdown.add(btnJoin);
		jpdown.add(btnSearch);
		jpdown.add(btnOutput);
		jpdown.add(btnExit);
		
		contenPane.add(jpup);
		contenPane.add(jpdown);
		contenPane.add(scrollpane);
		setVisible(true);
		setSize(new Dimension(700, 450));
		setLocation(200, 150);
		
		btnJoin.addActionListener(this);
		btnOutput.addActionListener(this);
		btnSearch.addActionListener(this);
		btnExit.addActionListener(this);
	}
	
@Override
public void actionPerformed(ActionEvent e) {
	if(e.getSource()== btnJoin) {
		String phone = txtPhone.getText().trim();
		String name = txtName.getText().trim();
		String pointstr = txtPoint.getText().trim();
		if(name.equals("")||phone.equals("")||pointstr.equals("")) {
			jta.setText("����ȣ, �̸�, ����Ʈ ��� �Է��ϼž� �Է°���");
			return;
		}
		int point = Integer.parseInt(pointstr);
		int result = dao.insertCustomer(new CustomerDto(phone,name,point));
		if(result == CustomerDao.SUCCESS) {
			jta.setText(name+"�� �Է¼���");
			txtPhone.setText("");
			txtName.setText("");
			txtPoint.setText("");
		}
			
		}else if(e.getSource()==btnSearch) {
			String phone = txtPhone.getText().trim();
			if(phone.equals("")) {
				jta.setText("������ ������, ������ȸ ����");
				return;
			}
			customer = dao.selectPhone(phone);
			if(customer.isEmpty()) {
				jta.setText("�ش������� ����� �����ϴ�.");
			}else {
				jta.setText("����ȣ\t�̸�\t����Ʈ");
				for(CustomerDto c : customer) {
					jta.append(c.toString()+"\n");
				}
			}
			
		}else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}else if(e.getSource() == btnOutput) {
			// ��ü ����� txtPool��
			customer = dao.selectAll();
			if(customer.isEmpty()) {
				jta.setText("����� �����ϴ�.");
			}else {
				jta.setText("����\t����ȣ\t\t�̸�\t����Ʈ\n");
				for(CustomerDto c : customer) {
					jta.append(c.toString()+"\n");
				}
			}
		}
}

public static void main(String[] args) {
	new CustomerMng("ȸ������");
}
	
}

