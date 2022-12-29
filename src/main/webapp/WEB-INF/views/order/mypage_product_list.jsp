<%--
/**
  Class Name: mypage_question
  Description: 목록조회
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 13        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"/>
<c:set var="CP_RES" value="${CP}${RES}"/>
<fmt:bundle basename="message">
<%@ include file="/WEB-INF/views/cmn/cache.jsp" %>
<!DOCTYPE html>
<html>

<style>

#body {
  margin: 0 auto;
}

#contentBody {
  width: 800px;
}

.css-luwwab {
  width: 1050px;
}

.css-833hqy {
  float: left;
}

.css-pi3u6r {
    cursor: pointer;
    border-bottom: 1px solid rgb(242, 242, 242);
    padding: 14px 20px 16px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    line-height: 19px;
    letter-spacing: -0.3px;
    font-size: 14px;
    color: rgb(102, 102, 102);
}

.css-833hqy {
    width: 200px;
}

ul {
  /* border: 1px solid ; */
  margin: 10px 90px; /* 바깥여백 */
  padding: 10px; /* 안여백 */
  list-style: none;
}

.txt_center {
  text-align: center; /* 가운데 정렬 */
}

.body {
  display: flex;
}

.title {
  display: flex;
}

.sp_select {
  margin-left: 950px;
}

.sp_font {
  margin-left: 100px;
  font-size: 8px;
}

.sp_head {
  font-size: 24px;
}

.tag {
  margin: 50px 10px 50px;
}

.button {
  height: 500px;
  line-height: 500px;
  text-align: center;
  margin: 0 auto;
}

</style>


<title>mypage</title>

<!-- 뷰포트(반응형 웹)  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project product list">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<!-- favicon -->
<link rel="shortcut icon" type="images/x-icon"
  href="/PC_HTML/favicon.ico">
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


<script>
   $(document).ready(function(){
      console.log('Hello, world!');
      
      //주문내역화면으로 이동
      $("#doRetrieve").on("click",function(){
        console.log('doRetrieve');
 
        doRetrieve(1);

      //doRetrive
      });        
      
   }); // $(document).ready
   
   function doRetrieve(page) {
     console.log('doRetrieve() page'+page);
     console.log('memberId : ' + $("#memberId").val());
     
     let method = "GET";
     let url    = "/order/orderView.do";
     let async  = true;
    
     //전체
     let searchDivValue = $('#searchDiv').val();
     
     if('ALL' == searchDivValue){
       searchDivValue = "";
     }
     
     
     let params  = {
         searchDiv  : $("#orderMonth").val(),
         pageSize : 10,
         //pageSize : $('#pageSize').val(),
         pageNo:page,
         memberId : $("#memberId").val()
     };
        
     PClass.callAjax(method,url,async,params,function(data){
	     console.log(data);
	     let parsedJson = JSON.parse(data);
	     
	     let htmlData = "";
	
	     //기존 데이터 삭제
	     $("#orderTable>tbody").empty();
	     
	     let totalCnt = 0;//총글수  
	     let pageTotal = 0;//총페이지수
	
	     if(null != parsedJson && parsedJson.length  > 0) {
	         
	         totalCnt = parsedJson[0].totalCnt;
	         pageTotal = Math.ceil( totalCnt/$("#pageSize").val());
	         console.log("----------------------------");
	         console.log("-totalCnt:"+totalCnt);
	         console.log("-pageTotal:"+pageTotal);
	         console.log("-page:"+page);
	         console.log("----------------------------");
	
	        $.each(parseJson,function(index,value) {
	       	
	       	 
	        });
	        
       } // if
       
     }); // PClass.callAjax
     
   } //function doRetrieve
   
</script>
</head>
<body>
	<!-- 메뉴 -->
	<div id="body">
	
		<!-- header -->
		<div class="css-luwwab eug5r8l1">
		  <div class="css-833hqy ecbxmj4">
		   <div class="css-1v4whg ecbxmj3">
		         마이컬리
		   </div>
		   <ul class="css-1x9bshx ecbxmj2">  
		     <li class="css-0 ecbxmj1">
		       <a href="#" id="doRetrieve" class="tag css-pi3u6r ecbxmj0">주문 내역
		         <span class="css-e41glx e1x0rfoo0"></span>
		       </a>
		     </li>
		     <li class="css-0 ecbxmj1">
		       <a href="#" id="question" class="tag css-pi3u6r ecbxmj0">상품 문의
		         <span class="css-e41glx e1x0rfoo0"></span>
		       </a>
		     </li>
		     <li class="css-0 ecbxmj1">
		       <a href="#" id="login" class="tag active css-pi3u6r ecbxmj0">개인 정보 수정
		         <span class="css-e41glx e1x0rfoo0"></span>
		       </a>
		     </li>
		   </ul>
		  </div>
		  
		  <div id="contentBody" class="clear">
			  <!-- 개월수 별 주문내역 -->
			  <div class="title css-171zbec eug5r8l0">
			    <h2><span class="sp_head">주문내역 </span></h2>
			    <span class="sp_font"></span>
			    <select class="form-control input-sm" name="orderMonth" id="orderMonth" style="height:20px;">
			      <option value="3">3개월</option>
			      <option value="6">6개월</option>
			      <option value="12">1년</option>
			      <option value="36">3년</option>
			    </select>
			    <hr/>
			  </div>
			  <!-- 개월수 별 주문내역 ---------------------------------------------------------->
			  <!-- 주문상품 목록 -->          
			  <div class="table-responsive"> 
			    <input type="hidden" id="memberId" value="${sessionScope.memberInfo.memberid }"/>
			    <%-- ${sessionScope.memberInfo.memberid }  --%>
			    <%-- ${list }  --%>
			       
			    <table id="orderTable" class="table table-striped table-bordered table-hover">
			      <thead class="bg-primary">
			        <tr> 
			          <th class="text-center col-sm-1 col-md-1 col-lg-1">상품명</th>
			          <th class="text-center col-sm-6 col-md-6 col-lg-8">주문번호</th>
			          <th class="text-center col-sm-2 col-md-2 col-lg-1">결제방법</th>
			          <th class="text-center col-sm-2 col-md-2 col-lg-1">결제금액</th>
			          <th style='display:none;'>SEQ</th>
			        </tr>
			        </thead>
			      <tbody>
			      <c:choose>
			        <c:when test="${list.size() > 0}">
			          <c:forEach var="vo" items="${list }">
			            <tr>
			              <%-- <td class="text-center col-sm-1 col-md-1 col-lg-1"><c:out value="${vo.num}"></c:out></td> --%>
			              <td class="text-left col-sm-6 col-md-6 col-lg-8"><c:out value="${vo.productName}"></c:out></td>
			              <td class="text-center col-sm-2 col-md-2 col-lg-1"><c:out value="${vo.sameOrder}"></c:out></td>
			              <td class="text-center col-sm-2 col-md-2 col-lg-1"><c:out value="${vo.paymentId}"></c:out></td>
			              <td class="text-right col-sm-1 col-md-1 col-lg-1"><c:out value="${vo.price}"></c:out></td>
			              <%-- <td style='display:none;'><c:out value="${vo.seq }"></c:out></td> --%>
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
			  </div>	
		  </div>  
		</div>
	</div>  <!-- div body END --------------------------------------------------->
</body>
</html>
</fmt:bundle>