package com.pcwk.ehr.board;


import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
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

import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.SearchVO;




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
	
	//
	@Autowired
	BoardDao  dao;

	
	//
	BoardSearchVO search;
	
	@Before
	public void setUp() throws Exception {
		
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		
		board = Arrays.asList(
				 new BoardVO(1, 10, 10, "제목10", "내용10" , "d", "d", 1)
				,new BoardVO(2, 10, 10, "제목10", "내용10" , "d", "d", 1)
				,new BoardVO(3, 10, 10, "제목10", "내용10" , "d", "d", 1)
				,new BoardVO(4, 10, 10, "제목10", "내용10" , "d", "d", 1)		
				);
		
		search = new BoardSearchVO(1, 1, "10", "10", "10", "20");
	}
	
	@Test
	public void view()throws Exception{
		//url, param 설정, 호출방식(get/post)
		MockHttpServletRequestBuilder  requestBuilder= MockMvcRequestBuilders.get("/board/view.do")
				                                       .param("seq", String.valueOf(board.get(0).getSeq()));
		
		//대역 객체를 통해 호출
		ResultActions resultActions =mockMvc.perform(requestBuilder)
		                                               .andExpect(status().is2xxSuccessful());
		
		String responseResult =  resultActions.andDo( print() )
		    .andReturn().getResponse().getContentAsString();
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|responseResult:"+responseResult);
		LOG.debug("└-------------------------------------------┘");				
	}

	@Test
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
