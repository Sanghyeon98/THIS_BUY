<%--
/**
  Class Name: header.jsp
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
  .pHeader {
    background-color: #e3f2fd;
  }
</style>

<div id="header" class="pHeader">
  <!-- nav -->
  <nav class="navbar navbar-default">
    <div class="container-fluid">
    
      <!-- brand -->
	    <div class="navbar-header">
	      <a class="navbar-brand" href="${CP}/menu/tmpMenu.do">
	        <img alt="Brand" src="${CP}/resources/images/brand.png" width="60%">
	      </a>
	    </div>
      <!-- brand -------------------------------------------------------------->
      
      <!-- menu -->
	    <ol class="breadcrumb text-left">
			  <li><a href="${CP}/user/view.do" >회원관리</a></li>
			  <li><a href="${CP}/board/boardView.do?div=10" >공지사항</a></li>
			  <li><a href="${CP}/board/boardView.do?div=20" >자유게시판</a></li>
			  <li><a href="${CP}/boot/bootList.do" >템플릿 리스트</a></li>
			  <li><a href="${CP}/boot/bootReg.do" >템플릿 등록</a></li>
			  <li><a href="${CP}/file/viewFile.do" >파일 업로드</a></li>
			  <li><a href="${CP}/naver/view.do" >네이버API</a></li>
			  <li><a href="${CP}/chart/pie.do" >Pie</a></li>
			  <li><a href="${CP}/chart/line.do" >Line</a></li>
			  <li class="active">Data</li>
			  
			  <!-- login/logout -->
				<c:choose>
				  <c:when test="${null != sessionScope.userInfo && not empty sessionScope.userInfo}">
				    <li class="navbar-right">
				      <span class="label label-default">${sessionScope.userInfo.name }</span>
				      <a href="javascript:doLogout();" class="navbar-link">
		            <span class="glyphicon glyphicon-log-in" id="doLogout">로그아웃</span>
		          </a>
		        </li>
				  </c:when>
				  <c:otherwise>
				    <li class="navbar-right">
				      <a href="javascript:doLogin();" class="navbar-link">
				        <span class="glyphicon glyphicon-log-in" id="doLogin">로그인</span>
				      </a>
				    </li>
				  </c:otherwise> 
				</c:choose> 
			</ol>
      <!-- menu --------------------------------------------------------------->
      
    </div>
  
  <script>
    function doLogout() {
    	if(confirm('로그아웃 하시겠습니까?') == false) return; 
    	window.location.href = "${CP}/login/doLogout.do";
    }
    
    function doLogin() {
    	window.location.href = "${CP}/login/loginView.do";
    }
  </script>  
    
  </nav>
  <!-- nav -------------------------------------------------------------------->
</div>