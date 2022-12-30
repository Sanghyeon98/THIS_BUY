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

body, header, footer, div, h1, h2, ul, li, p {
  margin: 0;
  padding: 0;
  box-sizing: border-box;  /* padding, border를 width에 포함 */
}

.cart__list__optionbtn{
    background-color: #B8C9DF
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
.content2{
background-color: #B8C9DF;
margin: 0 auto;
}

/* .cart__list{
    background-color: grey;
    margin: 
} */
.side{
    display: flex;
    width: 1050px; 
    margin: 0px auto; 
    padding-bottom: 50px;
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
border: none;
    margin-left:50px;
    width: 50px;
}
.price2{
border: none;
    margin-left:65px;
    width: 50px;
}
.price3{
    border: none;
    margin-left:18px;
    width: 50px;
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
    margin-left: 50px;
    width : 50px
}
.amount_minus{
    margin-left: 30px;
    }
.delivery{
margin-left: 30px;
  width : 50px
}
.finalsumprice{
margin-left: 0px;
  width: 70px;
}
</style>
<title>제목</title>

  <!-- javascript -->
  <script>
    $(document).ready(function(){
    	console.log('Hello, world!');
    	getAll(1);

    	$("#moveOrder").on("click",function(e){
    		console.log("moveOrder");
    		moveOrder("admin");
    		
    	});
    	
    	//선택 삭제--------------------------------------------------------------------
    	$("#dodelete").on("click",function(e){
    		console.log("dodelete");
    		
    		let cartArray = [];
    		
    		 $("input:checkbox[name=chk]").each(function(i, element) {
    	          // 체크된 데이터 uIdArray 추가
    	          if ($(this).is(":checked") == true) {
    	            console.log($(this).val());
    	            cartArray.push($(this).val());
    	          }
    	          
    	    });
    	         
    		let cartString = "";
    		
    		if(cartArray.length > 0) {  // 체크된 데이터가 있으면
    			cartString = cartArray.toString();
    	          console.log("cartString : " + cartString);
    	        } else {
    	          alert("삭제할 자료를 선택하세요.");
    	          return;
    	        }
    		
    		 if(confirm("삭제하시겠습니까?") == false) return;
    		
            
            let method = "POST";
            let url = "/cart/doDelete.do";
            let async = true;
            let params = {
            		cartString : cartString
            };
    		
            PClass.callAjax(method, url, async, params, function(data) {
                alert(data);
            	
            	getAll(1);
            });  
            
        });
    	
    	
    	
    	// 수량 버튼 조작-------------------------------------------------------------------------------
        $(".cart__list>tbody").on("click", ".minus", function(e) {
            
            let quantity = $(this).closest("tr").find(":input[class='quantity']");
            let cartNO = $(this).closest("tr").find(":input[class='cartNO']");
            
            cartNoVal = cartNO.val();
            
            if (parseInt(quantity.val()) <= 1){
                return;
            }
            
            let quan = quantity.val();
            let minusQuantity = --quan;
            
            let method = "POST";
            let url = "/cart/doUpdate.do";
            let async = true;
            let params = {
            		cartNO : cartNoVal,
            		quantity: minusQuantity
            };
            
            PClass.callAjax(method, url, async, params, function(data) {
                console.log(data);
                getAll(1);
            });
            
        });
    	   
        $(".cart__list>tbody").on("click", ".add", function(e) {
            
            let quantity = $(this).closest("tr").find(":input[class='quantity']");
            let cartNO = $(this).closest("tr").find(":input[class='cartNO']");
            
            cartNoVal = cartNO.val();
            
            console.log("cartNO : " + cartNO.val());
            
            
            let quan = quantity.val();
            let addQuantity = ++quan;
            
            let method = "POST";
            let url = "/cart/doUpdate.do";
            let async = true;
            let params = {
                    cartNO : cartNoVal,
                    quantity: addQuantity
            };
            
            PClass.callAjax(method, url, async, params, function(data) {
                console.log(data);
                getAll(1);
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
        
        
        $.each()
        
        
    	
    });  
 
    //getAll-------------------------------------------------------------------------
    function getAll(page) { 
      let method = "POST";
      let url = "/cart/getAll.do";
      let async = true;
      
      let params = {
    		  memberId : $("#UserId").val()
          
      };     //VO안에  memberId 
      
    //${sessetion.infor.uid}
    //id =memberId  => $("#memberId").val(),
    
      PClass.callAjax(method, url, async, params, function(data) {
        console.log(data);
        let parsedJson = JSON.parse(data);
        let htmlData = "";
        
        $(".cart__list>tbody").empty();
        
        let sumprice =0;
        let delivery =2500;
        let finalsumprice = sumprice+2500;
        
        
        if (null != parsedJson && parsedJson.length > 0) {
            
          $.each(parsedJson, function(index, value) {
        	    sumprice += parseInt(value.finalPrice);
        	    
        	    if(sumprice>30000){
        	    delivery=0;
        	    }
        	    
        	    finalsumprice = sumprice+delivery;
        	    
        	  htmlData += "<tr class='cartRow'>";
              htmlData += "    <td><input type='checkbox' name='chk' value='"+value.cartNO+"'></td>";
              htmlData += "    <td><img src='${CP}"+value.viewpath+"/th_"+value.saveName+"' alt='이미지' width=70'></td>";
              htmlData += "    <td><input type='hidden' class='memberId' name='memberId' value='"+value.memberId+"'></td>";
              htmlData += "    <td><input type='hidden' class='cartNO' name='cartNO' value='"+value.cartNO+"'></td>";
              htmlData += "    <td><a href='#' onClick='doSelectOne("+<c:out value='value.itemNO '/>+")'>"+value.name+"</a></td>";
              htmlData += "    <td><input type='button' name='minus' class='minus' value='-'>";
              htmlData += "    <input type='text' class='quantity' name='quantity' value='"+value.quantity+"' size='2'>";
              htmlData += "    <input type='button' name='add' class='add' value='+'></td>";
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
        $(".cart__list>tbody").append(htmlData);
       
        
      });  // PClass.callAjax END
      
    }   //function 
    
    //=============================doSelectOne함수
    function doSelectOne(itemNO){
         let url = "${CP}/detail/view.do";

      url = url + "?itemNo="+itemNO;
      console.log("url : "+url);
      location.href = url;
    }
    //=============================doSelectOne함수 끝  
    function moveOrder(memberId){
         let url = "${CP}/orderSheet/view.do";

      url = url + "?memberid="+memberId;
      console.log("url : "+url);
      location.href = url;
    }
    
    
  </script>
</head>
<body>
    <div>
    <div>
    <h2 class="title">장바구니</h2>
    <hr>
    </div>
    <div class="side">
      
  			 <table class="cart__list table">
                <thead>
                    <tr class="checkBox">
                        <td colspan="6"><input id="checkAll" type="checkbox" >
                            <button class="cart__list__optionbtn btn btn-Navy" id="dodelete">선택삭제</button>
                        </td>
                    </tr>
                </thead>
                <tbody >
                
                </tbody>
        </table>
        <input type="hidden" id="UserId" value="${sessionScope.memberInfo.memberid}" />
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
        <div class="row g-3 align-items-center">
        <div class="col-auto">
            <span>상품금액</span>
            <span><input class="price" id="sumprice" type="text"></span>
            <span>원</span>
        </div>
        <div class="col-auto">
            <span>배송비</span>
            <span><input class="delivery" id="delivery" type="text" ></span>
            <span>원</span>
        </div>
        <div class="col-auto">
            <span class="form-text" >결제예정금액</span>
            <span><input class="finalsumprice" id="finalsumprice" type="text"  ></span>
            <span>원</span>
        </div>
        </div> 
        
        <div>
            <button class="address" id="moveOrder" ><span class="css-ymwvow e4nu7ef1">주문결제</span></button>
        </div>
                     
    </div>
    </div>
 
       
    </div>
</body>
</html>
</fmt:bundle> 