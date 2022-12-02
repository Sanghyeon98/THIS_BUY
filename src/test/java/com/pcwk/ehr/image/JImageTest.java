package com.pcwk.ehr.image;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

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

import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.image.dao.ImageDao;
import com.pcwk.ehr.image.domain.ImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								 ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class JImageTest {
	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired //테스트 오브젝트가 만들어지고 나면 스프링 테스트 컨텍스트에 의해 자동으로 값으 주입된다.
	ApplicationContext context;
	
	@Autowired
	ImageDao dao;
	
	//테스트 데이터
	ImageVO imageVO1;
	ImageVO imageVO2;
	ImageVO imageVO3;
	
	ImageVO search;
	
	SearchVO searchVO;
	
	@Before
	public void setUp() throws Exception {                                                               
	}

	@Test
	@Ignore
	public void addAndGet()throws SQLException{
		dao.doDelete(imageVO1);
		dao.doDelete(imageVO2);
		dao.doDelete(imageVO3);
		
		
		dao.doSave(imageVO1);
		dao.doSave(imageVO2);
		dao.doSave(imageVO3);
	}
	
	@Test
	//@Ignore
	public void doUpdate() throws SQLException{
		dao.doDelete(imageVO1);
		dao.doDelete(imageVO2);
		dao.doDelete(imageVO3);
		
		dao.doSave(imageVO1);
		dao.doSave(imageVO2);
		dao.doSave(imageVO3);
		
		//cartVO1.setCartNO(1).setQuantity(5);
	   	//dao.doUpdate(cartVO1);
		
	} 

	@Test
	public void bean() {
		LOG.debug("┌────────────────────────────────────────────────────────┐");
		LOG.debug("│ context : " + context                                    );
		LOG.debug("│ dao : " + dao                                            );
		LOG.debug("└────────────────────────────────────────────────────────┘");
		assertNotNull(context);
		assertNotNull(dao);
	}
 
} 