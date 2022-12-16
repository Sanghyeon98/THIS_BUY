package com.pcwk.ehr.admin;

import static org.junit.Assert.*;

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

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JProductServiceTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	ProductService prodService;
	
	@Autowired
	PlatformTransactionManager transactionManager;
	
	// 테스트 픽스쳐
	List<ProductVO> products;

	@Before
	public void setUp() throws Exception {
		products = Arrays.asList(
					new ProductVO(1, "안동에서 올라온 전통찜닭(2인용)", 16900, 10, 44, 1, "생산지_01", 0, "20221231", "상품설명_01", 0, 2000, 5, "", ""),
					new ProductVO(2, "KF365 노르웨이 생연어회 200g(냉장)", 13900, 20, 20, 1, "노르웨이", 200, "20221211", "팔딱팔딱 싱싱한 노르웨이 연어!", 0, 0, 0, "", ""),
					new ProductVO(3, "탑마루 꿀 밤고구마 1.5kg", 6900, 35, 17, 1, "홍성", 1500, "20221225", "꿀꿀! 꿀 밤고구마!", 0, 0, 0, "", ""),
					new ProductVO(4, "유기농 공주 햇 옥광밤 800g", 14900, 20, 16, 1, "공주", 800, "20230122", "유기농! 맛밤!", 0, 0, 0, "", ""),
					new ProductVO(5, "[달콘] 초당옥수수 (레토르트) 1입", 3690, 100, 17, 1, "생산지", 800, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(6, "무농약 연근", 6990, 48, 17, 1, "생산지", 800, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(7, "해남 호박고구마 1.5kg", 10900, 50, 17, 1, "해남", 1500, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(8, "제주 흙당근 1kg", 5500, 50, 17, 1, "제주", 1000, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(9, "친황경 깐 감자", 4490, 50, 17, 1, "생산지", 250, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(10, "영암 친환경 꿀고구마 2kg", 13900, 27, 17, 1, "생산지", 2000, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(11, "세발나물 150g", 1790, 30, 18, 1, "생산지", 150, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(12, "유채나물 150g", 2490, 30, 18, 1, "생산지", 150, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(13, "돌나물 150g", 1690, 30, 18, 1, "생산지", 150, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(14, "달래 60g", 2690, 30, 18, 1, "생산지", 60, "20230122", "제품 설명", 0, 0, 0, "", ""),
					new ProductVO(15, "냉이 150g", 4990, 30, 18, 1, "생산지", 150, "20230122", "제품 설명", 0, 0, 0, "", "")
					
				);
	}
	
	@Test
	public void upDeleteAll() throws SQLException {
		
	}
	
	@Test
	public void add() throws SQLException {
		// 데이터 삭제
		for(ProductVO vo : products) {
			prodService.doDelete(vo);
		}
		
		// 데이터 추가
		for(ProductVO vo : products) {
			prodService.add(vo);
		}
	}

	@Test
	@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|  context : " + context);
		LOG.debug("|  prodService : " + prodService);
		LOG.debug("|  transactionManager : " + transactionManager);
		LOG.debug("└-------------------------------------------┘");
		
		assertNotNull(context);
		assertNotNull(prodService);
		assertNotNull(transactionManager);
	}

}
