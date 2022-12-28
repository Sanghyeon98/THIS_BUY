package com.pcwk.ehr.board;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.Message;




@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JBoardController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	//브라우저 대역(Mock)
	MockMvc  mockMvc;
	
	//테스트 픽스처
	List<BoardVO> board;
	
	@Autowired
	BoardDao  dao;

	//
	BoardSearchVO search;
	
	@Before
	public void setUp() throws Exception {
		
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		
		board = Arrays.asList(
				 new BoardVO(178, 10, 10, "제목10", "내용10" , "d", "d", 1,3)
				,new BoardVO(278, 20, 10, "제목10", "내용10" , "d", "d", 1,2)
				,new BoardVO(378, 10, 10, "제목10", "내용10" , "d", "d", 1,1)
				,new BoardVO(478, 20, 10, "제목10", "내용10" , "d", "d", 1, 0)		
				);
		
		search = new BoardSearchVO(1, 1, "10", "10", "10", "20");
	}
	
	@Test
	@Ignore
	public void doUpdate()throws Exception{
		//url:/user/add.do, param 설정, 
		//호출방식(post)
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/doUpdate.do")
				                                      .param("seq", board.get(0).getSeq()+"")
				                                      .param("gubun", board.get(0).getGubun()+"")
				                                      .param("gubunQuestion", board.get(0).getGubunQuestion()+"")
				                                      .param("title", board.get(0).getTitle()+"수정함")
				                                      .param("contents", board.get(0).getContents()+"수정함")
				                                      .param("regId", board.get(0).getRegId())
				                                      .param("answerCheck", board.get(0).getAnswerCheck()+"");
		//호출 성공
		ResultActions  resultActions  = mockMvc.perform(requestBuilder)
				                        .andExpect(status().isOk());		
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("┌=============================┐");	
		LOG.debug("|result="+result);		
		LOG.debug("└=============================┘");
		
		Message messageVO=new Gson().fromJson(result, Message.class);
		assertEquals("1", messageVO.getMsgId());
		
	}
	
	@Test
	@Ignore
	public void doSelectOne() throws Exception {
		// url, param, 호출방식
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/doSelectOne.do")
				.param("seq",board.get(0).getSeq()+"");

		ResultActions resultAction = mockMvc.perform(requestBuilder).andExpect(status().isOk());
		
		ModelAndView mav = resultAction.andDo(print()).andReturn().getModelAndView();
		
		Map<String, Object> model = mav.getModel();
		
		//String result = resultAction.andDo(print()).andReturn().getResponse().getContentAsString();
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|model:"+model);
		LOG.debug("└-------------------------------------------┘");	
	}

	
	@Test
	@Ignore
	public void doDelete() throws Exception {
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/doDelete.do")
														.param("seq", board.get(0).getSeq()+"")
														.param("gubun", board.get(0).getGubun()+"")
														.param("gubunQuestion", board.get(0).getGubunQuestion()+"")
														.param("title", board.get(0).getTitle())
														.param("contents", board.get(0).getContents())
														.param("regId", board.get(0).getRegId())
														.param("answerCheck", board.get(0).getAnswerCheck()+"");
		

		ResultActions resultAction = mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultAction.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|result:" + result);
		LOG.debug("└-------------------------------------------┘");
		
		Message messageVO = new Gson().fromJson(result, Message.class);
		assertEquals("1", messageVO.getMsgId());
		

	}
	

	@Test
	//@Ignore
	public void doSave() throws Exception {
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/board/doSave.do")
														.param("seq", board.get(0).getSeq()+"")
														.param("gubun", board.get(0).getGubun()+"")
														.param("gubunQuestion", board.get(0).getGubunQuestion()+"")
														.param("title", board.get(0).getTitle())
														.param("contents", board.get(0).getContents())
														.param("regId", board.get(0).getRegId())
														.param("answerCheck", board.get(0).getAnswerCheck()+"");
		

		ResultActions resultAction = mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultAction.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|result:" + result);
		LOG.debug("└-------------------------------------------┘");
		
		Message messageVO = new Gson().fromJson(result, Message.class);
		assertEquals("1", messageVO.getMsgId());
		

	}

	@Test
	//@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|webApplicationContext:"+webApplicationContext);
		LOG.debug("|mockMvc:"+mockMvc);
		LOG.debug("|dao:"+dao);
		LOG.debug("└-------------------------------------------┘");		
		
		assertNotNull(dao);
		assertNotNull(mockMvc);
		assertNotNull(webApplicationContext);		
	}

}
