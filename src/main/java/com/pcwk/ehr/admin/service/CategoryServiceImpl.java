package com.pcwk.ehr.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.admin.dao.CategoryDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CategoryDao cateDao;
	
	public CategoryServiceImpl() {}

	@Override
	public int upDeleteAll(List<CategoryVO> categories) throws SQLException {
		int cnt = 0;
		
		try {
			for(CategoryVO vo : categories) {
				cnt += cateDao.doDelete(vo);
			}
		} catch(Exception e) {
			LOG.debug("┌-------------------------------------------┐");
			LOG.debug("|  rollback : " + e.getMessage());
			LOG.debug("└-------------------------------------------┘");
			throw e;
		}
		
		return cnt;
	}

	@Override
	public int idCheck(CategoryVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int add(CategoryVO inVO) throws SQLException {
		return cateDao.doSave(inVO);
	}

	@Override
	public int doDelete(CategoryVO inVO) throws SQLException {
		return cateDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(CategoryVO inVO) throws SQLException {
		return cateDao.doUpdate(inVO);
	}

	@Override
	public CategoryVO doSelectOne(CategoryVO inVO) throws SQLException {
		return cateDao.doSelectOne(inVO);
	}

	@Override
	public List<CategoryVO> doRetrive(DTO inVO) throws SQLException {
		return cateDao.doRetrieve(inVO);
	}

}
