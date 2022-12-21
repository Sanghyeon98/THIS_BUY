package com.pcwk.ehr.answer.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.answer.dao.AnswerDaoImpl;
import com.pcwk.ehr.answer.domain.AnswerVO;
import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.dao.BoardDaoImpl;
import com.pcwk.ehr.cmn.DTO;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	final Logger LOG = LogManager.getLogger(getClass());
	
	
	@Autowired
	AnswerDaoImpl answerDaoImpl;

	@Override
	public List<AnswerVO> doRetrive(DTO inVO) throws SQLException {
		return null;
	}

	@Override
	public int doUpdate(AnswerVO inVO) throws SQLException {
		return answerDaoImpl.doUpdate(inVO);
	}

	@Override
	public int doDelete(AnswerVO inVO) throws SQLException {
		return answerDaoImpl.doDelete(inVO);
	}

	@Override
	public int doInsert(AnswerVO inVO) throws SQLException {
		return answerDaoImpl.doInsert(inVO);
	}


	@Override
	public List<AnswerVO> doSelectOne(DTO inVO) throws SQLException {
		return answerDaoImpl.doSelectOne(inVO);
	}

	@Override
	public DTO doSelectAnswer(AnswerVO inVO) throws SQLException {

		return answerDaoImpl.doSelectAnswer(inVO);
	}

	@Override
	public List<AnswerVO> getAllList() throws SQLException {
		return answerDaoImpl.getAllList();
	}


	

}
