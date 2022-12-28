package com.pcwk.ehr.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.member.domain.MemberVO;

public interface Memberdao extends WorkDiv<MemberVO> {

		int idCheck(MemberVO inVO) throws SQLException; 
		List<MemberVO> getAll(MemberVO inVO) throws SQLException;
		List<MemberVO> doRetrieve(DTO inVO) throws SQLException;
		int getCount(MemberVO inVO) throws SQLException;
		int passCheck(MemberVO inVO) throws SQLException; 
		int authCheck(MemberVO inVO) throws SQLException; 
		

}