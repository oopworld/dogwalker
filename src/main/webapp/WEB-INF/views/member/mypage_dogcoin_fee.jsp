<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>멍코인 충전</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
/* 스타일링 */
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 전체 높이 중앙 정렬을 위해 필요한 부분 */
	margin: 0;
}

.container {
	display: flex;
	flex-direction: row;
	align-items: flex-start;
}

.box-1 {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex-basis: 200px; /* 사이드바 고정크기*/
	align-self: stretch;
	width: 50px;
	height: 500px;
	opacity: 1;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: rgba(3, 3, 3, 0.1) 0px 2px 10px;
	border: 0px;
	font-family: Arial, sans-serif;
	overflow: hidden; /* 내용이 숨겨질 때의 스크롤을 숨김 */
	margin-right: 30px; /* 사이드바와 본문 사이의 간격 설정 */
	flex-shrink: 0; /* 크기 고정 */
}

.sidebar-item {
	padding: 35px;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
	font-size: 20px;
}

.content {
	padding: 20px;
	margin: 10px 0;
	display: none;
	transition: max-height 0.3s ease-in-out; /* 내용 높이 애니메이션 효과 추가 */
}

.content ul {
	list-style-type: none;
	padding-left: 0;
}

.content ul li {
	margin-bottom: 10px;
	border-bottom: none;
	padding-bottom: 0;
	cursor: pointer;
}

.active {
	display: block;
	max-height: 1000px; /* 내용이 보이도록 높이를 큰 값으로 설정 */
}

/* 사이드바 항목 높이 조정 */
.sidebar-item {
	height: 30px;
	line-height: 30px;
}

/* 사이드바 항목 간격 조정 */
.sidebar-item+.sidebar-item {
	margin-top: 5px;
}

/* 본문 스타일링 */
.main-content {
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 1000px;
	height: 900px;
	opacity: 1;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: rgba(3, 3, 3, 0.1) 0px 2px 10px;
	border: 0px;
}

.main-content h1 {
	font-size: 36px; /* h1 크기 설정 */
	margin: 20px 0; /* h1과 본문 사이의 간격 설정 */
}

/* 본문내용 스타일 */
.coin-info {
	display: flex;
	align-items: center;
	margin-right: 20px;
}

.coin-icon {
	width: 60px;
	height: 50px;
	margin-right: 5px;
}

.coin-count {
	font-weight: bold;
}

.title {
	text-align: center;
}

.recharge-options {
	display: flex;
	flex-wrap: wrap;
}

.recharge-option {
	width: 100px;
	height: 80px;
	border: 1px solid #ccc;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px;
	cursor: pointer;
}

