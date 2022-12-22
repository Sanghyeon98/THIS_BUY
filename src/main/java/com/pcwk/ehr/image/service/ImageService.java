package com.pcwk.ehr.image.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.image.domain.ImageVO;

public interface ImageService {
	
	public int doSave(ImageVO inVO) throws SQLException;
	
	public int doDelete(ImageVO inVO) throws SQLException;
	
	public int doUpdate(ImageVO inVO) throws SQLException;
	
	public ImageVO doSelectOne(ImageVO inVO) throws SQLException;
	
	public List<ImageVO> doRetrieve(DTO inVO) throws SQLException;
	
	public ImageVO getImageNo(ImageVO inVO) throws SQLException;

}
