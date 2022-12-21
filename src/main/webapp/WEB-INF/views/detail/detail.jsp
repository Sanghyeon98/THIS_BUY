<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="CP" value="${pageContext.request.contextPath}" /> <!-- ContextPath -->
<c:set var="resources" value="/resources/"/>
<c:set var="CP_RES" value="${CP}${resources}"/>
    
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="pcwk html" >
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${CP_RES }/favicon.ico">
<!-- jquery ui -->

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
    <!-- bootstrap js -->
  <script src="${CP_RES}/js/10-11.js"></script>
  <link rel="stylesheet" href="${CP_RES}/css/10-11.css">

<style> 
      
.side{
  display: flex;
}

.content2{
  position: relative;
  width: 284px;  
}

.side1{
  float: center;
  height: 1000px;
  margin: 0px 150px 50px 150px;
  background-color: pink;
}

.side2{
  display: flex;
  width: 550px;
  margin: 0px auto;
  padding-bottom: 10px;
  float: center;
  justify-content: space-between;   
}

.side{
  display: flex;
  width: 550px;
  margin: 0px auto;
  padding-bottom: 80px;
  float: center;
  justify-content: space-between;
}

.address{
  margin : 5px 20px 5px 20px;
  display: block;
  padding: 0px 10px;
  text-align: center;
  overflow: hidden;
  width: 80%;
  height: 30px;
  border-radius: 3px;
  color: rgb(95, 0, 128);
  background-color: rgb(255, 255, 255);
  border: 1px solid rgb(95, 0, 128);
}

.tag{
  margin-left:150px; 
}

</style>

<title>상품 상세</title>

  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	//console.log('Hello, world!');
    	$("#down").on("click",function(){
    		console.log('#down');
    		if($("#p_num1").val() < 1){
    			console.log("1이상");
    			alert("수량을 확인하세요.");
    		}else{
    			console.log("1이하");
    			console.log("$('#p_num1').val() : " + $("#p_num1").val());
    			basket.changePNum(1);
    		}
    		
    	})
    });  
    
 // 수량변경 - 이벤트 델리게이션으로 이벤트 종류 구분해 처리

    document.querySelectorAll('.updown').forEach(

        function(idx){

            //수량 입력 필드 값 변경

            item.querySelector('input').addEventListener('keyup', function(){

                basket.changePNum(idx+1);

            });

            //수량 증가 화살표 클릭

            item.children[1].addEventListener('click', function(){

                basket.changePNum(idx+1);

            });

            //수량 감소 화살표 클릭

            item.children[2].addEventListener('click', function(){

                basket.changePNum(idx+1);

            });

        }

    );
  
  </script>
</head>
<body>
  <div>  
    <div class="side">
      <div><img alt="이미지" src="${CP_RES }/imgs/spring.png"></div>
    <div class= "content2">
      <div>
        <table>
          <tr>
            <td>상품 번호</td>
            <td><input type="text" value="${vo.itemNo}" readonly="readonly"></td>
          </tr>
          <tr>
            <td>상품명</td>
            <td><input type="text" value="${vo.name}" readonly="readonly"></td>
          </tr>
          <tr>
            <td>상품 가격</td>
            <td><input type="text" value="${vo.price}" readonly="readonly"></td>
          </tr>
          <tr>
            <td>생산지</td>
            <td><input type="text" value="${vo.production}" readonly="readonly"></td>
          </tr>
          <tr>
            <td>수량</td>
             <td class="updown">
                <button id="down" name="down"><i class="fas fa-arrow-alt-circle-up down">-</i></button>
                  <input type="text" name="p_num1" id="p_num1" size="1" class="p_num" value="1">
                <button id="up" name="up"><i class="fas fa-arrow-alt-circle-down up">+</i></button>
             </td>
          </tr>
          <tr>
            <td>중량/용량</td>
            <td><input type="text" value="${vo.weight}" readonly="readonly"></td>
          </tr>
          <tr>
            <td>최종 가격</td>
            <td><div id="finalPrice">${vo.finalPrice}</div></td>
            <%-- <td><input type="text" id="fin alPrice" value="${vo.finalPrice}" readonly="readonly"></td> --%>
          </tr>
        </table>
      </div>

      <div>
        <button class="address"><span class="css-ymwvow e4nu7ef1">장바구니</span></button>
      </div>
      <div>
        <button class="address"><span class="css-ymwvow e4nu7ef1">상품주문</span></button>
      </div>            
    </div>
  </div>
    <div class="side2">
      <p><a href="#">상품상세</a><span class="tag"><a href="#">상품후기</a></span><span class="tag"><a href="#">상품Q&A</a></span></p>
    </div>
     <div class="side1">
     <p>상세 정보를 입력</p>
     </div>  
  </div>
</body>
</html>
</fmt:bundle>