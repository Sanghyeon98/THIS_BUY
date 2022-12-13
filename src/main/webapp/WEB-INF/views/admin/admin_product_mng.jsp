<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>

<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta name="_csrf" th:content="${_csrf.token}" />
  <meta name="_csrf_header" th:content="${_csrf.headerName}" />
  
  <!-- 뷰포트(반응형 웹)  -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="project product list" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
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
    
  <title>제품 목록</title>
  
  <!-- javascript -->
  <script>
    
    $(document).ready(function(){
    	/*
        // 모든 카테고리
        let cateList = JSON.parse('${allCateJson}');
        console.log("cateList : " + cateList);
        
        let cate1Array = new Array();
        let cate2Array = new Array();
        let cate1Obj = new Object();
        let cate2Obj = new Object();
        let cateSelect1 = $(".cate1"); // 1차 분류
        let cateSelect2 = $(".cate2"); // 2차 분류
        
        makeCateArray(cate1Obj, cate1Array, cateList, 0);
        makeCateArray(cate2Obj, cate2Array, cateList, 4);
        
        console.log("cate1Array : " + cate1Array);
        console.log("cate2Array : " + cate2Array);
        
        for(let i = 0; i < cate1Array.length; i++){
        	console.log("i = " + i);
        	console.log("cate1Array[i].categoryNm = " + cate1Array[i].categoryNm);
            cateSelect1.append("<option value='"+cate1Array[i].categoryNo+"'>" + cate1Array[i].categoryNm + "</option>");
        }
        */
        
        
        $(".cate01List").on("change", function() {
        	console.log(".cate01List");
        	console.log("$(this).val() : " + $(this).val());
        	
        	// 선택된 1차 분류 value 값
        	let currentCateNo = $(this).val();
        	
        	$(".cate02List").empty();
        	
        	let cate02ListJson = JSON.parse('${cate02ListJson}');
        	console.log("cate02ListJson : " + cate02ListJson);
        	
        	let htmlData = "";
        	
        	$.each(cate02ListJson, function(index, value) {
        	    // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
        		if(value.topNo == currentCateNo) {
        	    	htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
        	    } else { 
        	    	htmlData += "<option value='none'>==선택==</option>";
        	    }
        	    
                //console.log("=cate02ListJson.topNo : " + cate02ListJson.topNo);
                //htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
            });
        	
        	/*
       		if(cate02ListJson.topNo == $(this).val()) {
        	//if(null != cate02ListJson && cate02ListJson.length > 0) {
        		console.log("cate02ListJson.topNo : " + cate02ListJson.topNo);
        		
        		$.each(cate02ListJson, function(index, value) {
	        		console.log("=cate02ListJson.topNo : " + cate02ListJson.topNo);
        			htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
        		});
        	} else {
    			htmlData += "<option value='none'>==선택==</option>";
        		
        	}
        	*/
        	
        	$(".cate02List").append(htmlData);
        });
        
        
        // '상품 등록' 버튼 클릭 시, 상품등록 페이지로 이동
        $("#prod_reg_bt").on("click", function() {
            console.log("#prod_reg_bt");
            
            window.location.href = "${CP}/product/moveToReg.do";
        });
      
    });
    
    function makeCateArray(obj, array, cateList, topNo) {
    	for(let i=0; i<cateList.length; i++) {
    		if(topNo == 0) {
	            if(cateList[i].topNo === topNo) {  // 1차 분류이면 
	                cate1Obj = new Object();
	            
	                obj.categoryNo = cateList[i].categoryNo;
	                obj.categoryNm = cateList[i].categoryNm;
	                obj.topNo = cateList[i].topNo;
	                
	                array.push(obj);
	                
	                console.log("-- cateList[i].categoryNm : " + cateList[i].categoryNm);
	            }
    		} else {  // 1차분류가 아닐때 
    			if(cateList[i].topNo === topNo) {  // 2차 분류이면 
                    cate1Obj = new Object();
                
                    obj.categoryNo = cateList[i].categoryNo;
                    obj.categoryNm = cateList[i].categoryNm;
                    obj.topNo = cateList[i].topNo;
                    
                    array.push(obj);
                }
    		}
        }
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
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 상품 관리 목록</p>
        </div>
        <div class="content_body">
          <form action="#">
            <table>
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <select class="cate01List">
                    <c:forEach var="vo" items="${cate01List}">
                        <option value='<c:out value="${vo.categoryNo}"/>'>
                            <c:out value="${vo.categoryNm}"/>
                        </option>
                    </c:forEach>
                  </select>
                  <select class="cate02List">
                    <option>2차 분류</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="table_left"><label>검색어</label></td>
                <td><input type="text" placeholder="상품명"></td>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="search_bt_area">
          <button>검색</button>
        </div>
        <div class="search_option">
          <select id="pageSize" name="pageSize">
            <c:forEach var="vo" items="${PAGE_SIZE }">
                <option value='<c:out value="${vo.detCode}"/>'>
                    <c:out value="${vo.detName }"></c:out>
                </option>
            </c:forEach>
          </select>
        </div>

        <!-- 테이블 목록 -->
        <div class="search_list">
          <form action="#">
            <table id="productTable">
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox"></th>
                  <th width="8%">번호</th>
                  <th width="45%">상품명</th>
                  <th width="15%">판매가</th>
                  <th width="10%">재고</th> 
                  <th width="17%">등록일</th>
                  <th style="display: none;">SEQ</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${list.size() > 0 }">
                    <c:forEach var="vo" items="${list }">
                      <tr>
                        <td class="td_center"><input type="checkbox"></td>
                        <td class="td_center"><c:out value="${vo.num }"/></td>
                        <td><c:out value="${vo.name }"/></td>
                        <td class="td_center"><c:out value="${vo.price }"/></td>
                        <td class="td_center"><c:out value="${vo.weight }"/></td>
                        <td class="td_center"><c:out value="${vo.modDt }"/></td>
                        <td style="display: none;"><c:out value="${vo.itemNo }"/></td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td class="text-center col-sm-12 col-md-12 col-lg-12" colspan="99">
                          No data found
                      </td>
                    </tr>
                  </c:otherwise>
                </c:choose>

              </tbody>
            </table>
          </form>
        </div>
        <!-- 테이블 목록 ----------------------------------------------------------->
        
        <div class="page_area">
          <p>&lt;&lt;&nbsp;&nbsp;&lt;&nbsp;1 2 3 4 5&nbsp;&gt;&nbsp;&nbsp;&gt;</p>
        </div>
        <div class="bottom_bt_area">
          <button>선택상품 삭제</button>
          <button>선택상품 품절처리</button>
          <button id="prod_reg_bt">상품 등록</button>
        </div>
      </div>
      <!-- content END -------------------------------------------------------->
      
    </div>
    <!-- container END -------------------------------------------------------->
    <footer>
    </footer>
  </div>
  <!-- wrap END --------------------------------------------------------------->
</body>
</html>
</fmt:bundle>