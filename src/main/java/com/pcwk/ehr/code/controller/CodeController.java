package com.pcwk.ehr.code.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.code.domain.CodeVO;
import com.pcwk.ehr.code.service.CodeService;

@Controller("codeController")
@RequestMapping("code")
public class CodeController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CodeService codeService;
	
	public CodeController() {}
	
	
	/**
	 * 코드 조회
	 * @param search
	 * @return JSON(List<CodeVO>)
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO search) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		
		// http://localhost:8089/ehr/code/doRetrive.do?searchWord=PAGE_SIZE,BOARD_SEARCH
		List<String> codeList = new ArrayList<String>();
		String codeStr = search.getSearchWord();
		
		if(codeStr.indexOf(",") > -1) {		// codeStr 값에 ,(쉼표)가 있으면
			String[] strArrays = codeStr.split(",");
			
			for(String tmpStr : strArrays) {
				codeList.add(tmpStr);
			}
		} else {
			codeList.add(codeStr);
		}
		
		List<CodeVO> outList = this.codeService.doRetrieve(codeList);
		
		jsonString = new Gson().toJson(outList);
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		
		return jsonString;
	}
	
}
