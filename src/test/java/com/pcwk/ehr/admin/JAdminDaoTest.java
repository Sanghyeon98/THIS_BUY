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

import com.pcwk.ehr.admin.dao.AdminDao;
import com.pcwk.ehr.admin.dao.UserDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.domain.Level;
import com.pcwk.ehr.admin.domain.UserVO;
import com.pcwk.ehr.cmn.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JAdminDaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	UserDao dao;
	
	@Autowired
	AdminDao adminDao;
	
	UserVO userVO1;
	UserVO search;
	
	CategoryVO cateVO01;
	CategoryVO cateVO02;
	CategoryVO cateVO03;
	
	SearchVO searchVO;
	
	@Before
	public void setUp() throws Exception {
		userVO1 = new UserVO("p8_10", "이상무8_10", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
		
		search = new UserVO("p8", "이상무8", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
		
		cateVO01 = new CategoryVO(1, "과일류");
		cateVO02 = new CategoryVO(2, "생선류");
		cateVO03 = new CategoryVO(3, "수산");
		
		searchVO = new SearchVO(10, 1, "10", "과일");
	}
	
	@Test
	public void doRetrieve() throws SQLException {
		// 삭제
		adminDao.doDelete(cateVO01);
		adminDao.doDelete(cateVO02);
		adminDao.doDelete(cateVO03);
		
		// 등록(1)
		adminDao.doSave(cateVO01);
		adminDao.doSave(cateVO02);
		adminDao.doSave(cateVO03);
				
		List<CategoryVO> list = adminDao.doRetrieve(searchVO);
		
		assertEquals(cateVO01.getCategoryNm(), list.get(0).getCategoryNm());
	}
	
	@Test
	@Ignore	
	public void addAndGet() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== addAndGet() ===");
		LOG.debug("==============================");
		
		// 삭제
		adminDao.doDelete(cateVO01);
		adminDao.doDelete(cateVO02);
		adminDao.doDelete(cateVO03);
		
		// 등록(1)
		adminDao.doSave(cateVO01);
		adminDao.doSave(cateVO02);
		adminDao.doSave(cateVO03);
		
		
		cateVO03.setCategoryNm("수산_UP");
		adminDao.doUpdate(cateVO03);
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
