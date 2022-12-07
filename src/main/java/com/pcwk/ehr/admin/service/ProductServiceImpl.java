package com.pcwk.ehr.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.admin.dao.ProductDao;
import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.DTO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ProductDao prodDao;
	
	public ProductServiceImpl() {}

	@Override
	public int upDeleteAll(List<ProductVO> products) throws SQLException {
		int cnt = 0;
		
		try {
			for(ProductVO vo : products) {
				cnt += prodDao.doDelete(vo);
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
	public int idCheck(ProductVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int add(ProductVO inVO) throws SQLException {
		return prodDao.doSave(inVO);
	}

	@Override
	public int doDelete(ProductVO inVO) throws SQLException {
		return prodDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(ProductVO inVO) throws SQLException {
		return prodDao.doUpdate(inVO);
	}

	@Override
	public ProductVO doSelectOne(ProductVO inVO) throws SQLException {
		return prodDao.doSelectOne(inVO);
	}

	@Override
	public List<ProductVO> doRetrieve(DTO inVO) throws SQLException {
		return prodDao.doRetrieve(inVO);
	}

	@Override
	public int getCount(ProductVO inVO) throws SQLException {
		return prodDao.getCount(inVO);
	}

}
