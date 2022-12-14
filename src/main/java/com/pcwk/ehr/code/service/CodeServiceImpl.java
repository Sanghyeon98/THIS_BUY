package com.pcwk.ehr.code.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.code.dao.CodeDao;
import com.pcwk.ehr.code.domain.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CodeDao codeDao;
	
	public CodeServiceImpl() {}

	@Override
	public List<CodeVO> doRetrieve(List<String> list) throws SQLException {
		return codeDao.doRetrieve(list);
	}

}
