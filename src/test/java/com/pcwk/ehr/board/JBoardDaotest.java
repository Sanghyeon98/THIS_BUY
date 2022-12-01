package com.pcwk.ehr.board;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.google.gson.Gson;
import com.pcwk.ehr.board.dao.BoardDao;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JBoardDaotest {
	final Logger LOG = LogManager.getLogger(getClass());

	
	@Autowired
	ApplicationContext context;
	
	//브라우저 대역(Mock)
	MockMvc mockMvc;
		
	@Autowired
	BoardDao dao;
	
	BoardVO board01;
	BoardVO board02;
	BoardVO board03;
	
	BoardSearchVO search;
	
	BoardVO boardvo;

	@Before
	public void setUp() throws Exception {
		LOG.debug("-------------------------");
		LOG.debug("=@Before=");
		LOG.debug("-------------------------");
		
		LOG.debug("=context=" + context);
		
		//BoardVO(int seq, int gubun, int gubunQuestion, String title, String contents, String regDt, String regId,
		//int answerCheck)
		board01 = new BoardVO (1, 10, 10, "제목10", "내용10" , "d", "d", 1);
		board02 = new BoardVO (2, 20, 20, "제목10", "내용10" , "d", "d", 1);
		board03 = new BoardVO (3, 30, 30, "제목10", "내용10" , "d", "d", 1);
	
		//int pageSize, int pageNo, String searchDiv, String searchWord, String gubun, String gubunQuestion
		search = new BoardSearchVO(1, 1, "10", "10", "10", "20");
	}
	
	@Test
	//@Ignore
	public void doRetrive()throws SQLException{
		//1.
		dao.doDelete(board01);
		dao.doDelete(board02);
		dao.doDelete(board03);
		
		
		//2.
		dao.doInsert(board01);
		dao.doInsert(board02);
		dao.doInsert(board03);

		search.setGubun("10");
		List<BoardVO> list = dao.doRetrieve(search);
		
	}
	
	@Test
	@Ignore
	public void list() throws SQLException {

		
		LOG.debug("*************************");
		LOG.debug("=list=");
		LOG.debug("*************************");
		
		// 1.
		//dao.doRetrieve(search);
		dao.doDelete(board01);
		dao.doInsert(board01);
		 //2.
		dao.doSelectOne(board01);
		//dao.doSelectOne(board02);
		//dao.doSelectOne(board03);
		
		
	}
	
	
	
	@Test
	@Ignore
	public void addAndGet() throws SQLException {
		
		// 1. 기존데이터 3건 삭제
		// 2. 신규데이터 3건 입력
		// 3. 데이터 수정하기 (UPDATE)
		
		LOG.debug("*************************");
		LOG.debug("=addAndGet=");
		LOG.debug("*************************");
		
		// 1. 
		dao.doDelete(board01);
		dao.doDelete(board02);
		dao.doDelete(board03);
		
		//2.
		int flagInsert  =  dao.doInsert(board01);
		assertThat(flagInsert, is(1));
		
		flagInsert  +=  dao.doInsert(board02);
		assertThat(flagInsert, is(2));
		
		flagInsert  +=  dao.doInsert(board03);
		assertThat(flagInsert, is(3));

		// 3.
		board01.setTitle(board01.getTitle() + "수정");
		board01.setContents(board01.getContents() + "수정");
		
		board02.setTitle(board02.getTitle() + "수정");
		board02.setContents(board02.getContents() + "수정");
		
		board03.setTitle(board03.getTitle() + "수정");
		board03.setContents(board03.getContents() + "수정");
		
		LOG.debug("board1 : " + board01);
		LOG.debug("board2 : " + board02);
		LOG.debug("board3 : " + board03);
		
		int flagUpdate = dao.doUpdate(board01);
		assertThat(flagUpdate, is(1));
		
		flagUpdate += dao.doUpdate(board02);
		assertThat(flagUpdate, is(2));
		
		flagUpdate += dao.doUpdate(board03);
		assertThat(flagUpdate, is(3));
		
		
	}
	@Test
	@Ignore
	public void add() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== add() ===");
		LOG.debug("==============================");
		// 1. 기존데이터 3건 삭제
				// 2. 신규데이터 3건 입력
				// 3. 데이터 수정하기 (UPDATE)
				
				// 1. 
		    dao.doDelete(board01);
		    dao.doDelete(board02);
		    dao.doDelete(board03);
		    //2
			dao.doInsert(board01);
			dao.doInsert(board02);
			dao.doInsert(board03);
			//dao.doDelete(board01);
				
				
				
			
	}
	
	@Test
	@Ignore
	public void beans() {
		LOG.debug("==============================");
		LOG.debug("context:"+context);	
		LOG.debug("==============================");
		
		assertNotNull(context);
	}

}
