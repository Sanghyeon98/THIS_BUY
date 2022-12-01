package com.pcwk.ehr.cart.domain;

import com.pcwk.ehr.cmn.DTO;

public class CartVO extends DTO {

	private int cartNO;   // 장바구니 번호
	private int itemNO;   // 상품 번호
	private String memberId; // 사용자 아이디
	private int quantity; // 상품 수량
	
	public CartVO() {}


	public CartVO(int cartNO, int itemNO, String memberId, int quantity) {
		super();
		this.cartNO = cartNO;
		this.itemNO = itemNO;
		this.memberId = memberId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "CartVO [cartNO=" + cartNO + ", itemNO=" + itemNO + ", memberId=" + memberId + ", quantity=" + quantity
				+ ", toString()=" + super.toString() + "]";
	}

	
	
}
