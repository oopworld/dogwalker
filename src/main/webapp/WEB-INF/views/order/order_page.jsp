<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%
    String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    Object totalPriceObj = request.getAttribute("totalPayment");
%> --%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles2.css" rel="stylesheet" />
<link href="/css/order.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
		    $(function(){
		    	$("#header").load("/resources/template/head.jsp");
				$("#footer").load("/resources/template/footer.jsp");
		    })
		</script>
</head>
<body>
	<!-- Navigation-->
	<tr valign="top" height="150">
		<td>
			<div id="header"></div>
		</td>
	</tr>
	<tr valign="middle" bgcolor="#ffffff">
		<td>
			<!-- 본문-->
			<section class="py-5">
				<div class="container mt-5">
					<h1>주문/결제</h1>
					<form action="/nowOrder" method="post">
						<!-- 구매자정보 -->
						<div class="mb-4">
							<h3>구매자정보</h3>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th scope="row">이름</th>
										<td><input type="text" class="form-control"
											id="buyerName" name="buyerName" value="${memberInfo.name}"
											readonly="readonly"></td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td><input type="email" class="form-control"
											id="buyerEmail" name="buyerEmail" value="${memberInfo.email}"
											readonly="readonly"></td>
									</tr>
									<tr>
										<th scope="row">휴대폰 번호</th>
										<td><input type="tel" class="form-control"
											id="buyerPhone" name="buyerPhone" value="${memberInfo.phone}"
											readonly="readonly"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 받는사람정보 -->
						<div class="mb-4">
							<h3>받는사람정보</h3>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th scope="row">주소</th>
										<td><input type="text" class="form-control"
											id="recipientAddress" name="recipientAddress"
											value="${memberInfo.address}" readonly="readonly"></td>
									</tr>
									<tr>
										<th scope="row">상세주소</th>
										<td><input type="text" class="form-control"
											id="recipientAddressDetail" name="recipientAddressDetail"
											value="${memberInfo.address_detail}" readonly="readonly">
										</td>
									</tr>
									<tr>
										<th scope="row">휴대폰 번호</th>
										<td><input type="tel" class="form-control"
											id="recipientPhone" name="recipientPhone"
											value="${memberInfo.phone}" readonly="readonly"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 결재정보 -->
						<div class="mb-4">
							<h3>결재정보</h3>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th scope="row">상품이름</th>
										<td><input type="text" class="form-control"
											id="productName" name="productName" value="${it_name}"
											readonly="readonly" /></td>
									</tr>
									<tr>
										<th scope="row">총상품가격</th>
										<td><input type="text" class="form-control"
											id="productPrice" name="productPrice" value="${it_price} 원"
											readonly="readonly" /></td>
									</tr>
									<tr>
										<th scope="row">총결제금액</th>
										<td><input type="text" class="form-control"
											id="totalPayment" name="totalPayment" value="${it_price} 원"
											readonly="readonly" /></td>
									</tr>
									<tr>
										<th scope="row">결제방법</th>
										<td>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="paymentMethod" id="bankTransfer" value="bankTransfer">
												<label class="form-check-label" for="bankTransfer">계좌이체</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="paymentMethod" id="pointPayment" value="pointPayment">
												<label class="form-check-label" for="pointPayment">포인트결제</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="paymentMethod" id="cardPayment" value="cardPayment">
												<label class="form-check-label" for="cardPayment">카드결제</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 결재하기 버튼 -->
						<div class="mb-3 row">
							<div class="col-sm-10">
								<button type="button" id="makePayment"
									class="btn btn-outline-primary">결제하기</button>
							</div>
						</div>
					</form>
				</div>
			</section>
		</td>
	</tr>
	<!-- Footer-->
	<tr valign="bottom" height="150" bgcolor="#ffffff">
		<td>
			<div id="footer"></div>
		</td>
	</tr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	    	document.getElementById('makePayment').addEventListener('click', function() {
	    	    // 카드 결제가 선택된 경우
	    	    if(document.getElementById('cardPayment').checked) {
	    	        // 여기에 카드 결제 코드를 넣습니다.
	    	        // 예: 위에서 제공한 코드...
	    	        executePayment();  // 결제 코드를 함수로 감싸서 실행
	    	    } else {
	    	        // 다른 결제 방식을 선택했을 때의 코드 (필요하다면)
	    	    }
	    	});
	
	    	function executePayment() {
	    	    var IMP = window.IMP;
	    	    IMP.init('imp04225027');
	
	    	    // 여기서 form에서 입력한 값들을 사용해서 결제 정보를 설정
	    	    var productName = document.getElementById('productName').value;
	    	    var buyerName = document.getElementById('buyerName').value;
	    	    var buyerEmail = document.getElementById('buyerEmail').value;
	    	    var buyerPhone = document.getElementById('buyerPhone').value;
	    	    var recipientAddress = document.getElementById('recipientAddress').value;
	    	    var totalPayment = document.getElementById('totalPayment').value;
				
	    	    totalPayment = parseInt(totalPayment.replace(/\D/g,''));
	    	    IMP.request_pay({
	    	        pg: 'kakaopay',
	    	        pay_method: 'card',
	    	        merchant_uid: 'merchant_' + new Date().getTime(),
	    	        name: productName,
	    	        amount: totalPayment,
	    	        buyer_email: buyerEmail,
	    	        buyer_name: buyerName,
	    	        buyer_tel: buyerPhone,
	    	        buyer_addr: recipientAddress,
	    	        buyer_postcode: '123-456',
	    	        // 다른 정보들...
	    	    }, function(rsp) {
	    	    	if ( rsp.success ) {
	                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                    jQuery.ajax({
	                        url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                        type: 'POST',
	                        dataType: 'json',
	                        data: {
	                        	"id" : "${sessionScope.user_id}"
	                        	

	                            //기타 필요한 데이터가 있으면 추가 전달
	                        }
	                    }).done(function(data) {
	                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                        if ( everythings_fine ) {
	                            msg = '결제가 완료되었습니다.';
	                            msg += '\n고유ID : ' + rsp.imp_uid;
	                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                            msg += '\n결제 금액 : ' + rsp.paid_amount;
	                            msg += '카드 승인번호 : ' + rsp.apply_num;
	                            
	                            alert(msg);
	                        } else {
	                            //[3] 아직 제대로 결제가 되지 않았습니다.
	                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                        }
	                    });
	                    //성공시 이동할 페이지
	                    location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
	                } else {
	                    msg = '결제에 실패하였습니다.';
	                    msg += '에러내용 : ' + rsp.error_msg;
	                    //실패시 이동할 페이지
	                    location.href="<%=request.getContextPath()%>/order/payFail";
	                    alert(msg);
	                }
	            });
	    	};
		</script>
</body>
</html>