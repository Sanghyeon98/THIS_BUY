package com.pcwk.ehr.member.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.member.dao.MemberDaoImpl;
import com.pcwk.ehr.member.dao.Memberdao;
import com.pcwk.ehr.member.domain.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	final Logger LOG = LogManager.getLogger(getClass());
	@Autowired
	private Memberdao memberDao;
	
	
	@Override
	public int idPassCheck(MemberVO inVO) throws SQLException {
		int flag = memberDao.idCheck(inVO);
		if( 1 != flag) {//id가 존재 하지 않음!
			LOG.debug("┌-------------------------------------------┐");
			LOG.debug("|id가 존재 하지 않음!");
			LOG.debug("└-------------------------------------------┘");			
			return 10;
		}
		
		flag = memberDao.passCheck(inVO);
		if(1 != flag) {
			LOG.debug("┌-------------------------------------------┐");
			LOG.debug("|비번 불일치 !");
			LOG.debug("└-------------------------------------------┘");					
			return 20;
		}
		
		
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|id/비번 일치 !");
		LOG.debug("└-------------------------------------------┘");			
		return 30;
	}

	@Override
	public int upDeleteAll(List<MemberVO> members) throws SQLException {
		int cnt = 0;
		try {
		
			for(MemberVO vo :members) {

				cnt+=memberDao.doDelete(vo);
			}
			
		}catch(Exception e) {
			LOG.debug("┌-------------------------------------------┐");
			LOG.debug("|rollback:"+e.getMessage());
			LOG.debug("└-------------------------------------------┘");
			throw e;		
		}
		
		return cnt;
	}

	@Override
	public int idCheck(MemberVO inVO) throws SQLException {
		return memberDao.idCheck(inVO);
	}

	@Override
	public int PassCheck(MemberVO inVO) throws SQLException {
		return memberDao.passCheck(inVO);
	}

	@Override
	public int add(MemberVO inVO) throws SQLException {
		return memberDao.doSave(inVO);
	}

	@Override
	public int doDelete(MemberVO inVO) throws SQLException {
		return memberDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(MemberVO inVO) throws SQLException {
		return memberDao.doUpdate(inVO);
	}

	@Override
	public MemberVO doSelectOne(MemberVO inVO) throws SQLException {
		return memberDao.doSelectOne(inVO);
	}

	@Override
	public List<MemberVO> doRetrieve(DTO inVO) throws SQLException {
		return memberDao.doRetrieve(inVO);
	}

	@Override
	public int getCount(MemberVO inVO) throws SQLException {
		return memberDao.getCount(inVO);
	}

}
