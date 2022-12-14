package com.pcwk.ehr.member;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
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
import com.pcwk.ehr.member.dao.Memberdao;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;
import com.pcwk.ehr.member.service.MemberServiceImpl;






@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JMemberserviceTest {
	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	Memberdao dao;
	
	@Autowired
	MemberService  memberService;
	
	@Autowired
	PlatformTransactionManager  transactionManager;
	
	//테스트 픽스처
	List<MemberVO> members;
	
	//검색에 사용
	MemberVO search;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|setUp:                                     |");
		LOG.debug("└-------------------------------------------┘");	

		members = Arrays.asList(
				 new MemberVO("tkdeja", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1")
				,new MemberVO("tkdeja1", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 통일로 32길 1-13 342호",2,"1995년03월21일","2022-12-02","","1")
				,new MemberVO("tkdeja2", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1")
				,new MemberVO("tkdeja3", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1")
				,new MemberVO("tkdeja4", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1")
		        );
		search  = new MemberVO("tkdeja", "1234abc!", "김혜석","tkdeja941@gmail.com","010-2800-9441","서울시 ㅁㅁ구 ㅁㅁ동 405-22 319호",2,"1995년03월21일","2022-12-02","","1");
				
	}
	@Test
	//@Ignore
	public void idPassCheck()throws SQLException{
		//1.기존데이터 삭제
		//2.데이터 입력

		//1.
		for(MemberVO vo  :members) {
			memberService.doDelete(vo);
		}
		
		//2.
		for(MemberVO vo  :members) {
			memberService.add(vo);
		}		
		
		assertEquals(5, memberService.getCount(search));
		
		//3.
		MemberVO inVO = members.get(0);
		inVO.setuId("tkdeja");
		inVO.setPasswd("1234abc!");
		
		int flag = memberService.idPassCheck(inVO);
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|flag:"+flag);
		LOG.debug("└-------------------------------------------┘");		
		assertEquals(30, flag);
		
	}
	@Test
	//@Ignore
	public void upDeleteAll()throws SQLException{
		//1.기존데이터 삭제
		//2.데이터 입력
		//3.전부삭제
		
		try {
			//1.
			for(MemberVO vo  :members) {
				memberService.doDelete(vo);
			}
			
			//2.
			for(MemberVO vo  :members) {
				memberService.add(vo);
			}
			
			assertEquals(5, memberService.getCount(search));
			
			//3.
			for(MemberVO vo :members.subList(0, 2)) {
				LOG.debug("|vo()"+vo);
			}
			assertEquals(5,memberService.upDeleteAll(members));
			
			assertEquals(0, memberService.getCount(search));
			   
		}catch(Exception e) {
			LOG.debug("┌-upDeleteAll()------------------------------------------┐");
			LOG.debug("|-upDeleteAll()"+e.getMessage());
			LOG.debug("└-upDeleteAll()------------------------------------------┘");			
		}
		
	}
	@Test
	//@Ignore
	public void add() throws SQLException {
		//3. 각각 추가
		//4. 각각 데이터 조회
		//5. 비교
		
		LOG.debug("┌-add()------------------------------------------┐");
		
		//1.
		for(MemberVO vo   :members) {
			memberService.doDelete(vo);
		}
		for(MemberVO vo : members) {
			memberService.add(vo);
		}

		LOG.debug("└-add()------------------------------------------┘");	
	}
		
	@Test
	@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|context:"+context                        +"|");
		LOG.debug("|dao:"+dao                                +"|");
		LOG.debug("|userService:"+memberService                +"|");
		LOG.debug("└-------------------------------------------┘");
		
		assertNotNull(transactionManager);
		assertNotNull(context);
		assertNotNull(dao);
		assertNotNull(memberService);
	}
		
}

	
	
	
