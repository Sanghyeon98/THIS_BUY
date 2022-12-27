package com.pcwk.ehr.cart.domain;

import com.pcwk.ehr.cmn.DTO;

public class CartJoinVO extends DTO {

	private int         cartNO;   				// 장바구니 번호
	private int         itemNO;   				// 상품 번호
	private String      memberId; 			    // 사용자 아이디
	private int         quantity; 				// 상품 수량
	private  String		orgName;                //원본파일명
	private  String		saveName;               //저장파일명
	private  String		viewpath;                   //경로
	private int 		imageNo;		        // 이미지 번호
	private String      name;		            // 상품명
	private int         price;			        // 가격_default 0
	private int         finalPrice;	            // 최종가격_default 0
	public CartJoinVO () {}
	public CartJoinVO(int cartNO, int itemNO, String memberId, int quantity, String orgName, String saveName,
			String viewpath, int imageNo, String name, int price, int finalPrice) {
		super();
		this.cartNO = cartNO;
		this.itemNO = itemNO;
		this.memberId = memberId;
		this.quantity = quantity;
		this.orgName = orgName;
		this.saveName = saveName;
		this.viewpath = viewpath;
		this.imageNo = imageNo;
		this.name = name;
		this.price = price;
		this.finalPrice = finalPrice;
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
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getviewpath() {
		return viewpath;
	}
	public void setviewpath(String viewpath) {
		this.viewpath = viewpath;
	}
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
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
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	@Override
	public String toString() {
		return "CartJoinVO [cartNO=" + cartNO + ", itemNO=" + itemNO + ", memberId=" + memberId + ", quantity="
				+ quantity + ", orgName=" + orgName + ", saveName=" + saveName + ", viewpath=" + viewpath + ", imageNo="
				+ imageNo + ", name=" + name + ", price=" + price + ", finalPrice=" + finalPrice + ", toString()="
				+ super.toString() + "]";
	}

	
	
	
	
	
}
