<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>멍코인 내역확인</title>
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
}

.coin-icon {
	width: 60px;
	height: 50px;
	margin-right: 5px;
}

.coin-count {
	font-weight: bold;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
}

/* 페이지네이션 스타일 */
.pagination {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination a {
	padding: 5px 10px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	color: #333;
	text-decoration: none;
}

.pagination a.active {
	background-color: #007bff;
	color: #fff;
	border-color: #007bff;
}
</style>



</head>
<body>
  <!-- 상단바 시작-->
	<table border="solid 1px white" cellpadding="0" cellspacing="0" color="#a0a0a0" align="center" width="1536">
<tr valign="top" height="150" >
<td >
	<div id="header"></div>
</td>
</tr>
<tr valign="middle" bgcolor="#ffffff"><td>
	<!-- 상단바 끝 -->
	<div class="container">
		<!-- 사이드바 부분 -->
		<div class="box-1">
			<!-- 사이드바 항목들 -->
			<div class="sidebar-item" onclick="toggleContent('member-info')">회원정보</div>
			<div class="content" id="member-info">
				<ul>
					<li onclick="goToMyDF()">회원정보</li>
					<li onclick="goToMypage()">회원정보수정</li>
					<li onclick="goToMypageadd()">배송지 관리</li>
				</ul>
			</div>

			<div class="sidebar-item" onclick="toggleContent('dog-coin')">멍코인</div>
			<div class="content" id="dog-coin">
				<ul>
					<li onclick="goToMypagedogcoin_uh()">멍코인 사용내역</li>
					<li onclick="goToMypagedogcoin_fee()">멍코인 충전</li>
				</ul>
			</div>

			<div class="sidebar-item" onclick="toggleContent('order')">주문</div>
			<div class="content" id="order">
				<ul>
					<li onclick="goToMypage_orderviwe()">주문내역보기</li>
				</ul>
			</div>

			<div class="sidebar-item" onclick="toggleContent('my-dog')">강아지</div>
			<div class="content" id="my-dog">
				<ul>
					<li onclick="goToMypage_mydog()">내강아지</li>

				</ul>
			</div>
		</div>

		<!-- 본문 -->
		<div class="main-content">
		<div class="row">
			<div class="col"><h2>현재 멍코인 잔액:${nowbalance}</h2></div>
		</div><!-- row -->
		<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th>날짜</th>
						<th>변동타입</th>
						<th>변동액수</th>
						<th>잔액</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<!-- 예약 내역이 없을 때 -->
					<c:if test="${count==0}">
						<tr>
						    <td align="center">
						        <h2>내역이 존재하지 않습니다.</h2>
						    </td>
						</tr>
					</c:if>
					  <c:forEach var="article" items="${list}">
				            <tr>
				                <td>${article.p_time}</td>
				                <td>${article.p_type}</td>
				                <td>${article.p_amount}</td>
				                <td>${article.p_balance}</td>
				            </tr>
				  </c:forEach>
				  <tr><!-- 링크문자열(이전,현재블럭,다음) -->
					<td align="center" colspan="5">${pagingHtml}</td>
				  </tr>
				</tbody>
			</table>
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
		$("#header").load("/resources/template/head.jsp");
		$("#footer").load("/resources/template/footer.jsp");
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
			window.location.href = "mypage_dogcoin_uh.jsp";
		}
		function goToMypagedogcoin_fee() {
			window.location.href = "mypage_dogcoin_fee.jsp";
		}
		function goToMypage_orderviwe() {
			window.location.href = "mypage_orderviwe.jsp";
		}
		function goToMypage_mydog() {
			window.location.href = "mypage_mydog.jsp";
		}
		function goToMypage_mydogch() {
			window.location.href = "mypage_mydogch.jsp";
		}
		function goToMyDF() {
			window.location.href = "mypagedefault.jsp";
		}
	</script>
	<!-- 본문 스크립트  -->

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>



