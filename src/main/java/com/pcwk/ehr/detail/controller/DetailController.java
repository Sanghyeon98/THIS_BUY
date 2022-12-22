package com.pcwk.ehr.detail.controller;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.pcwk.ehr.detail.domain.DetailVO;
import com.pcwk.ehr.detail.service.DetailService;

@Controller("detailController")
@RequestMapping("detail")
public class DetailController {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	DetailService detailService;

	public DetailController() {
	}

	@RequestMapping(value = "/view.do")
	public String cartView(DetailVO inVO, Model model) throws SQLException {
		System.out.println("=============================================");
		System.out.println("==detailService=detailView====");
		System.out.println("=============================================");

		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("└=============================┘");

		DetailVO outVO = detailService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("┌=============================┐");
		LOG.debug("|outVO=" + outVO);
		model.addAttribute("vo", outVO);
		LOG.debug("└=============================┘");

		return "detail/detail";
	}

	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET)
	public String doSelectOne(DetailVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("└=============================┘");

		DetailVO outVO = detailService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("┌=============================┐");
		LOG.debug("|outVO=" + outVO);
		model.addAttribute("vo", outVO);
		LOG.debug("└=============================┘");

		return jsonString;
	}

}
