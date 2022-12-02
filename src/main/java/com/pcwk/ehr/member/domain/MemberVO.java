package com.pcwk.ehr.member.domain;

import com.pcwk.ehr.cmn.DTO;

public class MemberVO extends DTO {
	private String uId; // ����� ���̵�
	private String passwd;// ��й�ȣ
	private String name; // �̸�
	private String email;// �̸���
	private String phone;// �̸���
	private String address;// �ּ�
	private int gender;// ���� ��1 ��2
	private String birthdate;// �������
	private String regDt;// �����
	private String modDt;// ������
	private String auth;// ���� /������ 1 ȸ��2
	
	public MemberVO() {}

	public MemberVO(String uId, String passwd, String name, String email, String phone, String address, int gender,
			String birthdate, String regDt, String modDt, String auth) {
		super();
		this.uId = uId;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.birthdate = birthdate;
		this.regDt = regDt;
		this.modDt = modDt;
		this.auth = auth;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
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

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberVO [uId=" + uId + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", phone="
				+ phone + ", address=" + address + ", gender=" + gender + ", birthdate=" + birthdate + ", regDt="
				+ regDt + ", modDt=" + modDt + ", auth=" + auth + ", toString()=" + super.toString() + "]";
	}

}