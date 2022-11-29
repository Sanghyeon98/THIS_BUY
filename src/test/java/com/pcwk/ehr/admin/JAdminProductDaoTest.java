package com.pcwk.ehr.admin;

import static org.junit.Assert.*;

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

import com.pcwk.ehr.admin.dao.AdminCategoryDao;
import com.pcwk.ehr.admin.dao.UserDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.domain.Level;
import com.pcwk.ehr.admin.domain.UserVO;
import com.pcwk.ehr.cmn.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JAdminProductDaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext context;
	
	@Before
	public void setUp() throws Exception {

	}
	
	/*
	public void isSameUser(CategoryVO actUser, CategoryVO addUser) {
		// assertEquals(실제 데이터, 예상 데이터) : 실제 D와 예상 D가 같으면 test 성공
		assertEquals(actUser.getCategoryNo(), addUser.getCategoryNo());
		assertEquals(actUser.getCategoryNm(), addUser.getCategoryNm());
	}	
	*/
	
	@Test
	@Ignore
	public void doRetrieve() throws SQLException {

	}
	
	@Test
	@Ignore
	public void doUpdate() throws SQLException{
		LOG.debug("==============================");
		LOG.debug("=== doUpdate() ===");
		LOG.debug("==============================");
		
	}
	
	@Test
	@Ignore	
	public void addAndGet() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== addAndGet() ===");
		LOG.debug("==============================");

	}	

	@Test
	//@Ignore
	public void beans() {
		LOG.debug("==============================");
		LOG.debug("context:"+context);	
		LOG.debug("==============================");
		
		assertNotNull(context);
	}

}
