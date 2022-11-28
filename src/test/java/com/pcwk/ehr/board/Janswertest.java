package com.pcwk.ehr.board;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

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

import com.pcwk.ehr.board.dao.AnswerDaoImpl;
import com.pcwk.ehr.board.domain.Answer;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class Janswertest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	AnswerDaoImpl dao;
	
	Answer answer01;
	Answer answer02;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("=======================");
		LOG.debug("=@Before=");
		LOG.debug("=======================");	

		answer01 = new Answer(2, 1, "제목", "내용","d","관리자");
		answer02 = new Answer(3, 2, "제목", "내용","d","관리자");
		
	}
	
	@Test
	public void add() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== add() ===");
		LOG.debug("==============================");
		// 1. 기존데이터 3건 삭제
				// 2. 신규데이터 3건 입력
				// 3. 데이터 수정하기 (UPDATE)
				
				// 1. 
			dao.doInsert(answer01);
			//dao.doDelete(answer01);
				
				
				
			
	}

	@Test
	public void bean() {
		LOG.debug("context:"+context);
		LOG.debug("dao:"+dao);
		
		assertThat(context, is(notNullValue()));
		assertThat(dao, is(notNullValue()));
	}

}
