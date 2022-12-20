package com.pcwk.ehr.board;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;
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
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcwk.ehr.answer.dao.AnswerDaoImpl;
import com.pcwk.ehr.answer.domain.AnswerVO;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.Message;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JAnswerController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	//브라우저 대역(Mock)
	MockMvc  mockMvc;
	
	//테스트 픽스처
	List<AnswerVO> answer;
	
	@Autowired
	AnswerDaoImpl  answerDaoImpl;

	//
	BoardSearchVO search;

	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		
		answer = Arrays.asList(new AnswerVO(1, 13, "답변", "내용", "", "admin")
				              ,new AnswerVO(2, 14, "답변", "내용", "", "admin")
				              );
	}
	
	
	@Test
	//@Ignore
	public void doSelectOne() throws Exception{
		//url, param, 호출방식
				MockHttpServletRequestBuilder requestBuilder 
					= MockMvcRequestBuilders.get("/answer/Selectone.do")
						.param("answerNo", answer.get(0).getAnswerNo()+"");
				
				
				ResultActions  resultActions  = 
						mockMvc.perform(requestBuilder).andExpect(status().isOk());
				
				ModelAndView mav = 
						resultActions.andDo(print()).andReturn().getModelAndView();
				
				
				Map<String, Object> model =mav.getModel();
				
				LOG.debug("┌=============================┐");	
				LOG.debug("|model="+model);		
				LOG.debug("└=============================┘");			
				
				checkAnswer((AnswerVO)model.get("vo"),answer.get(0));
		
	
	}
	
	private void checkAnswer(AnswerVO vsAnswer, AnswerVO answer) {
		
		assertThat(vsAnswer.getAnswerNo(), is(answer.getAnswerNo()));
		assertThat(vsAnswer.getSeq(), is(answer.getSeq()));
		assertThat(vsAnswer.getRegId(), is(answer.getRegId()));
		assertThat(vsAnswer.getTitle(), is(answer.getTitle()));
		assertThat(vsAnswer.getContents(), is(answer.getContents()));

	}
	
	
	@Test
	@Ignore
	public void doDelete() throws Exception{
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.get("/answer/Delete.do")
												.param("answerNo", answer.get(0).getSeq()+"");
		
		
		ResultActions resultActions =mockMvc.perform(createMessage)
				.andExpect(MockMvcResultMatchers.content().contentType(MediaType.APPLICATION_JSON_UTF8))
				.andExpect(status().isOk());
		
		String result = resultActions.andDo(print())
		        .andReturn()
		        .getResponse().getContentAsString();	
		
		LOG.debug("---------------------------------");
		LOG.debug("result"+result);
		LOG.debug("---------------------------------");
	
	
		Gson gson = new Gson();
		Message getMessage =  gson.fromJson(result, Message.class);
		

		LOG.debug("---------------------------------");
		LOG.debug("getMessage"+getMessage);
		LOG.debug("---------------------------------");
		
		String resultMsg = "";
		resultMsg = " 답변 \n삭제 성공";
		
		Message message = new Message();
		message.setMsgId("1");
		message.setMsgContents(resultMsg);
		
		assertThat(getMessage.getMsgId(), is(message.getMsgId()));
		assertThat(getMessage.getMsgContents(), is(message.getMsgContents()));
		
										
	}
	
	@Test
	@Ignore
	public void doInsert() throws Exception {
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/answer/doInsert.do")
														.param("answerNo", answer.get(0).getSeq()+"")
														.param("seq", answer.get(0).getSeq()+"")
														.param("title", answer.get(0).getTitle())
														.param("contents", answer.get(0).getContents())
														.param("regDt", answer.get(0).getRegDt())
														.param("regId", answer.get(0).getRegId());
				
		

		ResultActions resultAction = mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultAction.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|result:" + result);
		LOG.debug("└-------------------------------------------┘");
		
		Message messageVO = new Gson().fromJson(result, Message.class);
		assertEquals("1", messageVO.getMsgId());
		

	}

	
	@Test
	@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|webApplicationContext:"+webApplicationContext);
		LOG.debug("|mockMvc:"+mockMvc);
		LOG.debug("|dao:"+answerDaoImpl);
		LOG.debug("└-------------------------------------------┘");		
		
		assertNotNull(answerDaoImpl);
		assertNotNull(mockMvc);
		assertNotNull(webApplicationContext);		
	}


}
