package com.pcwk.ehr.cmn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	final Logger  LOG = LogManager.getLogger(getClass());
	
	
	//Login session이 없으면 로그인 페이지로 이동
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//session(userInfo)이 없으면 로그인 페이지로 이동, 그렇치 않으면 정상 수행
		
		//session 객체 생성
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("memberInfo");
		LOG.debug("==========================");
		LOG.debug("=obj="+obj);
		LOG.debug("==========================");
		  
		//session이 없으면: 로그인 페이지로 이동
		if(null == obj) {  
			LOG.debug("=request.getContextPath()="+request.getContextPath());
			String sendUrl = request.getContextPath()+"/login/login.do";
			LOG.debug("=sendUrl="+sendUrl);
			response.sendRedirect(sendUrl); 
			
			return false;//요청 controller는 호출되지 않음
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
