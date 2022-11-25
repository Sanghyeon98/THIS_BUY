package com.pcwk.ehr.board;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.MessageVO;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JboardController {

	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired
	WebApplicationContext webApplicationContext;
	
	//브라우저 대역(Mock)
	MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
	}
	
	@Test
	public void doDelete() throws Exception {
		
		//url. param 설정, 호출방식(get/
				MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/doDelete.do")
															   .param("uId",  );
				//대역 객체를 통해 호출
				ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
			
				String responseResult = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
				
				Message message = new Gson().fromJson(responseResult, Message.class);
				
				//assertEquals("1", messageVO.getMsgId());
				LOG.debug("┌-------------------------------------------┐");
				LOG.debug("|responseResult:"+ responseResult);
				LOG.debug("└-------------------------------------------┘");
				//responseResult:{"msgId":"1","msgContents":"p7_01가 삭제 되었습니다.","totalCnt":0,"num":0}
			}
	
	@Test
	public void test() {
	}

}
