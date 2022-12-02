package com.pcwk.ehr.board.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.board.dao.AnswerDaoImpl;
import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.dao.BoardDaoImpl;
import com.pcwk.ehr.cmn.DTO;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	AnswerDaoImpl answerDaoImpl;
	
	@Autowired
	BoardDaoImpl boardDaoImpl;
	
	@Override
	public List<?> getAllList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> doSelectOne(DTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DTO doSelectAnswer(DTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int doUpdate(DTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doDelete(DTO dto) throws SQLException {
	
		return 0;
	}

	@Override
	public int doInsert(DTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
