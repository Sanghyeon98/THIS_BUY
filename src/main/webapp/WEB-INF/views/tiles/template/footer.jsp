<%--
/**
  Class Name: footer.jsp
  Description:
  Modification information
  
   수정일     수정자      수정내용
  -----   -----  -------------------------------------------
  2022. 12. 13        최초작성 
    
  author eclass 개발팀 : ITSC
  since 2022.11.28
  Copyright (C) by KandJang All right reserved.
*/
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>

<style>
  .main_footer {
    height: 100px;
  }
</style>

<div id="footer" class="main_footer">
  <p>Copyright &copy; by 2022 YOON All right reserved.</p>
</div>