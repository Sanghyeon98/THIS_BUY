package com.pcwk.ehr.cart;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pcwk.ehr.cart.dao.CartDao;
import com.pcwk.ehr.cart.domain.CartVO;


@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
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
		cartVO1 =new CartVO(1,1,"id_1","삼다수",1000,1);
		cartVO2 =new CartVO(2,2,"id_2","오아시스",700,1);
		cartVO3 =new CartVO(3,3,"id_3","에비앙",1500,1);
	}

	@Test
	public void doUpdate() throws SQLException{
		dao.doDelete(cartVO1);
		dao.doDelete(cartVO2);
		dao.doDelete(cartVO3);
		
	}
	
	@Test
	public void test() {
	}

}
