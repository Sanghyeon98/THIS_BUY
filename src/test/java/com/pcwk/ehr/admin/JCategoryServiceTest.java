package com.pcwk.ehr.admin;

import static org.junit.Assert.*;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.PlatformTransactionManager;

import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.service.CategoryService;

@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JCategoryServiceTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	CategoryService cateService;
	
	@Autowired
	PlatformTransactionManager transactionManager;
	
	// 테스트 픽스처
	List<CategoryVO> categories;
	
	// 검색에 사용
	CategoryVO search;

	@Before
	public void setUp() throws Exception {
		categories = Arrays.asList(
						new CategoryVO(1, "채소/과일"),
						new CategoryVO(2, "수산/해산/건어물"),
						new CategoryVO(3, "정육/계란"),
						new CategoryVO(4, "생수/음료/우유/커피"),
						new CategoryVO(5, "밀키트"),
						new CategoryVO(6, "간식/과자/떡")
					 );
		search = new CategoryVO(0, "간식");
	}
	
	
	@Test
	public void add() throws SQLException {
		LOG.debug("┌--- add() ---------------------------------┐");
		
		// 데이터 삭제
		for(CategoryVO vo : categories) {
			cateService.doDelete(vo);
		}
		
		// 데이터 추가
		for(CategoryVO vo : categories) {
			cateService.add(vo);
		}
		
		LOG.debug("└-------------------------------------------┘");
	}

	@Test
	@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|  context : " + context);
		LOG.debug("|  cateService : " + cateService);
		LOG.debug("└-------------------------------------------┘");
		
		assertNotNull(context);
		assertNotNull(cateService);
		assertNotNull(transactionManager);
	}

}
