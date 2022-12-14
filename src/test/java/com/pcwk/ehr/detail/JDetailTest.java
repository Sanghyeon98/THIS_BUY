package com.pcwk.ehr.detail;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

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

import com.pcwk.ehr.detail.dao.DetailDao;
import com.pcwk.ehr.detail.domain.DetailVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class JDetailTest {
	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired // 테스트 오브젝트가 만들어지고 나면 스프링 테스트 컨텍스트에 의해 자동으로 값으 주입된다.
	ApplicationContext context;

	@Autowired
	DetailDao dao;

	DetailVO detailVO1;
	DetailVO detailVO2;
	DetailVO detailVO3;

	@Before
	public void setUp() throws Exception {
		LOG.debug("==============================");
		LOG.debug("context:" + context);
		LOG.debug("dao:" + dao);
		LOG.debug("==============================");
		// DetailVO(int itemNo, String name, int price, int categoryNo, int imageNo,
		// String production, int weight,
		// String expired, String detail, int discount, int finalPrice, int sales,
		// String regDt, String modDt) {

		detailVO1 = new DetailVO(10, "몬스터", 2200, 6, 1, "생산지_02", 300, "20221201", "상품설명_02", 1, 2200, 1, "", "");
	}

	@Test
	// @Ignore
	public void doselectOne() throws Exception {
		dao.doDelete(detailVO1);
		dao.doSave(detailVO1);

		DetailVO outVO = dao.doSelectOne(detailVO1);
		isSameData(outVO, detailVO1);

	}

	public void isSameData(DetailVO actual, DetailVO expected) {
		assertEquals(actual.getImageNo(), expected.getImageNo());
		assertEquals(actual.getName(), expected.getName());
		assertEquals(actual.getPrice(), expected.getPrice());

	}

	@Test
	@Ignore
	public void test() {
		LOG.debug("==============================");
		LOG.debug("context:" + context);
		LOG.debug("dao:" + dao);
		LOG.debug("==============================");

		assertNotNull(context);
		assertNotNull(dao);
	}

}
