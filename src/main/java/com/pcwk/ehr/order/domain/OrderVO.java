package com.pcwk.ehr.order.domain;

import com.pcwk.ehr.cmn.DTO;

public class OrderVO extends DTO {

	private int orderNO; // 주문번호
	private int sameOrder; // 동일주문
	private String memberId; // 주문자
	private int itemNO; // 상품번호
	private int price; // 가격
	private int paymentId; // 결제방법
	private String name; // 수령자명
	private String phone; // 핸드폰번호
	private String address; // 배송지
	private String request; // 요청사항
	private String orderState; // 주문상태
	private String orderDate; // 주문날짜

	// product 조인 컬럼
	private String productName;

	public OrderVO() {
	}

	public OrderVO(int orderNO, int sameOrder, String memberId, int itemNO, int price, int paymentId, String name,
			String phone, String address, String request, String orderState, String orderDate) {
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
		this.orderDate = orderDate;
	}
	
	public OrderVO(int orderNO, int sameOrder, String memberId, int itemNO, int price, int paymentId, String name,
			String phone, String address, String request, String orderState, String orderDate, String productName) {
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
		this.orderDate = orderDate;
		this.productName = productName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
		return orderDate;
	}

	public void setDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNO=" + orderNO + ", sameOrder=" + sameOrder + ", memberId=" + memberId + ", itemNO="
				+ itemNO + ", price=" + price + ", paymentId=" + paymentId + ", name=" + name + ", phone=" + phone
				+ ", address=" + address + ", request=" + request + ", orderState=" + orderState + ", orderDate="
				+ orderDate + ", productName=" + productName + ", toString()=" + super.toString() + "]";
	}

}
