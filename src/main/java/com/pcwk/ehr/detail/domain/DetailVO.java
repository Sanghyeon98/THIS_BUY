package com.pcwk.ehr.detail.domain;

import com.pcwk.ehr.cmn.DTO;

public class DetailVO extends DTO {
	private int itemNo;			// 상품번호(PK)
	private String name;		// 상품명
	private int price;			// 가격_default 0
	private int categoryNo;		// 카테고리 번호(FK)
	private int imageNo;		// 이미지 번호(FK)
	private String production;	// 생산지
	private int weight;			// 무게_default 0
	private String expired;		// 유통기간
	private String detail;		// 상품설명
	private int discount;		// 할인율_default 0
	private int finalPrice;		// 최종가격_default 0
	private int sales;			// 판매량_default 0
	private String regDt;		// 상품등록일_defuault SYSDATE
	private String modDt;		// 상품수정일_defuault SYSDATE
	
	// image 테이블 조인 변수
	private String viewPath;	// 이미지 view Path
	private String saveName;	// 이미지 저장명
	
	
	public DetailVO() {}
	
	public DetailVO(int itemNo, String name, int price, int categoryNo, int imageNo, String production, int weight,
			String expired, String detail, int discount, int finalPrice, int sales, String regDt, String modDt) {
		super();
		this.itemNo = itemNo;
		this.name = name;
		this.price = price;
		this.categoryNo = categoryNo;
		this.imageNo = imageNo;
		this.production = production;
		this.weight = weight;
		this.expired = expired;
		this.detail = detail;
		this.discount = discount;
		this.finalPrice = finalPrice;
		this.sales = sales;
		this.regDt = regDt;
		this.modDt = modDt;
	}
	
	public DetailVO(int itemNo, String name, int price, int categoryNo, int imageNo, String production, int weight,
			String expired, String detail, int discount, int finalPrice, int sales, String regDt, String modDt,
			String viewPath, String saveName) {
		super();
		this.itemNo = itemNo;
		this.name = name;
		this.price = price;
		this.categoryNo = categoryNo;
		this.imageNo = imageNo;
		this.production = production;
		this.weight = weight;
		this.expired = expired;
		this.detail = detail;
		this.discount = discount;
		this.finalPrice = finalPrice;
		this.sales = sales;
		this.regDt = regDt;
		this.modDt = modDt;
		this.viewPath = viewPath;
		this.saveName = saveName;
	}

	public String getViewPath() {
		return viewPath;
	}

	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getProduction() {
		return production;
	}

	public void setProduction(String production) {
		this.production = production;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getExpired() {
		return expired;
	}

	public void setExpired(String expired) {
		this.expired = expired;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	@Override
	public String toString() {
		return "DetailVO [itemNo=" + itemNo + ", name=" + name + ", price=" + price + ", categoryNo=" + categoryNo
				+ ", imageNo=" + imageNo + ", production=" + production + ", weight=" + weight + ", expired=" + expired
				+ ", detail=" + detail + ", discount=" + discount + ", finalPrice=" + finalPrice + ", sales=" + sales
				+ ", regDt=" + regDt + ", modDt=" + modDt + ", viewPath=" + viewPath + ", saveName=" + saveName
				+ ", toString()=" + super.toString() + "]";
	}
	
}
