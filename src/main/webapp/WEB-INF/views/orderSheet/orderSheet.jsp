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
    background-color:#B8C9DF;
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
    color: rgb(0, 0, 0);
    background-color: #B8C9DF;
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

<!-- 토스페이먼츠 API 테스트 -->
<script src="https://js.tosspayments.com/v1/payment"></script>
  
<title>제목</title>
  <!-- jquery-ui가 jquery 뒤에 와야됨 -->
  
  <!-- javascript -->
  <script>
  $(document).ready(function () {
	 console.log('Hello,world!')
	 cartgetAll(1);
	 
	 
	 // 결제하기
	 $(".address").on("click", function() {
		console.log("결제하기"); 
		console.log("최종결제금액 : " + $("#finalsumprice").val());
		
		let finalSum = $("#finalsumprice").val();
		let orderName= $("#name").val();
				
		var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
		var tossPayments = TossPayments(clientKey);
		
		var button = document.getElementById('payment-button'); // 결제하기 버튼
		
		
		  tossPayments.requestPayment('카드', {
		    amount: finalSum,
		    orderId: 'qYGNIWZ68TzK3CAOBSzAw',
		    orderName: '토스 티셔츠 외 2건',
		    customerName: orderName,
		    successUrl: 'http://localhost:8089/success',
		    failUrl: 'http://localhost:8089/fail',
		  });
		
		
		
		
	 });
	 
	 
	 
	//체크버튼-----------------------------------------------------------
	  $("#checkAll").on("click", function() {
	      console.log("#checkAll");
	      //chk
	      //전체 체크
	      if ($("#checkAll").is(":checked") == true) {
	        $("input[name=chk]").prop("checked", true);
	        //체크 해제  
	      } else {
	        $("input[name=chk]").prop("checked", false);
	      }
	    });
	 
	 
  });
  
  
  function cartgetAll(page) {
      let method = "POST";
      let url = "/orderSheet/cartgetAll.do";
      let async = true;
      
      let params = {
              memberId : "admin"
          
      };     //VO안에  memberId 
      
    //${sessetion.infor.uid}
    //id =memberId  => $("#memberId").val(),
    
    
    
      PClass.callAjax(method, url, async, params, function(data) {
        console.log(data);
        let parsedJson = JSON.parse(data);
        let htmlData = "";
    
        
        let sumprice =0;
        let delivery =2500;
        let finalsumprice = sumprice+2500;
        
        
        $(".cart__list__detail>tbody").empty();
        
        if (null != parsedJson && parsedJson.length > 0) {
            
          $.each(parsedJson, function(index, value) {
        	  sumprice += parseInt(value.finalPrice);
              
              if(sumprice>30000){
              delivery=0;
              }
              
              finalsumprice = sumprice+delivery;
        	  
              htmlData += "<tr>";
              htmlData += "    <td><input type='hidden' class='memberId' id='memberId' name='memberId' value="+value.memberId+"></td>";
              htmlData += "    <td><input type='hidden' class='cartNO' name='cartNO' id='cartNO' value="+value.cartNO+"></td>";
              htmlData += "    <td><img src='${CP}"+value.viewpath+"/th_"+value.saveName+"' alt='이미지' width='80'></td>";
              htmlData += "    <td><a>"+value.name+"</a></td>";
              htmlData += "    <td><input type='text' class='quantity' name='quantity' id='quantity' value="+value.quantity+" readonly='readonly' size='2'>개<td>";
              htmlData += "    <td>"+value.finalPrice+"원</td>";
              htmlData += "</tr>";
          });
        } else {
            htmlData += "<tr>";
            htmlData += "  <td class='td_center' colspan='99'>";
            htmlData += "   No data found ";
            htmlData += "  </td>";
            htmlData += "</tr>";
        }
        
        $("#sumprice").val(sumprice);
        $("#delivery").val(delivery);
        $("#finalsumprice").val(finalsumprice);
        // 데이터 출력
        $(".cart__list__detail>tbody").append(htmlData);
       
        
      });  // PClass.callAjax END
      
    }   //function 
  
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
        <table class="cart__list__detail">
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
        </table>
       </div>
        
     
        <div>
        <h3>주문자 정보</h3>
            <hr/>
        </div>
        
        <div>
            <table>
                    <tr>
                       <td>보내는분</td>
                       <td><input type= text id="name" value="${vo.name}"></td>
                    </tr>
                    <tr>
                       <td>휴대폰</td>
                       <td><input type= text value="${vo.phone}"></td>
                    </tr>
                    <tr>
                       <td>이메일</td>
                       <td><input type= text value="${vo.email}"></td>
                    </tr>
            </table>
        </div>
        
        <div>
        <h3>배송 정보</h3>
            <hr/>
        </div>
        
        <div>
            <table>
                    <tr>
                       <td>배송지</td>
                       <td><input type= text value="${vo.address}"></td>
                        <span><button>배송지변경</button></span>
                       </td>
                    </tr>
                    <tr>
                       <td>배송 메모</td>
                       <td><input type= text></td>
                    </tr>
            </table>
        </div>
        
        <div>
        <h3>배송 정보</h3>
            <hr/>
        </div>
        
        <div class="pay_table">
            <table>
                    <tr>
                       <td>결제수단 선택</td>
                       <td><button><i class="bi bi-cart2"></i>신용카드</button>
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
            </table>
            
            <table class="pay_table2">
                    <tr>
                       <td>상품금액</td>
                       <td><input class="sumprice" id="sumprice" type="text" ></span>
                            <span>원</span>
                       </td>
                    </tr>
                    <tr>
                       <td>배송비</td>
                       <td><input class="delivery" id="delivery" type="text" ></span>
                            <span>원</span>
                        </td>
                    </tr>
                    <tr class="sum_price">
                       <td>결제예정금액</td>
                       <td><input class="finalsumprice" id="finalsumprice" type="text" ></span>
                            <span>원</span>
                        </td>
                    </tr>
            </table>
            
        </div>
        
        <div>
        <h3>개인정보 수집/제공</h3>
            <hr/>
        </div>
        <div>
            <table>
                    <tr>
                       <th><input type="checkbox" id="checkAll"></th>
                       <th> 결제 진행 필수 전체동의
                       </th>
                    </tr>
                    <tr>
                       <td><input type="checkbox" name="chk"></td>
                       <td>(필수)개인정보 수집*이용 및처리동의</td>
                    </tr>
                    <tr>
                       <td><input type="checkbox" name="chk"></td>
                       <td>(필수)개인정보 제 3자 제공 동의</td>
                    </tr>
                    <tr>
                       <td><input type="checkbox" name="chk"></td>
                       <td>(필수)전자지급 결제 대행 서비스 이용 약관 동의</td>
                    </tr>
            </table>
        </div>
        
        <div>
            <button class="address"><span class="css-ymwvow e4nu7ef1">결제하기</span></button>
        </div>
   </div>
</body>
</html>
</fmt:bundle>