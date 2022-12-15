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
						new CategoryVO(1, "채소/과일", 0),
						new CategoryVO(2, "수산/해산/건어물", 0),
						new CategoryVO(3, "정육/계란", 0),
						new CategoryVO(4, "생수/음료/우유/커피", 0),
						new CategoryVO(5, "국/반찬/메인요리", 0),
						new CategoryVO(6, "간식/과자/떡", 0),
						new CategoryVO(7, "생수/탄산수", 4),
						new CategoryVO(8, "음료/주스", 4),
						new CategoryVO(9, "우유/두유/요거트", 4),
						new CategoryVO(10, "커피", 4),
						new CategoryVO(11, "차", 4),
						new CategoryVO(12, "과자/스낵/쿠키", 6),
						new CategoryVO(13, "초콜릿/젤리/캔디", 6),
						new CategoryVO(14, "떡/한과", 6),
						new CategoryVO(15, "아이스크림", 6),
						new CategoryVO(16, "친환경", 1),
						new CategoryVO(17, "고구마/감자/당근", 1),
						new CategoryVO(18, "시금치/쌈채소/나물", 1),
						new CategoryVO(19, "브로콜리/파프리카/양배추", 1),
						new CategoryVO(20, "생선류", 2),
						new CategoryVO(21, "굴비/반건류", 2),
						new CategoryVO(22, "오징어/낙지/문어", 2),
						new CategoryVO(23, "새우/게/랍스터", 2),
						new CategoryVO(24, "해산물/조개류", 2),
						new CategoryVO(25, "수산가공품", 2),
						new CategoryVO(26, "김/미역/해조류", 2),
						new CategoryVO(27, "양파/대파/마늘/배추", 1),
						new CategoryVO(28, "오이/호박/고추", 1),
						new CategoryVO(29, "냉동/이색/간편채소", 1),
						new CategoryVO(30, "콩나물/버섯", 1),
						new CategoryVO(31, "국산과일", 1),
						new CategoryVO(32, "수입과일", 1),
						new CategoryVO(33, "냉동/건과일", 1),
						new CategoryVO(34, "견과류", 1),
						new CategoryVO(35, "쌀/잡곡", 1),
						new CategoryVO(36, "국내산소고기", 3),
						new CategoryVO(37, "수입산소고기", 3),
						new CategoryVO(38, "돼지고기", 3),	
						new CategoryVO(39, "계란류", 3),
						new CategoryVO(40, "닭/오리고기", 3),
						new CategoryVO(41, "양념육/돈까스", 3),	
						new CategoryVO(42, "양고기", 3),
						new CategoryVO(43, "국/탕/찌개", 5),
						new CategoryVO(44, "밀키트/메인요리", 5),
						new CategoryVO(45, "밑반찬", 5),
						new CategoryVO(46, "김치/젓갈/장류", 5),
						new CategoryVO(47, "두부/어묵/부침개", 5),
						new CategoryVO(48, "베이컨/햄/통조림", 5)
					 );
		search = new CategoryVO(0, "간식", 0);
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
