<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- 뷰포트(반응형 웹)  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="pcwk html" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <meta charset="UTF-8">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_category_mng.css">

  <title>카테고리 관리</title>
  
  <!-- javascript --> 
  <script>
    $(document).ready(function() {
    	
    	// 삭제 버튼
    	$("#cate_del_bt").on("click", function() {
    		console.log("cate_del_bt");
    		
    		let currCateNo = $("#currCateNo").val();
    		
    		console.log("currCateNo : " + currCateNo);
    		
    		let method = "GET";
        let url = "/category/doDelete.do";
        let async = true;
        let params = {
            categoryNo : currCateNo
        };
        
        
        PClass.callAjax(method, url, async, params, function(data) {
          console.log("data:" + data);
          let parsedJson = JSON.parse(data);
          
          if("0" != parsedJson.msgId) {  // 제품 삭제 성공
            alert(parsedJson.msgContents);
            moveToCate();
          } else {
            alert(parsedJson.msgContents);
          }
        });
        
    	});
    	
    	// 수정 버튼
    	$("#cate_mod_bt").on("click", function() {
    		
    		if($("#catelist").val() == 'none') {
    			alert("분류를 선택하세요.");
    			return
    		}
    		
    		if(eUtil.ISEmpty($("#categoryNm").val())) {
    			alert("카테고리명을 입력하세요.");
    			$("#categoryNm").focus();
    			return;
    		}
    		
    		let currCateNo = $("#currCateNo").val();
    		let top = $("select[name=catelist]").val();
    		
    		let method = "GET";
        let url = "/category/doUpdate.do";
        let async = true;
        let params = {
            categoryNo : currCateNo,
            topNo : top,
            categoryNm : $("#categoryNm").val()
            	
        };
        
        PClass.callAjax(method, url, async, params, function(data) {
        	console.log("data:" + data);
          let parsedJson = JSON.parse(data);
          
          if("0" != parsedJson.msgId) {  // 제품 수정 성공
            alert(parsedJson.msgContents);
            moveToCate();
          } else {
            alert(parsedJson.msgContents);
          }
        });
    		
    	});
    	
    	// 취소 버튼
    	$("#cate_can_bt").on("click", function() {
    	 	moveToCate();
    	});
    	
    	// 카테고리 데이터 클릭
    	$(".hide").on("click", "li", function() {
    		//console.log("클릭 카테고리 no : " + $(this).attr('id'));
    		console.log("클릭 카테고리 no : " + $(this).attr('id'));
    		
    		let cateNo = $(this).attr('id');  // 2차분류 본인 카테고리 번호
    		let topNo = $(this).val();  // 상위 카테고리 번호
    		
    		let method = "GET";
        let url = "/category/doSelectOne.do";
        let async = true;
        let params = {
        		categoryNo : cateNo
        };
        
        PClass.callAjax(method, url, async, params, function(data) {
        	console.log("data:" + data);
        	let parsedJson = JSON.parse(data);
        	
        	$("#catelist").val(topNo).prop("selected", true);
          $("#categoryNm").val(parsedJson.categoryNm);
          $("#currCateNo").val(parsedJson.categoryNo);
          
        	
        	$("#cate_save_bt").hide();
        	$("#cate_mod_bt").show();
        	$("#cate_del_bt").show();
        	$("#cate_can_bt").show();
        });
        
    	});
    	
    	// 등록 버튼
    	$("#cate_save_bt").on("click", function() {
    		console.log("cate_save_bt");
    		
    		console.log("1차분류 카테고리 번호 : " + $("#catelist").val());
    		console.log("카테고리 이름 : " + $("#categoryNm").val());
    		
    		let method = "GET";
    		let url = "/category/doSave.do";
    		let async = true;
    		let params = {
    				categoryNm : $("#categoryNm").val(),
    				topNo : $("#catelist").val()
    		};
    		
    		
    		PClass.callAjax(method, url, async, params, function(data) {
    			console.log("callAjax");
    			
    			let parsedJson = JSON.parse(data);
    			
    			 if("0" != parsedJson.msgId) {  // 제품 등록 성공
             alert(parsedJson.msgContents);
             moveToCate();
           } else {
             alert(parsedJson.msgContents);
           }
    		});
    		
    	});
       
      // 1차 분류 클릭 이벤트 (누르면 2차분류 보이도록_토글)
      $(".cate1").on("click", function() { 
        console.log("click!!"); 
        console.log("$('.cate2').val() : " + $(".cate2").val());
        console.log("$(this).val() : " + $(this).val()); 
        
        
        $(this).next("ul").toggle("hide");
        
      });
      
      
    }); // document.ready END --------------------------------------------------
    
    function moveToCate() {
      window.location.href= "${CP}/category/categoryView.do";
    }
  </script>
