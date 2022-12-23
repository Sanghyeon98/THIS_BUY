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
    	getAll(1);
    	

    	
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
        $(".cart__list>tbody").on("click", "#minus", function(e) {
            console.log("minus");
            
            let quantity = $(this).closest("tr").find(":input[class='quantity']");
            let cartNo = $(this).closest("tr").find(":input[class='cartNO']");
            
            if (parseInt($("#quantity").val()) <= 1){
                return;
            }
            
            let method = "POST";
            let url = "/cart/doUpdate.do";
            let async = true;
            let params = {
            		cartNO : $("#cartNO").val(),
            		quantity: ($("#quantity").val()-1)
            };
            
            PClass.callAjax(method, url, async, params, function(data) {
                console.log(data);
                getAll(1);
            });
            
        });
    	   
        $(".cart__list>tbody").on("click", "#add", function(e) {
            console.log("add");
            
            let quantity = $(this).closest("tr").find(":input[class='quantity']");
            let cartNo = $(this).closest("tr").find(":input[class='cartNO']");
            
            
            let method = "POST";
            let url = "/cart/doUpdate.do";
            let async = true;
            let params = {
                    cartNO : $("#cartNO").val(),
                    quantity: ($("#quantity").val()+1)
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
    	
    });  
 
    //getAll-------------------------------------------------------------------------
    function getAll(page) {
      let method = "POST";
      let url = "/cart/getAll.do";
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
        
        $(".cart__list>tbody").empty();
        
        if (null != parsedJson && parsedJson.length > 0) {
            
          $.each(parsedJson, function(index, value) {
              htmlData += "<tr>";
              htmlData += "    <td><input type='checkbox' name='chk' value="+value.cartNO+"></td>";
              htmlData += "    <td><input type='hidden' class='memberId' id='memberId' name='memberId' value="+value.memberId+"></td>";
              htmlData += "    <td><input type='hidden' class='cartNO' name='cartNO' id='cartNO' value="+value.cartNO+"></td>";
              htmlData += "    <td><img src='' alt=''></td>";
              htmlData += "    <td><a>"+value.name+"</a></td>";
              htmlData += "    <td><input type='button' name='minus' id='minus' value='-'>";
              htmlData += "    <input type='text' class='quantity' name='quantity' id='quantity' value="+value.quantity+" size='2'>";
              htmlData += "    <td><input type='button' name='add' id='add' value='+'>";
              htmlData += "    <td>"+value.price+"원</td>";
              htmlData += "</tr>";
          });
        } else {
            htmlData += "<tr>";
            htmlData += "  <td class='td_center' colspan='99'>";
            htmlData += "   No data found ";
            htmlData += "  </td>";
            htmlData += "</tr>";
        }
        
        // 데이터 출력
        $(".cart__list>tbody").append(htmlData);
       
        
      });  // PClass.callAjax END
      
    }   //function 
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
                <thead>
                    <tr class="checkBox">
                        <td colspan="3"><input id="checkAll" type="checkbox" >
                            <button class="cart__list__optionbtn" id="dodelete">선택삭제</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
                <tbody >
                    <c:choose>
                  <c:when test="${list.size() > 0 }">
                    <c:forEach var="vo" items="${list }">
                      <tr>
                        <td class="td_center"><input type="checkbox" name="chk" value="${vo.itemNo }"></td>
                        <td class="td_center"><c:out value="${vo.imageNo}"/></td>
                        <td><c:out value="${vo.name}"/></td>
                        <td class="cart__list__option">
                        <p><span><input class="amount_minus" type="button" value="-"></span>
                        <input class="amount" type="number" min="1" value="${vo.quantity}">
                        <span><input type="button" value="+"></span>
                        </p>
                        </td>
                        <td style="display: none;"><c:out value="${vo.price}"/></td>
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
            <span><input class="price" type="text" ></span>
            <span>원</span>
        </div>
        <div>
            <span>배송비</span>
            <span><input class="price2" type="text" ></span>
            <span>원</span>
        </div>
        <div>
            <span>결제예정금액</span>
            <span><input class="sum" type="text" ></span>
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