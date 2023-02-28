<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>  
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon"  href="${CP_RES}/favicon.ico">
  <link rel="stylesheet" href="${CP_RES}/css/signup_address.css">
	<!-- 주소 api --> 
    <script src="${CP_RES}/js/postcode.v2.js"></script>
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
    <title>회원가입</title>
    <script type="text/javascript">
    $(document).ready(function(){   
    
    });
    var addr = ''; // 주소 변수
    var extraAddr = ''; // 참고항목 변수

    function search() {
    	 new daum.Postcode({
    	     oncomplete: function(data) {
    	        
    	         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    	             addr = data.roadAddress;
    	         } else { // 사용자가 지번 주소를 선택했을 경우(J)
    	             addr = data.jibunAddress;
    	         }
    	         document.getElementById("address").value = addr;
    	        insert();
    	     }
    	}).open({popupKey: 'popup1'	});
    }
    var openwin;
    function insert(){
    	if(openwin != null){
    		openwin.close();
        } 
    	        openwin= window.open("${CP}/signup/signup_address.do?address="+addr,"상세주소입력 팝업","width=700, height=500, top=50, left=100");
    	        openwin.focus();
    }
    	var address_final;
    	var address_detail;
    function send(){
    	// 여기서 받은값 ifram 부모창으로 값전달
    	address_final = document.getElementById("address_final").value;
    	address_detail = document.getElementById("address_detail").value;
    	parent.document.getElementById("address_final").value = address_final;
    	parent.document.getElementById("address_detail").value = address_detail;
    	window.parent.addresspick();
    }
   
    </script>
<body>
<a href="#" id="address_search" onclick="parent.openaddress_detail()">aaaa</a>
<input type="text" class="col1 form-control" id="address" name="address" value="" >
 <input type="text"  class="form-control" id="address_final" name="address_final" value=""> 
 <input type="text"  class="form-control" id="address_detail" name="address_detail" value=""> 
</body>
</html>
</fmt:bundle>
