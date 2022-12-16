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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="pcwk html" >
  <meta name="keywords" content="html5, css3, javascipt6, jQuery">
  <meta charset="UTF-8">
  <!-- favicon -->
  <link rel="shortcut icon" type="images/x-icon" href="/PC_HTML/favicon.ico">
  <!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- String,number -->
<script src="${CP_RES}/js/eUtil.js"></script>

<!-- paging -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>
<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<style>       


.title {
    width: 1050px;
    margin: 0 auto;
    padding: 50px 0 48px;
    font-weight: 500;
    font-size: 28px;
    line-height: 35px;
    text-align: center;
}
.content2{
background-color:pink;
position: relative;
    width: 284px;
    
}

.cart__list{
    background-color: grey;
    margin: 
}
.side{
    display: flex;
    width: 1050px; 
    margin: 0px auto; 
    padding-bottom: 80px;
    float: center;
    justify-content: space-between;
    }
.checkBox{
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    padding: 18px 10px 16px 2px;
    font-size: 14px;
    line-height: 26px;
    font-weight: 500;
}
.price1{
    margin-left:50px;
    width: 80px;
}
.price2{
    margin-left:65px;
    width: 80px;
}
.price3{
    margin-left:18px;
    width: 80px;
}
.address{
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    height: 36px;
    border-radius: 3px;
    color: rgb(95, 0, 128);
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(95, 0, 128);
}
.amount{
width: 30px;
}
.price{
    margin-left: 100px;
}
.amount_minus{
    margin-left: 150px;
    }
</style>
<title>제목</title>

  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	console.log('Hello, world!');
    	
    	$("#dodelete").on("click",function(e){
    		console.log("dodelete");
        });
    	
    });  
  
  </script>
</head>
<body>
    <div>
    <div>
    <h2 class="title">장바구니</h2>
    <hr>
    </div>
    <div class="side">
   <table class="cart__list">
            <form class="cart__list">
                <thead>
                    <tr class="checkBox">
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">전체선택</button>
                            <button class="cart__list__optionbtn" id="dodelete">선택삭제</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="" alt=""></td>
                        <td><a>포도농장 포도쥬스</a></td>
                        <td class="cart__list__option">
                        <p><span><input class="amount_minus" type="button" value="-"></span>
                        <input  class="amount" type="number" min="1" value="1">
                        <span><input type="button" value="+"></span>
                        </p>
                        </td>
                        <td><span class="price">5,600원</span><br>
                        </td>
                    </tr>
                    <tr class="cart__list__detail">
                       <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="" alt=""></td>
                        <td><a>따끈따끈 군밤</a></td>
                        <td class="cart__list__option">
                        <p><span><input class="amount_minus" type="button" value="-"></span>
                        <input class="amount" type="number" min="1" value="1">
                        <span><input type="button" value="+"></span>
                        </p>
                        </td>
                        <td><span class="price">2,900원</span><br>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="checkBox">
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">전체선택</button>
                            <button class="cart__list__optionbtn">선택삭제</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        
      <div class= "content2">
        <div>
            <div>
                <h3>배송지</h3>
            </div>
            <div>
                <p>배송지를 등록하고</p>
                <p>구매가능한 상품을 확인하세요!</p>
                <button class="address">주소검색</button>
            </div>
        </div>
        <div>
        <div>
            <span>상품금액</span>
            <span><input class="price1" type="text" ></span>
            <span>원</span>
        </div>
        <div>
            <span>배송비</span>
            <span><input class="price2" type="text" ></span>
            <span>원</span>
        </div>
        <div>
            <span>결제예정금액</span>
            <span><input class="price3" type="text" ></span>
            <span>원</span>
        </div>
        </div> 
        
        <div>
            <button class="address"><span class="css-ymwvow e4nu7ef1">주문결제</span></button>
        </div>
                     
    </div>
    </div>
 
       
    </div>
</body>
</html>
</fmt:bundle> 