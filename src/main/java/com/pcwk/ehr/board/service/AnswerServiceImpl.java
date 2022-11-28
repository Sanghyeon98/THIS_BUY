package com.pcwk.ehr.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pcwk.ehr.board.dao.AnswerDaoImpl;
import com.pcwk.ehr.board.dao.BoardDaoImpl;
import com.pcwk.ehr.cmn.DTO;

public class AnswerServiceImpl implements AnswerService {

	@Autowired
	AnswerDaoImpl answerDaoImpl;
	
	@Autowired
	BoardDaoImpl boardDaoImpl;
	
	@Override
	public List<?> getAllList() throws SQLException {
		return answerDaoImpl.getAllList();
	}

	@Override
	public List<?> doSelectOne(DTO dto) throws SQLException {
		return answerDaoImpl.doSelectOne(dto);
	}

	@Override
	public int doUpdate(DTO dto) throws SQLException {
		return answerDaoImpl.doUpdate(dto);
	}

	@Override
	public int doDelete(DTO dto) throws SQLException {
		return answerDaoImpl.doDelete(dto);
	}

	@Override
	public int doInsert(DTO dto) throws SQLException {
		int flag = answerDaoImpl.doInsert(dto);
		return boardDaoImpl.answerCheck(dto);
	}

	@Override
	public DTO doSelectAnswer(DTO dto) throws SQLException {
		return answerDaoImpl.doSelectAnswer(dto);
	}

}
