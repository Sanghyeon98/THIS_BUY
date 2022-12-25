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
<style>

.order_sheet{
    display: block;
    width: 1050px;
    padding: 60px 0px;
    margin: 0px auto;
}

.title {
    width: 1050px;
    margin: 0 auto;
    padding: 50px 0 48px;
    font-weight: 500;
    font-size: 28px;
    line-height: 35px;
    text-align: center;
}

.pay_table{
    display: flex;
}
.pay_table2{
    margin-left: 250px;
    background-color:pink;
    position: relative;
    width: 330px;
    height: 110px;
}

.address{
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 240px;
    height: 56px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: rgb(95, 0, 128);
    border: 0px none;
    margin: 40px auto 30px;
    font-weight: 500;
}
.amount{
width: 30px;
}
.sum_price{
    margin-top: 30px;
}
</style>
<title>제목</title>
  <script src="/PC_HTML/assets/js/jquery-3.6.1.js"></script>
  <script src="/PC_HTML/assets/js/jquery-ui.js"></script>
  <!-- jquery-ui가 jquery 뒤에 와야됨 -->
  
  <!-- javascript -->
  <script>
  $(document).ready(function () {
	 console.log('Hello,world!')

  });
  
  </script>
</head>
<body>

  <div class="order_sheet">
    <div class="title">
        <h2>주문서</h2>
    </div>
    
  
        <div>
        <h3>주문 상품</h3>
            <hr/>
        </div>
        
       <div> 
        <table>
            <form action="">
            <tboby>
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
                </tboby>
            </form>
        </table>
       </div>
        
        <div>
        <h3>주문자 정보</h3>
            <hr/>
        </div>
        
        <div>
            <table>
                <form action="">
                    <tr>
                       <td>보내는분</td>
                       <td><input type= text></td>
                    </tr>
                    <tr>
                       <td>휴대폰</td>
                       <td><input type= text></td>
                    </tr>
                    <tr>
                       <td>이메일</td>
                       <td><input type= text></td>
                    </tr>
                </form>
            </table>
        </div>
        
        <div>
        <h3>배송 정보</h3>
            <hr/>
        </div>
        
        <div>
            <table>
                <form action="">
                    <tr>
                       <td>배송지</td>
                       <td><input type= text>
                        <span><button>배송지변경</button></span>
                       </td>
                    </tr>
                    <tr>
                       <td>배송 메모</td>
                       <td><input type= text></td>
                    </tr>
                </form>
            </table>
        </div>
        
        <div>
        <h3>배송 정보</h3>
            <hr/>
        </div>
        
        <div class="pay_table">
            <table>
                <form action="">
                    <tr>
                       <td>결제수단 선택</td>
                       <td><button>신용카드</button>
                        <span><button>간편결제</button></span>
                        <span><button>휴대폰</button></span>
                       </td>
                    </tr>
                    <tr>
                       <td></td>
                       <td><button>네이버페이</button>
                        <span><button>카카오페이</button></span>
                        </td>
                    </tr>
                </form>
            </table>
            
            <table class="pay_table2">
                <form action="">
                    <tr>
                       <td>상품금액</td>
                       <td><input class="price1" type="text" ></span>
                            <span>원</span>
                       </td>
                    </tr>
                    <tr>
                       <td>배송비</td>
                       <td><input class="price1" type="text" ></span>
                            <span>원</span>
                        </td>
                    </tr>
                    <tr class="sum_price">
                       <td>결제예정금액</td>
                       <td><input class="price1" type="text" ></span>
                            <span>원</span>
                        </td>
                    </tr>
                </form>
            </table>
            
        </div>
        
        <div>
        <h3>개인정보 수집/제공</h3>
            <hr/>
        </div>
        <div>
            <table>
                <form action="">
                    <tr>
                       <th><input type="checkbox"></th>
                       <th> 결제 진행 필수 전체동의
                       </th>
                    </tr>
                    <tr>
                       <td><input type="checkbox"></td>
                       <td>(필수)개인정보 수집*이용 및처리동의</td>
                    </tr>
                    <tr>
                       <td><input type="checkbox"></td>
                       <td>(필수)개인정보 제 3자 제공 동의</td>
                    </tr>
                    <tr>
                       <td><input type="checkbox"></td>
                       <td>(필수)전자지급 결제 대행 서비스 이용 약관 동의</td>
                    </tr>
                </form>
            </table>
        </div>
        
        <div>
            <button class="address"><span class="css-ymwvow e4nu7ef1">결제하기</span></button>
        </div>
   </div>
</body>
</html>
</fmt:bundle>