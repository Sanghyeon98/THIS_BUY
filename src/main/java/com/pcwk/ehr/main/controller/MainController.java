package com.pcwk.ehr.main.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mainController")
@RequestMapping("main")
public class MainController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String VIEW_NAME = "main/main_page";
	
	@RequestMapping(value = "/main_page.do", method = RequestMethod.GET)
	public String singup() {
		LOG.debug("┌=============================┐");
		LOG.debug("|main_page                    |");
		LOG.debug("└=============================┘");

		return VIEW_NAME;
	}
}
