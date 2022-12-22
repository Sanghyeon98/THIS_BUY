package com.pcwk.ehr.image.dao;

import java.sql.SQLException;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.image.domain.ImageVO;

public interface ImageDao extends WorkDiv<ImageVO> {
	ImageVO getImageNo(ImageVO inVO) throws SQLException;
}
