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
import com.pcwk.ehr.board.domain.AnswerVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JAnswerTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	AnswerDaoImpl dao;
	
	AnswerVO answer01;
	AnswerVO answer02;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("=======================");
		LOG.debug("=@Before=");
		LOG.debug("=======================");	

		answer01 = new AnswerVO(2, 1, "제목", "내용","","관리자");
		answer02 = new AnswerVO(3, 2, "제목", "내용","","관리자");
		
	}
	
	private void isSameAnswer(AnswerVO vsAnswer, AnswerVO answer01) {
		
		assertThat(vsAnswer.getAnswerNo(), is(answer01.getAnswerNo()));
		assertThat(vsAnswer.getSeq(), is(answer01.getSeq()));
		assertThat(vsAnswer.getTitle(), is(answer01.getTitle()));
		assertThat(vsAnswer.getContents(), is(answer01.getContents()));
		assertThat(vsAnswer.getRegId(), is(answer01.getRegId()));

	}
	
	@Test
	@Ignore
	public void getAllList() throws Exception{
		List<AnswerVO> list  =(List<AnswerVO>) dao.getAllList();
		
	}
	
	@Test
	@Ignore
	public void doSelectOne() throws Exception{
		AnswerVO vsAnswer01 = (AnswerVO) dao.doSelectOne(answer01);
		isSameAnswer(vsAnswer01, answer01);
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
			dao.doDelete(answer01);
			//dao.doInsert(answer01);
			//dao.doDelete(answer01);
			
//			// 3.
//			answer01.setTitle(answer01.getTitle() + "수정함");
//			answer01.setContents(answer01.getContents() + "수정함");
//			
//			answer02.setTitle(answer02.getTitle() + "수정함");
//			answer02.setContents(answer02.getContents() + "수정함");
//			
//			LOG.debug("answer01 : " + answer01);
//			LOG.debug("answer02 : " + answer02);
//
//			
//			int flagUpdate = dao.doUpdate(answer01);
//			assertThat(flagUpdate, is(1));
//			
//			flagUpdate += dao.doUpdate(answer02);
//			assertThat(flagUpdate, is(2));
			
				
	}

	@Test
	public void bean() {
		LOG.debug("context:"+context);
		LOG.debug("dao:"+dao);
		
		assertThat(context, is(notNullValue()));
		assertThat(dao, is(notNullValue()));
	}

}
