<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<!-- ContextPath -->
<c:set var="resources" value="/resources/" />
<c:set var="CP_RES" value="${CP}${resources}" />

<fmt:bundle basename="message">
	<%@ include file="/WEB-INF/views/cmn/cache.jsp"%>
	<!DOCTYPE html>
	<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="pcwk html">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${CP_RES }/favicon.ico">
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

<style>
.side {
	display: flex;
}

.content2 {
	position: relative;
	width: 284px;
}

.side1 {
	float: center;
	height: 1000px;
	margin: 0px 150px 50px 150px;
	background-color: pink;
}

.side2 {
	display: flex;
	width: 550px;
	margin: 0px auto;
	padding-bottom: 10px;
	float: center;
	justify-content: space-between;
}

.side {
	display: flex;
	width: 550px;
	margin: 0px auto;
	padding-bottom: 80px;
	float: center;
	justify-content: space-between;
}

.address {
	margin: 5px 20px 5px 20px;
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

.tag {
	margin-left: 150px;
}

</style>

<title>상품 상세</title>

<!-- javascript -->
<script>
	$(document).ready(function() {
		console.log('document.ready');

		let price = document.getElementById("price");
		let amount = document.getElementById("amount");
		let minus = document.getElementById("minus");
		let add = document.getElementById("add");
		let sum = document.getElementById("sum");

		sum.value = price.value; // 최초 합계 가격은 제품 가격과 동일

		let amountval = amount.value;
		let sumval = sum.value;
		let priceval = price.value;

		if (minus) { // id가 minus인 태그가 있으면 true
			console.log("minus!");
			minus.addEventListener('click', function() {
				if (amountval > 1) {
					amountval--;
					sumval = amountval * priceval;
					amount.value = amountval; // 수량 변경
					sum.value = sumval; // 최종 가격 변경
				}
			});
		}

		if (add) { // id가 add인 태그가 있으면 true 
			console.log("add!");
			add.addEventListener('click', function() {
				amountval++;
				sumval = amountval * priceval;
				amount.value = amountval; // 수량 변경
				sum.value = sumval; // 최종 가격 변경
			});
		}

		//장바구니 등록
		$("#address").on("click", function() {
			console.log("address");

			if (confirm("장바구니에 등록하시겠습니까?") == false)
				return;

			let method = "POST";
			let url = "/cart/doSave.do";
			let async = true;
			let params = {
				cartNO : 1523, //나중에 뺀다!
				itemNO : $("#itemNO").val(),
				memberId : "admin", //세션으로!
				quantity : $("#amount").val()
			};

			PClass.callAjax(method, url, async, params, function(data) {
				console.log(data);
				//JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 
				//그 결과에서 JavaScript 값이나 객체를 생성합니다.
				let parsedJson = JSON.parse(data);

				if ("1" == parsedJson.msgId) {
					alert(parsedJson.msgContents);
				} else {
					alert(parsedJson.msgContents);
				}

			});

		});

	}); // document.ready END ---------------------------------------------------
</script>
</head>
<body>
	<div>
		<div class="side">
			<div>
				<img alt="이미지" src="${CP_RES }/imgs/spring.png">
			</div>
			<div class="content2">
				<div>
					<table>
						<tr class="1">
							<td>상품 번호</td>
							<td><input type="text" value="${vo.itemNo}"
								readonly="readonly" id="itemNO" name="itemNO"></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" value="${vo.name}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>상품 가격</td>
							<td><input type="text" name="price" id="price"
								value="${vo.price}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>생산지</td>
							<td><input type="text" value="${vo.production}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>중량/용량</td>
							<td><input type="text" value="${vo.weight}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>수량</td>
							<td><input type="button" name="minus" id="minus" value="-">
								<input type="text" name="amount" id="amount" value="1" size="2"
								readonly="readonly"> <input type="button" name="add"
								id="add" value="+"></td>
						</tr>
						<tr>
							<td>최종 가격</td>
							<td><input type="text" name="sum" id="sum" readonly></td>
						</tr>
					</table>
				</div>

				<div>
					<button name="address" id="address" class="address">
						<span class="css-ymwvow e4nu7ef1">장바구니</span>
					</button>
				</div>
			</div>
		</div>
		<div class="side1">
			<p>상세 정보를 입력</p>
		</div>
	</div>
</body>
	</html>
</fmt:bundle>