package com.pcwk.ehr.member;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.dao.Memberdao;
import com.pcwk.ehr.member.dao.MemberDaoImpl;
import com.google.gson.Gson;
import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.cmn.SearchVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
								  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class JMemberdaoTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	Memberdao dao;
	
	MemberVO   memberVO1;
	MemberVO   memberVO2;
	MemberVO   memberVO3;
	MemberVO   memberVO4;
	MemberVO   memberVO5;
	
	SearchVO   searchVO;
	
	MemberVO   search;
	
	//브라우저 대역(Mock)
		MockMvc  mockMvc;
		
	//테스트 픽스처
		List<MemberVO> users;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("==============================");
		LOG.debug("context:"+context);	
		LOG.debug("userDao:"+dao);
		LOG.debug("==============================");
		memberVO1 = new MemberVO("tkdeja", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
		memberVO2 = new MemberVO("tkdeja1", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 통일로 32길 1-13 342호",2,"1995년03월21일","2022-12-02","","1");
		memberVO3 = new MemberVO("tkdeja2", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
		memberVO4 = new MemberVO("tkdeja3", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
		memberVO5 = new MemberVO("tkdeja4", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
        //데이터 검색용
		search  = new MemberVO("tkdeja", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
		//페이지+검색
		searchVO  = new SearchVO(10,1,"10","p99");
	}
	public void isSameUser(MemberVO actUser, MemberVO addUser) {
		assertEquals(actUser.getuId(), addUser.getuId());
		assertEquals(actUser.getPasswd(), addUser.getPasswd());
		assertEquals(actUser.getEmail(), addUser.getEmail());
	}
	
	@Test
	//@Ignore
	public void doUpdate() throws SQLException{
		//1. 삭제
		//2. 등록
		//3. 한건조회
		//4. 한건조회 데이터 수정
		//5. 수정
		//6. 한건조회
		//7. 비교
		
		//1.
		dao.doDelete(memberVO1);		
		dao.doDelete(memberVO2);
		dao.doDelete(memberVO3);
		dao.doDelete(memberVO4);
		dao.doDelete(memberVO5);
		
		//2.
		dao.doSave(memberVO1);
		assertEquals(1, dao.getCount(search));
		
		//3.
		MemberVO voVO01 = dao.doSelectOne(memberVO1);
		isSameUser(memberVO1, voVO01);
		
		String upStr = "_U";
		int upInt    = 100;
		int upInta    = 1;
		
		voVO01.setPasswd(voVO01.getPasswd()+upStr);
		voVO01.setName(voVO01.getName()+upStr);
		voVO01.setEmail(voVO01.getEmail()+upStr);
		voVO01.setPhone(voVO01.getPhone()+upStr);
		voVO01.setAddress(voVO01.getAddress()+upStr);
		voVO01.setGender(voVO01.getGender()+upInta);
		
		//5.
		assertEquals(1, dao.doUpdate(voVO01));
		
		//6.
		MemberVO vsVOResult = dao.doSelectOne(voVO01);
		
		isSameUser(vsVOResult, voVO01);	
	}
	
	@Test
	//@Ignore
	public void addAndGet() throws SQLException {
		LOG.debug("==============================");
		LOG.debug("=addAndGet()=");
		LOG.debug("==============================");	
		//삭제
		dao.doDelete(memberVO1);		
		dao.doDelete(memberVO2);
		dao.doDelete(memberVO3);
		dao.doDelete(memberVO4);
		dao.doDelete(memberVO5);
        
		//등록		
		//1 한건 등록
		dao.doSave(memberVO1);
		List<MemberVO> list= dao.getAll(search);
		assertEquals(1, dao.getCount(search));
		isSameUser(memberVO1, list.get(0));

		//2 한건 등록
		dao.doSave(memberVO2);
		list= dao.getAll(search);
		assertEquals(2, dao.getCount(search));
		isSameUser(memberVO2, list.get(1));
		
		//3 한건 등록		
		dao.doSave(memberVO3);
		list= dao.getAll(search);
		assertEquals(3, dao.getCount(search));
		isSameUser(memberVO3, list.get(2));		
	}
	@Test
	public void doRetrive() throws Exception{
		//url, param 설정, 호출방식(get/post)
		MockHttpServletRequestBuilder  requestBuilder= MockMvcRequestBuilders.get("/user/doRetrive.do")
				                                       .param("pageSize", searchVO.getPageSize()+"")
				                                       .param("pageNo", searchVO.getPageNo()+"")
				                                       .param("searchDiv", searchVO.getSearchDiv())
				                                       .param("searchWord", searchVO.getSearchWord());
		//대역 객체를 통해 호출
		ResultActions resultActions =mockMvc.perform(requestBuilder)
		                                               .andExpect(status().is2xxSuccessful());	
		
		String responseResult =  resultActions.andDo( print() )
			    .andReturn().getResponse().getContentAsString();	
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|responseResult:"+responseResult);
		LOG.debug("└-------------------------------------------┘");			
		
	}
	@Test
	public void doSelectOne() throws Exception{
		//url, param 설정, 호출방식(get/post)
		MockHttpServletRequestBuilder  requestBuilder= MockMvcRequestBuilders.get("/user/doSelectOne.do")
				                                       .param("uId", users.get(0).getuId());	
		
		//대역 객체를 통해 호출
		ResultActions resultActions =mockMvc.perform(requestBuilder)
		                                               .andExpect(status().is2xxSuccessful());	
		
		String responseResult =  resultActions.andDo( print() )
			    .andReturn().getResponse().getContentAsString();	
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|responseResult:"+responseResult);
		LOG.debug("└-------------------------------------------┘");		
		
		MemberVO outVO = new Gson().fromJson(responseResult, MemberVO.class);
		assertEquals(outVO.getuId(), users.get(0).getuId());
	}
	
	@Test
	public void beans() {
		assertNotNull(context);
		assertNotNull(dao);

	}
}