</head>

<body>
  <!-- wrap -->
  <div id="wrap">
    <header>
    </header>
    <!-- container -->
    <div id="container" class="clear">
      <!-- lnb -->
      <div class="lnb">
        <jsp:include page="/WEB-INF/views/cmn/admin_left_menu.jsp"></jsp:include>
      </div>
      <!-- lnb END ------------------------------------------------------------>
      
      <!-- content --> 
      <div class="content">
      
        <!-- content_nav -->
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 카테고리 관리</p>
        </div>
        <!-- content_nav ------------------------------------------------------>
        
        
        <!-- content_body --> 
        <div class="content_body">  
          <div class="cate_list" id="cate_list"> 
            <ul>
	            <c:choose>
	              <c:when test="${list.size() > 0 }">
	
	                <c:forEach var="vo" items="${list }">
	                  <c:choose>
	                    <c:when test="${vo.topNo == 0 }">  <!-- 1차분류 -->
	                      <li name="cate1" class="cate1" value="${vo.categoryNo}">
	                        <c:out value="${vo.categoryNm }"/>
	                      </li>
	                      <ul class="hide">
	                      <c:forEach var="vo2" items="${list }">  <!-- 2차분류 -->
	                        <c:choose>
		                         <c:when test="${vo2.topNo != 0 && vo2.topNo == vo.categoryNo}">
		                           <li name="cate2" class="cate2 " value="${vo2.topNo}" id="${vo2.categoryNo}"> 
		                             └<c:out value="${vo2.categoryNm }"/>
		                           </li>
		                         </c:when>
	                        </c:choose>
	                      </c:forEach>
	                      </ul>
	                    </c:when>
	                  </c:choose>
	                  
	                </c:forEach>
	              </c:when>
	              <c:otherwise>
	                <li>No Categories.</li>
	              </c:otherwise>
	            </c:choose>
            </ul>
          </div>
          <div class="cate_create clear">
            <p>분류 생성/수정/삭제</p>
            <form action="#">
	            <div>
	              <table>
	                <input type="hidden" id="currCateNo"> 
	                <tr>
	                  <td>분류</td>
	                  <td>
	                    <select id="catelist" name="catelist">
	                      <option value="none">==선택==</option>
	                      <c:forEach var="vo" items="${list }">
	                        <c:choose>
	                          <c:when test="${vo.topNo == 0 }">
	                            <option value="${vo.categoryNo}"><c:out value="${vo.categoryNm}"/></option>
	                          </c:when>
	                        </c:choose>
	                      </c:forEach>
	                    </select>
	                  </td>
	                </tr>
	                <tr>
	                  <td>이름</td>
	                  <td>
	                    <input type="text" id="categoryNm" name="categoryNm" placeholder="카테고리명">
	                  </td>
	                </tr>
	              </table>
	            </div>
	            <div>
	              <input type="reset">
	            </div>
            </form>
            <div> 
              <button id="cate_save_bt">등록</button>
              <button id="cate_mod_bt" style="display: none;">수정</button>
              <button id="cate_del_bt" style="display: none;">삭제</button>
              <button id="cate_can_bt" style="display: none;">취소</button>
            </div>
          </div>
        </div>
        <!-- content_body ----------------------------------------------------->
        
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -->
    
    <footer>
    </footer>
  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>