package com.pcwk.ehr.image.controller;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.image.domain.ImageVO;
import com.pcwk.ehr.image.service.ImageService;

@Controller("imageController")
@RequestMapping("image")
public class ImageController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ImageService imgService;
	
	public ImageController() {}
	
	
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(ImageVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		
		if(null != inVO && inVO.getOrgName() == null) {
			inVO.setOrgName("default_orgname");
		}
		
		if(null != inVO && inVO.getSaveName() == null) {
			inVO.setSaveName("default_savename");
		}
		
		if(null != inVO && inVO.getPath() == null) {
			inVO.setPath("default_path");
		}
		
		if(null != inVO && inVO.getFileExt() == null) {
			inVO.setFileExt("test");
		}
		
		int flag = imgService.doSave(inVO);
		
		String message = "";
		
		if(1 == flag) { // 추가 성공
			message = inVO.getOrgName() + " 이 등록되었습니다.";
		} else { // 실패
			message = inVO.getOrgName() + " 등록 실패!";
		}
		LOG.debug("|  flag : " + flag);
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), message));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		
		return jsonString;
	}

}
