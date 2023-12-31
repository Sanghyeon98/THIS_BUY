package com.pcwk.ehr.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.member.domain.MemberVO;

@Repository("memberDao")
public class MemberDaoImpl implements Memberdao {
final Logger LOG = LogManager.getFormatterLogger(getClass());
    
	final String NAMESPACE = "com.pcwk.ehr.signup";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;//db���ᰴü
	
	public MemberDaoImpl() {}
	
	
	@Override
	public int doSave(MemberVO inVO) throws SQLException {
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );
		
		String statement = NAMESPACE+DOT+"doSave";
		LOG.debug("|statement:"+statement );
		
		int flag = sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("|flag:"+flag );
		LOG.debug("��--------------------------------��");		
		return flag;
	}

	@Override
	public int doDelete(MemberVO inVO) throws SQLException {
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );

		
		String statement = NAMESPACE+DOT+"doDelete";
		LOG.debug("|statement:"+statement );

		
		int flag = sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("|flag:"+flag );
		LOG.debug("��--------------------------------��");		
		return flag;
	}

	@Override
	public int doUpdate(MemberVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = NAMESPACE+DOT+"doUpdate";
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );  		
		
		flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("��--------------------------------��");
		return flag;
	}

	@Override
	public int pwUpdate(MemberVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = NAMESPACE+DOT+"pwUpdate";
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );  		
		
		flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("��--------------------------------��");
		return flag;
	}
	
	@Override
	public MemberVO doSelectOne(MemberVO inVO) throws SQLException {
		MemberVO outVO = null;
		//com.pcwk.ehr.user.doSelectOne
		String statement = NAMESPACE+DOT+"doSelectOne";
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );  

		outVO = sqlSessionTemplate.selectOne(statement, inVO);
		
		LOG.debug("|outVO:"+outVO );
		LOG.debug("��--------------------------------��");			
		return outVO;
	}

	@Override
	public List<MemberVO> getAll(MemberVO inVO) throws SQLException {
        List<MemberVO> list = null;
        
        String statement = NAMESPACE+DOT+"getAll";
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );       
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		for( MemberVO vo :list) {
			LOG.debug("|vo:"+vo );     
		}
		
		LOG.debug("��--------------------------------��");		
		return list;
	}




	@Override
	public int idCheck(MemberVO inVO) throws SQLException {
		int cnt = 0;
		String statement = NAMESPACE+DOT+"idCheck";
		LOG.debug("��--------------------------------��");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );
		
		cnt = sqlSessionTemplate.selectOne(statement,inVO);
		LOG.debug("|cnt:"+cnt );
		LOG.debug("��--------------------------------��");		
		return cnt;
	}



	@Override
	public List<MemberVO> doRetrieve(DTO inVO) throws SQLException {
		SearchVO search = (SearchVO) inVO;
		List<MemberVO> list = new ArrayList<MemberVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + inVO );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(MemberVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}


	@Override
	public int getCount(MemberVO inVO) throws SQLException {
		int count = 0;
		String statement = NAMESPACE+DOT+"getCount";
		
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );  
		
		count = sqlSessionTemplate.selectOne(statement, inVO);
		
		LOG.debug("|count:"+count );  		
		LOG.debug("└--------------------------------┘");		
		return count;
	}


	@Override
	public int passCheck(MemberVO inVO) throws SQLException {
		int cnt = 0;
		String statement = NAMESPACE+DOT+"passCheck";
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );		
		
		cnt = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|cnt:"+cnt );
		LOG.debug("└--------------------------------┘");		
		return cnt;
	}
	
	@Override
	public int authCheck(MemberVO inVO) throws SQLException {
		int cnt = 0;
		String statement = NAMESPACE+DOT+"authCheck";
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|param:"+inVO );        
		LOG.debug("|statement:"+statement );		
		
		cnt = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|cnt:"+cnt );
		LOG.debug("└--------------------------------┘");		
		return cnt;
	}


	@Override
	public int mailCheck(MemberVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	}









