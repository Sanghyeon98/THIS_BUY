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
  
  <link rel="stylesheet" href="${CP_RES}/css/admin_product_reg.css">

  <title>제목</title>
  
  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	
    	
    	// 수정 취소 버튼
    	$("#prod_cancel_bt").on("click", function() {
    		moveToMng();
    	});
    	
    	
    	// 상품 수정 버튼
    	$("#prod_save_bt").on("click", function() {
    		console.log("상품수정버튼");
    		
    		console.log("2차 분류  : " + $(".cate02List").val());
    		
    		if('none' == $(".cate01List").val()) {
    			alert("1차 분류를 선택하세요.");
    			return;
    		}
    		
    		if('none' == $(".cate02List").val()) {
    			alert("2차 분류를 선택하세요.");
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#name").val())) {
    			alert("상품명을 입력하세요.");
    			$("#name").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#price").val())) {
    			alert("가격을 입력하세요.");
    			$("#price").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#production").val())) {
    			alert("생산지를 입력하세요.");
    			$("#production").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#weight").val())) {
    			alert("무게를 입력하세요.");
    			$("#weight").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#expired").val())) {
    			alert("유통기한을 입력하세요.");
    			$("#expired").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#quantity").val())) {
    			alert("재고수량을 입력하세요.");
    			$("#quantity").focus();
    			return;
    		}
    		
    		if(eUtil.ISEmpty($("#detail").val())) {
    			alert("상품설명을 입력하세요.");
    			$("#detail").focus();
    			return;
    		}
    		
    		let image = $("#imageName").val();
    		
    		console.log("이미지 : " + image + ".");
    		console.log("lastIndexOf : " + image.lastIndexOf('\\'));
    		console.log("substr : " + image.substr(image.lastIndexOf('\\')+1));
    		
    		let imgPathName = image.substr(image.lastIndexOf('\\')+1);
    		
    		console.log("imageName : " + imgPathName.split('.'));
    		
    		
    		let fileInput = $("#imageName")[0];
    		console.log("fileInput.files.length : " + fileInput.files.length);

    		/*
    		if(fileInput.files.length === 0) { 
          alert("파일을 선택해주세요.");
          return;
        }
    		*/
    		
    		let formData = new FormData();

    		for(let i=0; i < fileInput.files.length; i++) {
          formData.append("image"+i, fileInput.files[i]);
        }
    		
    		console.log("formData : " + formData);
    		
        // proccessData : true -> query string으로 데이터 전달! ex)http://localhost:8089?title-1234
        // contentType : default값은 "application/x-www-form-urlencoded; charset-UTF-8"
        //   --> multipart/form-data로 전송되도록 false 설정!
        $.ajax({ 
           type: "POST",
           url: "${CP}/image/doSave.do",
           processData: false,
           contentType : false,
           async: "true",
           dataType: "html",
           data: formData,
           
           success:function(data) {  // 이미지 등록 성공
        	   console.log("success data : " + data);  // data : ImageVO
               
             let getImageNo = 0;  // 이미지 번호가 0이면 이미지 없음
             
             //if(null != data) {
             if(data.length != 0) { // 등록된 이미지가 있으면 
               console.log("null!!");
               let getImage = JSON.parse(data);
               
               console.log("getImage.imageNo : " + getImage.imageNo);
               console.log("parseInt(getImage.imageNo) : " + parseInt(getImage.imageNo));
               
               getImageNo = getImage.imageNo;
             } else { // 등록된 이미지가 없으면
               console.log("not null!!");
             }
             
             // 제품 추가
             let p_method = "GET";
             let p_url = "/product/doUpdate.do";
             let p_async = true;
             let p_params = {
            	 itemNo : $("#itemNo").val(),
               name : $("#name").val(),
               price : $("#price").val(),
               quantity : $("#quantity").val(), 
               categoryNo : $(".cate02List").val(),
               imageNo : getImageNo,  // 이미지 번호가 0이면 이미지 없음
               production : $("#production").val(),
               weight : $("#weight").val(),
               expired : $("#expired").val(),
               detail : $("#detail").val()
             };
             
             PClass.callAjax(p_method, p_url, p_async, p_params, function(p_data) {
               console.log("in_PClass");
               console.log("p_data : " + p_data);
               
               let parsedJson = JSON.parse(p_data); 
               
               if("1" == parsedJson.msgId) {  // 제품 수정 성공
            	   alert(parsedJson.msgContents);
            	   moveToMng();
               } else {
            	   alert(parsedJson.msgContents);
               }
             
             });
           }
           
        }); // ajax END --------------------------------------------------------
           
    		
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
    
    function moveToReg() {
    	window.location.href= "${CP}/product/moveToReg.do";
    }
    
    function moveToMng() {
    	window.location.href= "${CP}/product/productView.do";
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
          <p>관리자 > 상품 관리 > 상품 수정</p>
        </div>
        <div class="content_body">
          <form action="#" method="post" enctype="multipart/form-data">
            <input type="hidden" name="itemNo" id="itemNo" value="${vo.itemNo}"> 
            <table>
              <tr>
                <td class="table_left"><label>분류선택</label></td>
                <td>
                  <!-- 1차 분류 -->
                  <select class="cate01List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="cateVO2" items="${cate02List}">
                      <c:choose>
                        <c:when test="${vo.categoryNo == cateVO2.categoryNo }">
                          <c:forEach var="cateVO1" items="${cate01List}">
                            <c:choose>
                              <c:when test="${cateVO2.topNo == cateVO1.categoryNo}">
				                        <option selected="selected" value='<c:out value="${cateVO1.categoryNo}"/>'>
				                            <c:out value="${cateVO1.categoryNm}"/>
				                        </option>
                              </c:when>
                              <c:otherwise>
				                        <option value='<c:out value="${cateVO1.categoryNo}"/>'>
				                            <c:out value="${cateVO1.categoryNm}"/>
				                        </option>
                              </c:otherwise>
                            </c:choose>
                          </c:forEach>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </select>
                  
                  <!-- 2차 분류 --> 
                  <select class="cate02List">
                    <option value='none'>==선택==</option>
                    <c:forEach var="cateVO2" items="${cate02List}">
                      <c:choose>
                        <c:when test="${vo.categoryNo == cateVO2.categoryNo }">
                          <c:forEach var="cateVO2_2" items="${cate02List }">
                            <c:choose>
                              <c:when test="${cateVO2.topNo == cateVO2_2.topNo }">
                                <c:choose>
                                  <c:when test="${vo.categoryNo == cateVO2_2.categoryNo}">
						                        <option selected="selected" value='<c:out value="${cateVO2_2.categoryNo}"/>'>
						                            <c:out value="${cateVO2_2.categoryNm}"/>
						                        </option> 
                                  </c:when>
                                  <c:otherwise>
						                        <option value='<c:out value="${cateVO2_2.categoryNo}"/>'>
						                            <c:out value="${cateVO2_2.categoryNm}"/>
						                        </option> 
                                  </c:otherwise>
                                </c:choose>
                              </c:when>
                              <c:otherwise>
                              </c:otherwise>
                            </c:choose>
                          </c:forEach>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="table_left"><label for="name">상품명</label></td>
                <td><input type="text" id="name" name="name" value="<c:out value='${vo.name}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="price">가격</label></td>
                <td><input type="number" id="price" name="price" value="<c:out value='${vo.price}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="production">생산지</label></td>
                <td><input type="text" id="production" name="production" value="<c:out value='${vo.production}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="weight">무게</label></td>
                <td><input type="number" id="weight" name="weight" value="<c:out value='${vo.weight}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="expired">유통기한</label></td>
                <td><input type="text" id="expired" name="expired" value="<c:out value='${vo.expired}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="quantity">재고수량</label></td>
                <td><input type="number" id="quantity" name="quantity" value="<c:out value='${vo.quantity}'></c:out>"></td>
              </tr>
              <tr>
                <td class="table_left"><label for="detail">상품 설명</label></td>
                <td><textarea rows="" cols="" id="detail" name="detail"><c:out value='${vo.detail}'></c:out></textarea></td>
              </tr>
              <tr>
                <td class="table_left"><label for="imageName">이미지</label></td>
                <td>
                  ${imgVO.orgName }<input type="file" id="imageName" name="imageName">
                  <img alt="이미지" src="${CP}${imgVO.viewPath}/${imgVO.saveName}">
                </td>
              </tr>
            </table>
            <div class="reset">
              <input type="reset">
            </div>
          </form>
        </div>
        <div class="bt_area">
          <button id="prod_save_bt">수정</button>
          <button id="prod_cancel_bt">취소</button>
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