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
import com.pcwk.ehr.admin.dao.ProductDao;
import com.pcwk.ehr.admin.dao.UserDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.domain.Level;
import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.domain.UserVO;
import com.pcwk.ehr.cmn.SearchVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JProductDaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	ProductDao dao;
	
	ProductVO prodVO1;
	ProductVO prodVO2;
	ProductVO prodVO3;
	
	ProductVO search;
	SearchVO searchVO;
	
	@Before
	public void setUp() throws Exception {
		prodVO1 = new ProductVO(1, "라라스윗 초코", 2000, 1, 1, "생산지_01", 0, "20221231", "상품설명_01", 0, 2000, 5, "", "");
		prodVO2 = new ProductVO(2, "라라스윗 바닐라", 2000, 1, 1, "생산지_02", 0, "20221231", "상품설명_02", 0, 2000, 5, "", "");
		prodVO3 = new ProductVO(3, "라라스윗 민트초코", 2500, 1, 1, "생산지_03", 0, "20230131", "상품설명_03", 0, 2000, 5, "", "");
		
		search = new ProductVO(3, "라라스윗", 2500, 1, 1, "생산지", 0, "20230131", "상품설명", 0, 2000, 5, "", "");
		
		searchVO = new SearchVO(10, 1, "20", "라라스윗");
	}
	
	
	public void isSameUser(ProductVO actUser, ProductVO addUser) {
		// assertEquals(실제 데이터, 예상 데이터) : 실제 D와 예상 D가 같으면 test 성공
		assertEquals(actUser.getItemNo(), addUser.getItemNo());
		
		assertEquals(actUser.getName(), addUser.getName());
		assertEquals(actUser.getPrice(), addUser.getPrice());
		assertEquals(actUser.getCategoryNo(), addUser.getCategoryNo());
	}	

	
	@Test
	@Ignore
	public void doRetrieve() throws SQLException {
		dao.doDelete(prodVO1);
		dao.doDelete(prodVO2);
		dao.doDelete(prodVO3);
		
		dao.doSave(prodVO1);
		dao.doSave(prodVO2);
		dao.doSave(prodVO3);
		
		// 페이징 목록 조회 후 비교 확인
		List<ProductVO> list = dao.doRetrieve(searchVO);
		assertEquals(list.get(0).getName(), prodVO1.getName());
		
		// 한건 조회 후 비교 확인
		ProductVO outVO = dao.doSelectOne(prodVO1);
		isSameUser(prodVO1, outVO);
	}
	
	@Test
	//@Ignore
	public void doUpdate() throws SQLException{
		LOG.debug("==============================");
		LOG.debug("=== doUpdate() ===");
		LOG.debug("==============================");
		
		// 삭제
		dao.doDelete(prodVO1);
		dao.doDelete(prodVO2);
		dao.doDelete(prodVO3);
		
		// 등록
		dao.doSave(prodVO1);
		
		LOG.debug(" ******** prodVO1 : " + prodVO1.getExpired());
		
		assertEquals(1, dao.getCount(search));
		
		ProductVO outVO = dao.doSelectOne(prodVO1);
		isSameUser(prodVO1, outVO);
		
		outVO.setName(outVO.getName() + "_UPDATE22");
		outVO.setExpired("20301201");
		
		LOG.debug(" >>>>>>>>> outVO.outVO : " + outVO.getExpired());
		
		// 수정 및 수정된 결과 확인
		assertEquals(1, dao.doUpdate(outVO));
	}
	
	@Test
	@Ignore	
	public void addAndGet() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=== addAndGet() ===");
		LOG.debug("==============================");
		
		dao.doDelete(prodVO1);
		dao.doDelete(prodVO2);
		dao.doDelete(prodVO3);
		
		dao.doSave(prodVO1);
		List<ProductVO> list = dao.getALL(search);
		isSameUser(prodVO1, list.get(0));
		
		dao.doSave(prodVO2);
		dao.doSave(prodVO3);
		
		// getCount()는 현재 ProductVO 에 categoryNo 값으로 비교하고 있음
		// 카테고리 카운트
		assertEquals(3, dao.getCount(search));

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
