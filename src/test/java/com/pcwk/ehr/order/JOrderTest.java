package com.pcwk.ehr.order;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
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

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.order.dao.OrderDao;
import com.pcwk.ehr.order.domain.OrderVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								 ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JOrderTest {
	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired //테스트 오브젝트가 만들어지고 나면 스프링 테스트 컨텍스트에 의해 자동으로 값으 주입된다.
	ApplicationContext context;
	
	@Autowired
	OrderDao dao;
	
	OrderVO   orderVO1;
	OrderVO   orderVO2;
	OrderVO   orderVO3;
	
	SearchVO searchVO;
	OrderVO search;
	
	@Before
	public void setUp() throws Exception {
		
		orderVO1 = new OrderVO(01,90,"AB",10,1000,50,"아무개","01011111111","서울시","없음","없음","20221111");
		orderVO2 = new OrderVO(01,90,"AB",10,1000,51,"아무개","01011111111","서울시","없음","없음","20221111");
		orderVO3 = new OrderVO(01,90,"AB",10,1000,52,"아무개","01011111111","서울시","없음","없음","20221111");
		
		searchVO = new SearchVO(10, 1, "", "");
	}
	public void isSameUser(OrderVO actUser, OrderVO addUser) {
		// assertEquals(실제 데이터, 예상 데이터) : 실제 D와 예상 D가 같으면 test 성공
		assertEquals(actUser.getOrderNO(), addUser.getOrderNO());
		assertEquals(actUser.getMemberId(), addUser.getMemberId());		
		assertEquals(actUser.getPrice(), addUser.getPrice());
	}	
	@Test
	@Ignore
	public void doUpdate() throws SQLException{
		dao.doDelete(orderVO1);
		dao.doDelete(orderVO2);
		dao.doDelete(orderVO3);
		
		dao.doSave(orderVO1);
		dao.doSave(orderVO2);
		dao.doSave(orderVO3);
		
		
		
	}
	
	
	@Test
	@Ignore	
	public void addAndGet() throws SQLException {
		LOG.debug("┌============================┐");
		LOG.debug("│== addAndGet() ===");
		LOG.debug("└============================┘");
		
		dao.doDelete(orderVO1);
		dao.doDelete(orderVO2);
		dao.doDelete(orderVO3);
		
		dao.doSave(orderVO3);
		List<OrderVO> list = dao.doRetrieve(search);
		isSameUser(orderVO1, list.get(0));
		
		dao.doSave(orderVO2);
		dao.doSave(orderVO2);
		
		// getCount()는 현재 ProductVO 에 categoryNo 값으로 비교하고 있음
		// 카테고리 카운트
		//assertEquals(3, dao.getCount(search));

	}	
	
	@Test
	
	public void bean() {
		LOG.debug("==============================");
		LOG.debug("context:"+context);	
		LOG.debug("==============================");
		
		assertNotNull(context);
	}

}
