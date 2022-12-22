package com.pcwk.ehr.image.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.image.dao.ImageDao;
import com.pcwk.ehr.image.domain.ImageVO;

@Service("ImageService")
public class ImageServiceImpl implements ImageService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ImageDao imgDao;
	
	public ImageServiceImpl() {}

	@Override
	public int doSave(ImageVO inVO) throws SQLException {
		return imgDao.doSave(inVO);
	}

	@Override
	public int doDelete(ImageVO inVO) throws SQLException {
		return imgDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(ImageVO inVO) throws SQLException {
		return imgDao.doUpdate(inVO);
	}

	@Override
	public ImageVO doSelectOne(ImageVO inVO) throws SQLException {
		return imgDao.doSelectOne(inVO);
	}

	@Override
	public List<ImageVO> doRetrieve(DTO inVO) throws SQLException {
		return imgDao.doRetrieve(inVO);
	}

	@Override
	public ImageVO getImageNo(ImageVO inVO) throws SQLException {
		return imgDao.getImageNo(inVO);
	}

}
