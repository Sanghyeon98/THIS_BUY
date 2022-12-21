package com.pcwk.ehr.image.domain;

public class ImageVO {
	private  int       	imageNo;      //이미지번호
	private  int		gubun;        //구분 (1: 상품, 2: 게시판)
	private  int		imageM;       //공통이미지
	private  int		mainImage;    //메인이미지 
	private  String		orgName;      //원본파일명
	private  String		saveName;     //저장파일명
	private  String		savePath;     //저장경로
	private  String		viewPath;     //이미지태그경로
	private	 long		fileSize;     //파일용량
	private  String		fileExt;      //확장자
	private  int		fromTb;       //출처
	private  int		fromNo;       //출처번호
	private  String		regDt;        //저장일
	private  String		modDt;        //수정일
	
	public ImageVO() {}

	public ImageVO(int imageNo, int gubun, int imageM, int mainImage, String orgName, String saveName, String savePath,
			String viewPath, long fileSize, String fileExt, int fromTb, int fromNo, String regDt, String modDt) {
		super();
		this.imageNo = imageNo;
		this.gubun = gubun;
		this.imageM = imageM;
		this.mainImage = mainImage;
		this.orgName = orgName;
		this.saveName = saveName;
		this.savePath = savePath;
		this.viewPath = viewPath;
		this.fileSize = fileSize;
		this.fileExt = fileExt;
		this.fromTb = fromTb;
		this.fromNo = fromNo;
		this.regDt = regDt;
		this.modDt = modDt;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
	}

	public int getImageM() {
		return imageM;
	}

	public void setImageM(int imageM) {
		this.imageM = imageM;
	}

	public int getMainImage() {
		return mainImage;
	}

	public void setMainImage(int mainImage) {
		this.mainImage = mainImage;
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

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getViewPath() {
		return viewPath;
	}

	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public int getFromTb() {
		return fromTb;
	}

	public void setFromTb(int fromTb) {
		this.fromTb = fromTb;
	}

	public int getFromNo() {
		return fromNo;
	}

	public void setFromNo(int fromNo) {
		this.fromNo = fromNo;
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
		return "ImageVO [imageNo=" + imageNo + ", gubun=" + gubun + ", imageM=" + imageM + ", mainImage=" + mainImage
				+ ", orgName=" + orgName + ", saveName=" + saveName + ", savePath=" + savePath + ", viewPath="
				+ viewPath + ", fileSize=" + fileSize + ", fileExt=" + fileExt + ", fromTb=" + fromTb + ", fromNo="
				+ fromNo + ", regDt=" + regDt + ", modDt=" + modDt + ", toString()=" + super.toString() + "]";
	}

}
