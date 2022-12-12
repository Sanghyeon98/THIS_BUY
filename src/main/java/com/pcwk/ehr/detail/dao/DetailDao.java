package com.pcwk.ehr.detail.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.detail.domain.DetailVO;

public interface DetailDao extends WorkDiv<DetailVO> {
	/*
	 AdminDao를 interface로 만든 이유는 확장성 때문.
	 객체 생성 시 AdminDao 인터페이스로 객체를 생성하면
	 해당 인터페이스를 구현한 여러 구현체로 활용가능하다.
	 ex) Mybatis, hibernate
	*/
	
	// like 전체 데이터 리턴
	List<DetailVO> getALL(DetailVO inVO) throws SQLException;
	
	// 등록된 데이터 건수 확인
	int getCount(DetailVO inVO) throws SQLException;
}
