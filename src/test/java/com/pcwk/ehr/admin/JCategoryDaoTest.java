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

import com.pcwk.ehr.admin.dao.CategoryDao;
import com.pcwk.ehr.admin.dao.UserDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.domain.Level;
import com.pcwk.ehr.admin.domain.UserVO;
import com.pcwk.ehr.cmn.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JCategoryDaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	UserDao dao;
	
	@Autowired
	CategoryDao adminDao;
	
	UserVO userVO1;
	UserVO searchUser;
	
	CategoryVO cateVO01;
	CategoryVO cateVO02;
	CategoryVO cateVO03;
	CategoryVO cateVO04;
	
	CategoryVO search;
	
	SearchVO searchVO;
	
	@Before
	public void setUp() throws Exception {
		userVO1 = new UserVO("p8_10", "이상무8_10", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
		
		searchUser = new UserVO("p8", "이상무8", "8888", Level.BASIC, 1, 0, "yls7577@naver.com", "날짜_미사용");
		
		cateVO01 = new CategoryVO(1, "과일류", 0);
		cateVO02 = new CategoryVO(2, "생선류", 0);
		cateVO03 = new CategoryVO(3, "수산", 0);
		cateVO04 = new CategoryVO(4, "간식", 0);
		
		search = new CategoryVO(1, "과일", 0);
		
		searchVO = new SearchVO(10, 1, "10", "과일", "1");
	}
	
	public void isSameUser(CategoryVO actUser, CategoryVO addUser) {
		// assertEquals(실제 데이터, 예상 데이터) : 실제 D와 예상 D가 같으면 test 성공
		assertEquals(actUser.getCategoryNo(), addUser.getCategoryNo());
		assertEquals(actUser.getCategoryNm(), addUser.getCategoryNm());
	}	
	
	@Test
	@Ignore
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
	//@Ignore
	public void doUpdate() throws SQLException{
		LOG.debug("==============================");
		LOG.debug("=== doUpdate() ===");
		LOG.debug("==============================");
		
		// 삭제
		adminDao.doDelete(cateVO01);
		adminDao.doDelete(cateVO02);
		adminDao.doDelete(cateVO03);
		
		// 등록(1)
		adminDao.doSave(cateVO01);
		assertEquals(1, adminDao.getCount(search));
		
		// 한건 조회
		CategoryVO cateVO = adminDao.doSelectOne(cateVO01);
		//isSameUser(cateVO01, cateVO);
		
		cateVO.setCategoryNm(cateVO.getCategoryNm() + "_UPDATE");
		
		// 수정 및 수정된 결과 확인
		assertEquals(1, adminDao.doUpdate(cateVO));
		
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
		List<CategoryVO> list = adminDao.getALL(search);
		assertEquals(1, adminDao.getCount(search));
		isSameUser(cateVO01, list.get(0));
		
		
		// 등록(2)
		adminDao.doSave(cateVO02);
		list = adminDao.getALL(cateVO02);
		isSameUser(cateVO02, list.get(0));
		
		// 등록(3)
		adminDao.doSave(cateVO03);
		
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
