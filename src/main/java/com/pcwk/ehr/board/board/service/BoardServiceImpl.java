package com.pcwk.ehr.board.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pcwk.ehr.board.board.dao.BoardDao;
import com.pcwk.ehr.board.board.dao.BoardDaoImpl;
import com.pcwk.ehr.cmn.DTO;

public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDaoImpl boardDaoImpl;

	@Override
	public int doInsert(DTO dto) throws SQLException {
		return boardDaoImpl.doInsert(dto);
	}

	@Override
	public int doDelete(DTO dto) throws SQLException {
		return boardDaoImpl.doDelete(dto);
	}

	@Override
	public int doUpdate(DTO dto) throws SQLException {
		return boardDaoImpl.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) throws SQLException {
		return boardDaoImpl.doSelectOne(dto);
	}

	@Override
	public List<?> doRetrive(DTO dto) throws SQLException {
		return boardDaoImpl.doRetrieve(dto);
	}

}