.recharge-button {
	text-align: center;
	margin-top: 20px;
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>

		<!-- 본문 -->
		  <!-- 상단바 시작-->
	<table border="solid 1px white" cellpadding="0" cellspacing="0" color="#a0a0a0" align="center" width="1536">
<tr valign="top" height="150" >
<td >
	<div id="header"></div>
</td>
</tr>
<tr valign="middle" bgcolor="#ffffff"><td>
	<!-- 상단바 끝 -->
		<div class="main-content">
			<h1>멍코인충전</h1>
			<div class="row">
				<div class="col"><h2>현재 멍코인 잔액:${nowbalance}</h2></div>
			</div><!-- row -->
			<div><p>충전할 금액을 선택해주세요</div>
			<div class="recharge-options">
				<div class="recharge-option">
					<input type="radio" name="recharge" id="recharge1" value="10000">
					<label for="recharge1">10,000원</label>
				</div>
				<div class="recharge-option">
					<input type="radio" name="recharge" id="recharge2" value="20000">
					<label for="recharge2">20,000원</label>
				</div>
				<div class="recharge-option">
					<input type="radio" name="recharge" id="recharge3" value="30000">
					<label for="recharge3">30,000원</label>
				</div>
				<div class="recharge-option">
					<input type="radio" name="recharge" id="recharge4" value="40000">
					<label for="recharge4">40,000원</label>
				</div>
				<div class="recharge-option">
					<input type="radio" name="recharge" id="recharge5" value="50000">
					<label for="recharge5">50,000원</label>
				</div>

				<!-- 다른 금액 옵션도 추가할 수 있습니다. -->
			</div>

			<div class="recharge-button">
				<button type="button" id="charge_kakao">충전하기</button>
			</div>
		</div>
</td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>
		<script>
		$(function(){
			$("#header").load("resources/template/head.jsp");
			$("#footer").load("resources/template/footer.jsp");
		})
		
			function toggleContent(contentId) {
				var contentToShow = document.getElementById(contentId);
				var contents = document.getElementsByClassName('content');
				for (var i = 0; i < contents.length; i++) {
					if (contents[i] !== contentToShow) {
						contents[i].classList.remove('active');
						contents[i].style.maxHeight = "0px"; /* 내용 닫기 */
					}
				}
				contentToShow.classList.toggle('active');
				if (contentToShow.classList.contains('active')) {
					contentToShow.style.maxHeight = contentToShow.scrollHeight
							+ "px"; /* 내용 열기 */
				} else {
					contentToShow.style.maxHeight = "0px"; /* 내용 닫기 */
				}
			}

			/*페이지 넘어가는 함수  */
			function goToMypage() {
				window.location.href = "mypage.jsp";
			}

			function goToMypageadd() {
				window.location.href = "mypage_add.jsp";
			}

			function goToMypagedogcoin_uh() {
				window.location.href = "result";
			}

			function goToMypagedogcoin_fee() {
				window.location.href = "chargeForm";
			}

			function goToMypage_orderviwe() {
				window.location.href = "mypage_orderviwe.jsp";
			}

			function goToMypage_mydog() {
				window.location.href = "mypage_mydog.jsp";
			}

			function goToMyDF() {
				window.location.href = "mypagedefault.jsp";
			}

			/* 결제 */
			$(document).ready(function() {
				$('#charge_kakao').click(function() {
					// 충전 금액 가져오기
					var amount = $('input[name="recharge"]:checked').val();
					if (!amount) {
						alert("충전 금액을 선택해주세요.");
						return;
					}

					// 카카오페이 결제 모듈 호출
					var IMP = window.IMP;
					IMP.init('imp04225027');
					IMP.request_pay({
						pg : 'kakaopay',
						merchant_uid : 'merchant_' + new Date().getTime(),
						name : '멍코인 충전', // 주문명 설정
						amount : amount, // 결제 금액 설정
						buyer_email : 'woo970920@naver.com',
						buyer_name : '구매자이름',
						buyer_tel : '010-1234-5678',
						buyer_addr : '우리집',
						buyer_postcode : '123-456'
					}, function(rsp) {
						console.log(rsp);
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							//updatePoint1.submit();8.15

							// 결제가 성공한 경우 충전 금액을 서버로 전달
							$.ajax({
								type : "POST",
								url : "charge", //충전 금액값을 보낼 url 설정
								dataType : "text",
								data : {
									"id" : "${sessionScope.user_id}", // 현재 로그인한 사용자 아이디
									"amount" : amount
								// 충전할 금액
								},
								success : function(response) {
									console.log(response);
									alert("포인트 충전이 완료되었습니다.");
									if(response=="success"){
										location.href="main";
									}
									},
								error : function(xhr, status, error) {
									console.log(error);
								}
							});

						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
							alert(msg);
						}
					});
				});
			});
		</script>
		<form action="/member/pointCharge1" method="post" name="updatePoint1">
			<input type="hidden" name="id" value="${sessionScope.loginId}">
			<input type="hidden" name="point" value="${recharge}">
			<button class="btn btn-outline-danger" type="button"
				onclick="javascript:location.href='mypage' ">마이페이지로</button>
		</form>
		<!-- 본문 스크립트 끝 -->
	</div>
</body>
</html>
