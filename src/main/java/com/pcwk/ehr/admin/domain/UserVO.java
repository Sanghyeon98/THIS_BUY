package com.pcwk.ehr.admin.domain;

import com.pcwk.ehr.cmn.DTO;

public class UserVO extends DTO {
	private String uId;		// 사용자 아이디
	private String name;	// 이름
	private String passwd;	// 비밀번호
	
	private Level level;	// BASIC, SILVER, GOLD
	private int login;		// 로그인
	private int recommend;	// 추천
	private String email;	// 이메일
	private String regDt;	// 등록일
	
	// mybatis level -> int
	private int intLevel;
	
	public UserVO() {}
	
	public UserVO(String uId, String name, String passwd, Level level, int login, int recommend, String email, String regDt) {
		super();
		this.uId = uId;
		this.name = name;
		this.passwd = passwd;
		this.level = level;
		this.login = login;
		this.recommend = recommend;
		this.email = email;
		this.regDt = regDt;
		
		intLevel = level.getValue();
	}
	
	// mybatis level -> int
	public int getIntLevel() {
		return intLevel;
	}

	// mybatis level -> int
	public void setIntLevel(int intLevel) {
		this.intLevel = intLevel;
		
		// mybatis -> DAO (int -> Level)
		this.level = Level.valueOf(intLevel);
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
		
		//inLevel
		if(null != level) {
			this.intLevel = level.getValue();
		}
	}

	public int getLogin() {
		return login;
	}

	public void setLogin(int login) {
		this.login = login;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	@Override
	public String toString() {
		return "UserVO [uId=" + uId + ", name=" + name + ", passwd=" + passwd + ", level=" + level + ", login=" + login
				+ ", recommend=" + recommend + ", email=" + email + ", regDt=" + regDt + ", intLevel=" + intLevel
				+ ", toString()=" + super.toString() + "]";
	}

	public void upgradeLevel() {
		Level nextLevel = this.level.nextLevel();
		
		if(null == nextLevel) {	// 다음 레벨이 null 인경우 == GOLD 레벨
			throw new IllegalArgumentException(this.level + "더 이상 등업이 불가능!");
		} else {
			this.level = nextLevel;
			// mybatis 등록을 위해 추가
			this.intLevel = level.getValue();
		}
	}
	
}
