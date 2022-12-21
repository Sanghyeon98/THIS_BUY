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
  <!-- 뷰포트(반응형 웹)  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="pcwk html" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <meta charset="UTF-8">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  <!-- jquery ui -->
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_reg.css">

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

  <title>제목</title>
  
  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	
    	
    	// 상품 등록 버튼
    	$("#prod_save_bt").on("click", function() {
    		console.log("상품등록버튼");
    		
    		console.log("2차 분류  : " + $(".cate02List").val());
    		
    		if('none' == $(".cate01List").val()) {
    			alert("1차 분류를 선택하세요.");
    			return;
    		}
    		
    		if('none' == $(".cate02List").val()) {
    			alert("2차 분류를 선택하세요.");
    			return;
    		}
    		
    		let image = $("#imageNo").val();
    		
    		console.log("이미지 : " + image);
    		console.log("lastIndexOf : " + image.lastIndexOf('\\'));
    		console.log("substr : " + image.substr(image.lastIndexOf('\\')+1));
    		
    		let imgPathName = image.substr(image.lastIndexOf('\\')+1);
    		
    		console.log("imageName : " + imgPathName.split('.'));
    		
    		let method = "POST";
    		let url = "/image/doSave.do";
    		let async = true;
    		let params = {
    				
    		};
    		
    		/* let method = "POST";
    		let url = "/product/doSave.do";
    		let async = true;
    		let params = {
    				name : $("#name").val(),
    				price : $("#price").val(),
    				production : $("#production").val(),
    				weight : $("#weight").val(),
    				expired : $("#expired").val(),
 		        quantity : $("#quantity").val(),
 		        detail : $("#detail").val(),
 		        imageNo : $("#imageNo").val()	
    		}; */
    		
    		PClass.callAjax(method, url, async, params, function(data) {
    			console.log(data);
    			
    		});
    		
    		
    	});  // 상품 등록 버튼 END ---------------------------------------------------

    	
    	// 1차 분류 변경 시, 2차 분류 표출
      $(".cate01List").on("change", function() {
        console.log(".cate01List");
        console.log("$(this).val() : " + $(this).val());
        
        // 선택된 1차 분류 value 값
        let currentCateNo = $(this).val();
        
        $(".cate02List").empty();
        
        let cate02ListJson = JSON.parse('${cate02ListJson}');
        console.log("cate02ListJson : " + cate02ListJson);
        
        let htmlData = "";
        console.log("htmlData length : " + htmlData.length);
        
        htmlData += "<option value='none'>==선택==</option>";
        
        $.each(cate02ListJson, function(index, value) {
            // 2차 분류의 topNo와 현재 선택된 1차 분류의 categoryNo가 같으면 (하위 카테고리이면~!)
          if(value.topNo == currentCateNo) {
              htmlData += "<option value='"+value.categoryNo+"'>" + value.categoryNm + "</option>";
            }
          });
        
        /* // 2차 분류에 값이 없으면 '==선택==' 표출
        if(htmlData.length == 0) {
          htmlData += "<option value='none'>==선택==</option>";
        }
         */
        $(".cate02List").append(htmlData);
      });  // 1차 분류 변경 시, 2차 분류 표출 -------------------------------------------
        
    });
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
      <!-- lnb END -------------------------------------------------------->
      <!-- content -->
      <div class="content">
        <div class="content_nav">
          <p>관리자 > 상품 관리 > 상품 등록</p>
        </div>
        <div class="content_body">
          <form action="#">
            <table>
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <select class="cate01List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="vo" items="${cate01List}">
                        <option value='<c:out value="${vo.categoryNo}"/>'>
                            <c:out value="${vo.categoryNm}"/>
                        </option>
                    </c:forEach>
                  </select>
                  <select class="cate02List">
                    <option value='none'>==선택==</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="table_left"><label for="name">상품명</label></td>
                <td><input type="text" id="name" name="name" placeholder="상품명"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="price">가격</label></td>
                <td><input type="text" id="price" name="price" placeholder="가격"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="production">생산지</label></td>
                <td><input type="text" id="production" name="production" placeholder="생산지"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="weight">무게</label></td>
                <td><input type="text" id="weight" name="weight" placeholder="무게"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="expired">유통기한</label></td>
                <td><input type="text" id="expired" name="expired" placeholder="유통기한"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="quantity">재고수량</label></td>
                <td><input type="text" id="quantity" name="quantity" placeholder="재고수량"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="detail">상품 설명</label></td>
                <td><textarea rows="" cols="" id="detail" name="detail"></textarea></td>
              </tr>
              <tr>
                <td class="table_left"><label for="imageNo">이미지</label></td>
                <td><input type="file" id="imageNo" name="imageNo"></div>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="bt_area">
          <button id="prod_save_bt">상품 등록</button>
        </div>
      </div>
      <!-- content END ---------------------------------------------------------->
    </div>
    <!-- container END -->
    <footer>
    </footer>
  </div>
  <!-- wrap END ------------------------------------------------------------->
</body>
</html>
</fmt:bundle>