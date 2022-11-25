package com.pcwk.ehr.admin.domain;

import com.pcwk.ehr.admin.domain.Level;

public enum Level {

	//BASIC(1), SILVER(2), GOLD(3);
	
	// GOLD의 다음레벨은 없음. SILVER의 다음레벨은 GOLD, BASIC의 다음레벨은 SILVER
	GOLD(3, null), SILVER(2, GOLD), BASIC(1, SILVER);
	
	private final int value;
	
	// 다음 레벨
	private final Level next;
	
	// 생성자
	Level(int value, Level next) {
		this.value = value;
		this.next = next;
	}
	
	/**
	 * 다음 Level 갖고 오기 
	 * @return
	 */
	public Level nextLevel() {
		return this.next;
	}
	
	/**
	 * 값(숫자)을 가지고 올 때 사용
	 * @return value
	 */
	public int getValue() {
		return value;
	}
	
	/**
	 * 1 -> BASIC
	 * 2 -> SILVER
	 * 3 -> GOLD
	 * @param value
	 * @return
	 */
	public static Level valueOf(int value) {
		switch (value) {
		case 1:
			// return했기 때문에 break문 필요 없음
			return BASIC;
		case 2:
			return SILVER;
		case 3:
			return GOLD;
		default: throw new AssertionError("Unknown Value : " + value);
		}
	}
	
}
