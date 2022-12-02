package com.pcwk.ehr.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.board.domain.AnswerVO;
import com.pcwk.ehr.cmn.DTO;

@Repository
public class AnswerDaoImpl {
	
	final Logger LOG = LogManager.getLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.board.answer";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 문의 답변 전체 목록 조회
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<?> getAllList() throws SQLException {
		String statement = this.NAMESPACE + ".getAllList";

		List<AnswerVO> list = sqlSessionTemplate.selectList(statement);

		for (AnswerVO vo : list) {
			LOG.debug("vo :" + vo);
		}
		return list;
	}

	/**
	 * 문의 별 답변 조회
	 * 
	 * @param dto
	 * @return DTO
	 * @throws SQLException
	 */
	public List<?> doSelectOne(DTO dto) throws SQLException {
		AnswerVO inVO = (AnswerVO) dto;

		String statement = NAMESPACE + ".doSelectOne";
		List<AnswerVO> list = sqlSessionTemplate.selectList(statement, inVO);

		for (AnswerVO vo : list) {
			LOG.debug("vo :" + vo);
		}
		return list;
	}

	public DTO doSelectAnswer(DTO dto) throws SQLException {
		AnswerVO inVO = (AnswerVO) dto;
		AnswerVO outVO = null;

		String statement = NAMESPACE + ".doSelectAnswer";
		LOG.debug("=inVO=" + inVO);
		LOG.debug("=statement=" + statement);

		outVO = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("=outVO=" + outVO);

		if (null == outVO) {
			LOG.debug("=============================");
			LOG.debug("=null outVO =" + outVO);
			LOG.debug("=============================");
			throw new EmptyResultDataAccessException("여기 EmptyResultDataAccessException", 1);
		}

		return outVO;

	}

	/**
	 * 답변 내용 수정
	 * 
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	public int doUpdate(DTO dto) throws SQLException {
		int flag = 0;
		AnswerVO answer = (AnswerVO) dto;

		String statement = NAMESPACE + ".doUpdate";

		flag = sqlSessionTemplate.update(statement, answer);

		return flag;

	}

	/**
	 * 문의 답변 삭제
	 * 
	 * @param dto
	 * @return int (성공:1, 실패:0)
	 * @throws SQLException
	 */
	public int doDelete(DTO dto) throws SQLException {
		int flag = 0;
		AnswerVO answer = (AnswerVO) dto;

		String statement = NAMESPACE + ".doDelete";

		LOG.debug("=answer=" + answer);
		LOG.debug("=statement=" + statement);

		flag = this.sqlSessionTemplate.delete(statement, answer);

		return flag;

	}

	/**
	 * 문의답변등록
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	public int doInsert(DTO inVO) throws SQLException {
		int flag = 0;
		AnswerVO answer = (AnswerVO) inVO;

		String statement = NAMESPACE + ".doInsert";
		LOG.debug("=answer=" + answer);
		LOG.debug("=statement=" + statement);

		flag = this.sqlSessionTemplate.insert(statement, answer);
		return flag;
	}

}
