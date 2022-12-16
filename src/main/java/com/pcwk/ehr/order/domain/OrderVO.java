package com.pcwk.ehr.order.domain;

import com.pcwk.ehr.cmn.DTO;

public class OrderVO extends DTO{
	
	private int   	  orderNO;
	private int       sameOrder;
	private String 	  memberId;
	private int       itemNO;
	private int   	  price;
	private int       paymentId;
	private String    name;
	private String    phone;
	private String    address;
	private String    request;
	private String    orderState;
	private String    date;
	public OrderVO(int orderNO, int sameOrder, String memberId, int itemNO, int price, int paymentId, String name,
			String phone, String address, String request, String orderState, String date) {
		super();
		this.orderNO = orderNO;
		this.sameOrder = sameOrder;
		this.memberId = memberId;
		this.itemNO = itemNO;
		this.price = price;
		this.paymentId = paymentId;
		this.name = name;
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
	public int getSameOrder() {
		return sameOrder;
	}
	public void setSameOrder(int sameOrder) {
		this.sameOrder = sameOrder;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getItemNO() {
		return itemNO;
	}
	public void setItemNO(int itemNO) {
		this.itemNO = itemNO;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
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
		return "OrderVO [orderNO=" + orderNO + ", sameOrder=" + sameOrder + ", memberId=" + memberId + ", itemNO="
				+ itemNO + ", price=" + price + ", paymentId=" + paymentId + ", name=" + name + ", phone=" + phone
				+ ", address=" + address + ", request=" + request + ", orderState=" + orderState + ", date=" + date
				+ ", toString()=" + super.toString() + "]";
	}
	
}


	
