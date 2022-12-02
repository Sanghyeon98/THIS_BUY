package com.pcwk.ehr.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.board.domain.AnswerVO;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.SearchVO;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	final Logger LOG = LogManager.getFormatterLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.board";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;// db연결객체

	public BoardDaoImpl() {}
	
	
	@Override
	public List<BoardVO> doRetrieve(DTO dto) throws SQLException {
		BoardSearchVO search = (BoardSearchVO) dto;
		List<BoardVO> list = new ArrayList<BoardVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + dto );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(BoardVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}

	@Override
	public int doDelete(DTO dto) throws SQLException {
		LOG.debug("================================");
		LOG.debug("|  param : " + dto);
		
		String statement = NAMESPACE + DOT + "doDelete";
		LOG.debug("|  statement: " + statement);
		
		int flag = sqlSessionTemplate.delete(statement, dto);
		LOG.debug("|  flag: " + flag);
		LOG.debug("================================");
		
		return flag;
	}

	@Override
	public int doInsert(DTO dto) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + dto);
		
		String statement = NAMESPACE + DOT + "doInsert";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.insert(statement, dto);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
	}

	@Override
	public DTO doSelectOne(DTO dto) throws SQLException {
		BoardVO outVO = null;

		String statement = NAMESPACE + DOT + "doSelectOne";

		LOG.debug("================================");
		LOG.debug("|  param : " + dto);
		LOG.debug("|  statement: " + statement);

		outVO = sqlSessionTemplate.selectOne(statement, dto);
		LOG.debug("|  outVO : " + outVO);
		LOG.debug("================================");

		return outVO;
	}

	@Override
	public int doUpdate(DTO dto) throws SQLException {
		int flag = 0;

		LOG.debug("================================");
		LOG.debug("|  param : " + dto);

		String statement = NAMESPACE + DOT + "doUpdate";
		LOG.debug("|  statement: " + statement);

		flag = sqlSessionTemplate.update(statement, dto);
		LOG.debug("|  flag: " + flag);
		LOG.debug("================================");

		return flag;
	}



}
