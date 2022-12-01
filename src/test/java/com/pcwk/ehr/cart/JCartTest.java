package com.pcwk.ehr.cart;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pcwk.ehr.cart.dao.CartDao;
import com.pcwk.ehr.cart.domain.CartVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								 ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JCartTest {
	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired //테스트 오브젝트가 만들어지고 나면 스프링 테스트 컨텍스트에 의해 자동으로 값으 주입된다.
	ApplicationContext context;
	
	@Autowired
	CartDao dao;
	
	CartVO   cartVO1;
	CartVO   cartVO2;
	CartVO   cartVO3;

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	
	@Before
	public void setUp() throws Exception {
		LOG.debug("==============================");
		LOG.debug("context:"+context);
		LOG.debug("dao:"+dao);
		LOG.debug("==============================");
		
		cartVO1 = new CartVO(2,2,"test01",2);
		cartVO2 = new CartVO(3,3,"test01",3);
		cartVO3 = new CartVO(4,4,"test01",4);
	
	}
	
	@Test
	@Ignore
	public void addAndGet()throws SQLException{
		dao.doDelete(cartVO1);
		dao.doDelete(cartVO2);
		dao.doDelete(cartVO3);
		
		
		dao.doSave(cartVO1);
		dao.doSave(cartVO2);
		dao.doSave(cartVO3);
	}
	
	@Test
	@Ignore
	public void doUpdate() throws SQLException{
		dao.doDelete(cartVO1);
		dao.doDelete(cartVO2);
		dao.doDelete(cartVO3);
		
		dao.doSave(cartVO1);
		dao.doSave(cartVO2);
		dao.doSave(cartVO3);
		
		CartVO out01 = dao.doSelectOne(cartVO1);
		isSameData(out01, cartVO1);
		
		String upStr = "_U";
		int upInt    = 10;
		
		out01.setMemberId(out01.getMemberId()+upStr);
		out01.setQuantity(out01.getQuantity()+upInt);
	}
	
	public void isSameData(CartVO actual,CartVO expected) {
		assertEquals(actual.getCartNO(), expected.getCartNO());
		assertEquals(actual.getItemNO(), expected.getItemNO());
		
		assertEquals(actual.getMemberId(), expected.getMemberId());
		assertEquals(actual.getQuantity(), expected.getQuantity());
	}
	
	@Test
	//@Ignore
	public void beans() {
		LOG.debug("==============================");
		LOG.debug("context:"+context);	
	//	LOG.debug("dao:"+dao);
		LOG.debug("==============================");
		
		assertNotNull(context);
		assertNotNull(dao);
	}

}
