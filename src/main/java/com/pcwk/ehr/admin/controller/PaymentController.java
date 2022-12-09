package com.pcwk.ehr.admin.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("payment")
@RequestMapping("payment")
public class PaymentController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	public PaymentController() {}
	
	@RequestMapping(value = "/paymentTest.do")
	public String paymentTest() {
		return "payment/paymentTest";
	}
}
