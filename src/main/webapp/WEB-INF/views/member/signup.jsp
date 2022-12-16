
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP_RES}/favicon.ico">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">

<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- String, Number, Date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>

<!-- paging -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>

<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title></title>


 
</head>
<body>
  <!-- div container -->     
  <div class="container">   
    <!-- 제목 -->
    <div class="page-header">
       <h2>회원관리</h2>
    </div>
    <!-- 제목 ------------------------------------------------------------------->
    
    <!-- 검색 : 검색구분(select) 검색어(input) 페이지 사이즈(select)--> 
    <form action="#" class="form-inline text-right">
      <div class="form-group">
        <select class="form-control input-sm" name="searchDiv" id="searchDiv">
          <option value="">전체</option>
          <option value="10">아이디</option>
          <option value="20">이름</option>
          <option value="30">이메일</option>
        </select>
        <input type="text" class="form-control input-sm" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요">
        <select class="form-control input-sm" name="pageSize" id="pageSize">
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="30">30</option>
          <option value="50">50</option>
          <option value="100">100</option>
        </select>
        <input type="button" class="btn btn-primary btn-sm" value="조회" id="doRetrive">          
        <input type="button" class="btn btn-primary btn-sm" value="삭제" id="upDeleteAll">
      </div>
    </form> 
    <!-- 검색 ------------------------------------------------------------------->
    
    <!-- 테이블 목록 -->
    <table class="table table-striped table-bordered table-hover" id="userTable">
      <thead class="bg-primary">
        <tr>
          <th class="text-center col-sm-1 col-md-1 col-lg-1"><input type="checkbox" id="checkAll"></th>
          <th class="text-center col-sm-1 col-md-1 col-lg-1">번호</th>
          <th class="text-center col-sm-2 col-md-2 col-lg-2">아이디</th>
          <th class="text-center col-sm-2 col-md-2 col-lg-2">이름</th>
          <th class="text-center col-sm-2 col-md-2 col-lg-2">등급</th>
          <th class="text-center col-sm-3 col-md-3 col-lg-3">이메일</th>
          <th class="text-center col-sm-1 col-md-1 col-lg-1">등록일</th>
        </tr>
      </thead>
      <tbody>                   
      </tbody>
    </table>
    <!-- 테이블 목록 -------------------------------------------------------------->
    
    <!-- 페이징 -->
    <div class="text-center col-sm-12 col-md-12 col-lg-12">
      <div id="page-selection" class="text-center page"></div>    
    </div>
    <!-- 페이징--- -------------------------------------------------------------->
    <div class="container">  
    <!-- 관리:등록,수정,삭제 --> 
    <!--버튼  -->
    <div class="row text-right ">
        <label for="inputEmail3" class="col-sm-2 col-md-2 col-lg-2 control-label"></label>
        <div class="col-sm-10 col-md-10 col-lg-10">
              <input type="button" class="btn btn-primary btn-sm" value="초기화" id="initBtn" >
              <input type="button" class="btn btn-primary btn-sm" value="등록"  id="add" >
              <input type="button" class="btn btn-primary btn-sm" value="삭제"  id="doDelete">
              <input type="button" class="btn btn-primary btn-sm" value="수정"  id="doUpdate">
        </div>
    </div>
    <!--버튼 -------------------------------------------------------------------->
    
    <!-- 폼 -->
    <form action="#" class="form-horizontal"> 
      <input type="hidden" name="idCheckYN" id="idCheckYN">
        <div class="form-group">
            <label for="uId" class="col-sm-2 col-md-2 col-lg-2 control-label">아이디</label>
            <div class="col-sm-8 col-md-8 col-lg-8">
                  <input type="text" 
                    maxlength="20"
                    class="form-control" id="uId" name="uId" placeholder="아이디를 입력하세요">
            </div>
            <div class="col-sm-2 col-md-2 col-lg-2 text-right">
                 <input type="button" class="btn btn-primary btn-sm" 
               value="아이디 중복" id="idCheck">
        </div>    
        </div>      
         
      <div class="form-group">
        <label for="name" class="col-sm-2 col-md-2 col-lg-2 control-label">이름</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="text" 
          maxlength="20"
          class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
        </div>
      </div>
             
      <div class="form-group">
        <label for="passwd" class="col-sm-2 col-md-2 col-lg-2 control-label">비밀번호</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="password" 
          maxlength="50"
          class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요">
        </div>
      </div>
      
      <div class="form-group">
        <label for="intLevel" class="col-sm-2 col-md-2 col-lg-2 control-label">등급</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <select class="form-control" id="intLevel" name="intLevel">
            <option value="1">BASIC</option>
            <option value="2">SILVER</option>
            <option value="3">GOLD</option>
          </select>
        </div>
      </div>
            
      <div class="form-group">
        <label for="login" class="col-sm-2 col-md-2 col-lg-2 control-label">로그인</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="text" 
          maxlength="8"
          class="form-control numberOnly" id="login" name="login" placeholder="로그인을 입력하세요">
        </div>
      </div>
                  
      <div class="form-group">
        <label for="recommend" class="col-sm-2 col-md-2 col-lg-2 control-label">추천</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="text" 
          maxlength="8"
          class="form-control numberOnly" id="recommend" name="recommend" placeholder="추천을 입력하세요">
        </div>
      </div>
                   
      <div class="form-group">
        <label for="email" class="col-sm-2 col-md-2 col-lg-2 control-label">이메일</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="text"
          maxlength="320"
           class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
        </div>
      </div>
      
      <div class="form-group">
        <label for="regDt" class="col-sm-2 col-md-2 col-lg-2 control-label">등록일</label>
        <div class="col-sm-10 col-md-10 col-lg-10">
          <input type="text" class="form-control" id="regDt" name="regDt" 
          readonly="readonly"
          placeholder="등록일을 입력하세요">
        </div>
      </div>
                                               
    </form>
    <!--폼   -------------------------------------------------------------------->
   </div>   
   <!-- div container ----------------------------------------------------------> 
        
  </div>   
  <!-- div container ---------------------------------------------------------->



</body>

</html>


















