package com.pcwk.ehr.main.domain;

import com.pcwk.ehr.cmn.DTO;
 
public class MainJoinVO extends DTO {
	private String categoryNm;	// 카테고리 이름
	private int status;		    // 상태값 (1:사용, 0:미사용)
	private String name;		// 상품명
	private int imageNo;		// 이미지 번호(FK)
	private int price;			// 가격_default 0
	private int discount;		// 할인율_default 0
	private String detail;		// 상품설명
	
	public MainJoinVO(String categoryNm, int status, String name, int imageNo, int price, int discount, String detail) {
		super();
		this.categoryNm = categoryNm;
		this.status = status;
		this.name = name;
		this.imageNo = imageNo;
		this.price = price;
		this.discount = discount;
		this.detail = detail;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "MainJoinVO [categoryNm=" + categoryNm + ", status=" + status + ", name=" + name + ", imageNo=" + imageNo
				+ ", price=" + price + ", discount=" + discount + ", detail=" + detail + ", toString()="
				+ super.toString() + "]";
	}
	
}
