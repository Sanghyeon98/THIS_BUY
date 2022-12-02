package com.pcwk.ehr.order.domain;

import com.pcwk.ehr.cmn.DTO;

public class OrderVO extends DTO{
	
	private int   	  orderNO;
	private String 	  memberId;
	private int   	  price;
	private String    phone;
	private String    address;
	private String    request;
	private String    orderState;
	private String    date;
	
	public OrderVO(int orderNO, String memberId, int price, String phone, String address, String request,
			String orderState, String date) {
		super();
		this.orderNO = orderNO;
		this.memberId = memberId;
		this.price = price;
		this.phone = phone;
		this.address = address;
		this.request = request;
		this.orderState = orderState;
		this.date = date;
	}

	public int getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNO=" + orderNO + ", memberId=" + memberId + ", price=" + price + ", phone=" + phone
				+ ", address=" + address + ", request=" + request + ", orderState=" + orderState + ", date=" + date
				+ "]";
	}
	

}
