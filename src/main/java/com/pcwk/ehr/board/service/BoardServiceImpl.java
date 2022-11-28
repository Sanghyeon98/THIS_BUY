package com.pcwk.ehr.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.dao.BoardDaoImpl;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;

public class BoardServiceImpl {
	@Autowired
	BoardDaoImpl boardDaoImpl;

	public int doDelete(DTO dto) throws SQLException {
		
		return boardDaoImpl.doDelete(dto);
	}


	public int doInsert(DTO dto) throws SQLException {
		
		return boardDaoImpl.doInsert(dto);
	}


	public DTO doSelectOne(DTO dto) throws SQLException {
		
		return boardDaoImpl.doSelectOne(dto);
	}


	public int doUpdate(DTO dto) throws SQLException {
		
		return boardDaoImpl.doUpdate(dto);
	}


	public List<?> doRetrieve(DTO dto) throws SQLException {
		
		return boardDaoImpl.doRetrieve(dto);
	}

}
