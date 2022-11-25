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

import com.pcwk.ehr.admin.dao.UserDao;
import com.pcwk.ehr.admin.domain.Level;
import com.pcwk.ehr.admin.domain.UserVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JAdminDaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	UserDao dao;
	
	UserVO userVO1;
	UserVO search;
	
	@Before
	public void setUp() throws Exception {
		userVO1 = new UserVO("p8_01", "이상무8_01", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
		
		search = new UserVO("p8", "이상무8", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
	}
	
	@Test
	public void addAndGet() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== addAndGet() ===");
		LOG.debug("==============================");
		
		// 삭제
		dao.doDelete(userVO1);
		
		// 등록(1)
		dao.doSave(userVO1);
		//List<UserVO> list = dao.getALL(search);
		//assertEquals(1, dao.getCount(search));

		
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
