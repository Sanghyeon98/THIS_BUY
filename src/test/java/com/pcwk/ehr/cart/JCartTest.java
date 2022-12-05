package com.pcwk.ehr.cart;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.AfterClass ;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pcwk.ehr.cart.dao.CartDao;
import com.pcwk.ehr.cart.domain.CartJoinVO;
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
	
	CartJoinVO cartJoinVO1; 
	CartJoinVO cartJoinVO2; 
	CartJoinVO cartJoinVO3; 
	
	CartVO   cartVO1;
	CartVO   cartVO2;
	CartVO   cartVO3;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("==============================");
		LOG.debug("context:"+context);
		LOG.debug("dao:"+dao);
		LOG.debug("==============================");
		
		cartVO1 = new CartVO(2,2,"test01",2);
		cartVO2 = new CartVO(3,3,"test01",3);
		cartVO3 = new CartVO(4,4,"test01",4);
	
		cartJoinVO1 = new CartJoinVO(1, 1, "admin", 1, "", "", "", 1, "", 0, 0);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
	}
	@Test
	//@Ignore
	public void getAll() throws SQLException{
		
		List<CartJoinVO> list = dao.getAll(cartJoinVO1);
	}
	
	@Test
	//@Ignore
	public void addAndGet()throws SQLException{
		dao.doDelete(cartVO1);
		dao.doDelete(cartVO2);
		dao.doDelete(cartVO3);
		
		dao.doSave(cartVO1);
		dao.doSave(cartVO2);
		dao.doSave(cartVO3);
	}
	
	@Test
	//@Ignore
	public void doUpdate() throws SQLException{
		dao.doDelete(cartVO1);
		dao.doDelete(cartVO2);
		dao.doDelete(cartVO3);
		
		dao.doSave(cartVO1);
		dao.doSave(cartVO2);
		dao.doSave(cartVO3);
		
		cartVO1.setQuantity(5);
	   	dao.doUpdate(cartVO1);
		
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
		LOG.debug("dao:"+dao);
		LOG.debug("==============================");
		
		assertNotNull(context);
		assertNotNull(dao);
	}

}
