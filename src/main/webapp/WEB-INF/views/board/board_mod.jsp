<%--
/**
  Class Name:
  Description:
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 15        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
     //공지사항(10)/자유게시판 구분(20)
     String divValue = request.getParameter("gubun");
     String title = "";
     String gubun1 = "";
     String gubun2 = "";
     if("20".equals(divValue)){
       title = "1:1문의";
       
     }else{
       title = "공지사항";
     }
     
     request.setAttribute("title", title);
     request.setAttribute("divValue", divValue);
%>
<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>  
<link rel="stylesheet" href="${CP_RES}/css/board_mod.css">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   
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
<title>제목</title>
<script >
  $(document).ready(function(){
	  console.log("document.ready");
	  initTableView();
	  
	//목록으로 이동
	    $("#moveToList").on("click", function() {
	      console.log("moveToList");
	      moveToList();
	    });
	
	    $("#moveToListquestion").on("click", function() {
	        console.log("moveToList");
	        window.location.href = "${CP}/board/questionView.do?gubun=20"
	      });
	
	
	  //답글 달기로 이동 
	   $("#answerbutton").on("click", function() {
		      
		      window.location.href = "${CP}/answer/answerView.do?gubun=20&seq="+$("#seq").val();
      });
	
	  //수정
	    $("#doUpdate").on("click", function() {

	     

	      //제목
	      if (eUtil.ISEmpty($("#title").val()) == true) {
	        alert("제목을 입력 하세요.");
	        $("#title").focus();
	        return;
	      }

	      //내용
	      if (eUtil.ISEmpty($("#contents").val()) == true) {
	        alert("내용을 입력 하세요.");
	        $("#contents").focus();
	        return;
	      }

	      if (confirm("수정 하시겠습니까?") == false)
	        return;

	      let method = "GET";
	      let url = "/board/doUpdate.do";
	      let async = true;
	      let params = {
	        gubun : $("#gubun").val(),
	        title : $("#title").val(),
	        contents : $("#contents").val()
	      };

	      PClass.callAjax(method, url, async, params, function(data) {
	        console.log(data);
	        let parsedJson = JSON.parse(data);

	        if ("1" == parsedJson.msgId) {
	          alert(parsedJson.msgContents);
	          moveToList();
	        } else {
	          alert(parsedJson.msgContents);
	        }

	      });

	    });

	    $("#doDelete").on("click", function() {
	      console.log("doDelete");

	      if (confirm("삭제 하시겠습니까?") == false)
	        return;

	      let method = "GET";
	      let url = "/board/doDelete.do";
	      let async = true;
	      let params = {
	        seq : $("#seq").val()
	      };

	      PClass.callAjax(method, url, async, params, function(data) {
	        console.log(data);
	        let parsedJson = JSON.parse(data);
	        if ("1" == parsedJson.msgId) {
	          alert(parsedJson.msgContents);
	          moveToList();
	        } else {
	          alert(parsedJson.msgContents);
	        }

	      });

	      //doDelete  
	    });

  });
  
  function moveToList() {
	    window.location.href = "${CP}/board/boardView.do?gubun="+$("#gubun").val();
	  }
  
  function initTableView() {
	    if ("10" == $("#gubun").val()) {
	      $("#updatebutton").css("display", "");
	      $("#answerbutton").css("display", "none");
	      $("#moveToList").css("display", "");
	      $("#moveToListquestion").css("display", "none");
	    } else if ("20" == $("#gubun").val()) {
	      $("#updatebutton").css("display", "none");
	      $("#answerbutton").css("display", "");
	      $("#moveToList").css("display", "none");
	      $("#moveToListquestion").css("display", "");
	    }
	  }
</script>

</head>
<body>
      <input type="hidden" name="gubun" id="gubun" value="${vo.gubun}">
      <input type="hidden" name="seq" id="seq" value="${vo.seq}">
     <div class="css-mod1">
      <div class="css-mod2">
       <div class="css-mod3">${title} </div>
       <div class="css-mod4">새로운 사항을 확인하세요</div>
      </div>
      
      <div class="css-mod2">
       <div class="css-mod5">
        <div class="css-mod6">
         <div class="css-mod7">제목</div> 
         <input type="text" class="css-mod8" id="title" name="title" 
         value="<c:out value='${vo.title }' />" placeholder="제목을 입력하세요" maxlength="100">  
         
        </div> 
        <div class="css-mod6">
         <div class="css-mod7">작성자</div>
         <input type="text"class="css-mod7" id="regId" name="regId"value="<c:out value='${vo.regId }' />" readonly="readonly"
          placeholder="작성자" maxlength="100">
        </div> 
         <div class="css-mod6">
         <div class="css-mod7">작성일</div>
         <input type="text"
          class="css-mod8" id="regDt" name="regDt"
          value="<c:out value='${vo.regDt }' />" readonly="readonly"
          placeholder="등록일" maxlength="100">   
        </div> 
        <div class="css-mod9">
  
      <%--     <div class="imageYN">
           ${imgVO.orgName }<img alt="이미지" src="${CP}${imgVO.viewPath}/${imgVO.saveName}">
         </div>  --%>


         <div> <textarea class="css-mod8" rows="10" id="contents"
          name="contents"><c:out value="${vo.contents}" /></textarea>
         </div>
        </div>
        
        
        
        <div class="css-mod10">
         <button class ="css-mod11" type="button" width="150" height="42" radius="0" id="moveToList">
          <span class="css-mod11"> 목록</span>
         </button>
         <button class ="css-mod11" type="button" width="150" height="42" radius="0" id="moveToListquestion">
          <span class="css-mod11"> 목록</span>
         </button>
         <div id ="updatebutton">
         <button class ="css-mod11" type="button" width="150" height="42" radius="0" id="doUpdate">
          <span class="css-mod11"> 수정</span>
         </button>
         </div>
         
         <div id ="answerbutton">
         <button class ="css-mod11" type="button" width="150" height="42" radius="0" id="answer" value="${vo.seq}">
          <span class="css-mod11"> 답글</span>
         </button>
         </div>
         
         <button class ="css-mod11" type="button" width="150" height="42" radius="0" id="doDelete">
          <span class="css-mod11"> 삭제</span>
         </button>
        </div>
        
   
       </div>
      </div>
      
      
      
      
      
     </div>
</body>
</html>