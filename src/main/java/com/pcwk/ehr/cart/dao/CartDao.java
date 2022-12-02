package com.pcwk.ehr.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cart.domain.CartJoinVO;
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface CartDao extends WorkDiv<CartVO> {
 
	List<CartJoinVO> getAll(CartJoinVO inVO) throws SQLException;
}
