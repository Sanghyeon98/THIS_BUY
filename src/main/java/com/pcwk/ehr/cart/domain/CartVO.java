package com.pcwk.ehr.cart.domain;

import com.pcwk.ehr.cmn.DTO;

public class CartVO extends DTO {

	private int cartNO;   // 장바구니 번호
	private int itemNO;   // 상품 번호
	private int memberId; // 사용자 아이디
	private String name;  // 상품이름
	private int  price;	  // 상품 가격
	private int quantity; // 상품 수량
	
	public CartVO() {}

	public CartVO(int cartNO, int itemNO, int memberId, String name, int price, int quantity) {
		super();
		this.cartNO = cartNO;
		this.itemNO = itemNO;
		this.memberId = memberId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public int getCartNO() {
		return cartNO;
	}

	public void setCartNO(int cartNO) {
		this.cartNO = cartNO;
	}

	public int getItemNO() {
		return itemNO;
	}

	public void setItemNO(int itemNO) {
		this.itemNO = itemNO;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartVO [cartNO=" + cartNO + ", itemNO=" + itemNO + ", memberId=" + memberId + ", name=" + name
				+ ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	
}