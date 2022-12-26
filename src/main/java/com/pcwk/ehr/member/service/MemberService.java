package com.pcwk.ehr.member.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.member.domain.MemberVO;

public interface MemberService {
	/**
	 * 1.idCheck = 10 (id오류) 
	 * 2.passCheck = 20 (비번오류) 
	 * 3.id/비번 일치 = 30 
	 * @param inVO
	 * @throws SQLException
	 */
	int idPassCheck(MemberVO inVO) throws SQLException;
    /**
     * 회원 다건 삭제
     * @param users
     * @return 삭제 건수 
     * @throws SQLException
     */
	int upDeleteAll(List<MemberVO> users) throws SQLException;
	
	/**
	 * id중복체크 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int idCheck(MemberVO inVO) throws SQLException;
	
	/**
	 * 비번중복체크 (비밀번호 변경 시 이전과 동일하지 않게 하기 위함)
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int PassCheck(MemberVO inVO) throws SQLException;
	
	/**
	 * 신규 회원 등록 로직
	 * 
	 * @param inVO
	 * @return 
	 */
	public int add(MemberVO inVO) throws SQLException;

	/**
	 * 삭제
	 * 
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(MemberVO inVO) throws SQLException;

	/**
	 * 수정
	 * 
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(MemberVO inVO) throws SQLException;

	/**
	 * 단건조회
	 * 
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	MemberVO doSelectOne(MemberVO inVO) throws SQLException;

	/**
	 * 목록조회
	 * 
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<MemberVO> doRetrieve(DTO inVO) throws SQLException;

	/**
	 * uId조회 건수 조회
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int getCount(MemberVO inVO) throws SQLException;
	
	
	public MemberVO checkLoginBefore(String value) throws Exception;
	

}
