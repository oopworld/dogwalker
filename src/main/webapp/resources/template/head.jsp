<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  contentType="text/html; charset=UTF-8" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
<meta charset="UTF-8">
		<title>header</title>
		</head>
		    <body>
		  <nav class="navbar navbar-expand-lg bg-light pb-3">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/resources/img/logo2.png"
				width="200" alt="..."></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="./matching/WalkingStatusNothing.jsp" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 산책매칭 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/findDog">강아지 찾기</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/rescheck">예약확인</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/MstatusW">진행상황 - 산책자</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/status">진행상황 - 견주</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">채팅</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/list ">공지사항</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/list2">자유게시판</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/list3">강아지자랑게시판</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 쇼핑 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="items/it_list" >상품페이지</a></li>
						</ul></li>
				</ul>
				<ul class="nav justify-content-end">
					<li class="nav-item">
					<c:if test="${sessionScope.id==null}">
					<a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a>
					</c:if>
					<c:if test="${sessionScope.id!=null}">
					<a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
					</c:if>
					</li>
					<li class="nav-item">
					<c:if test="${sessionScope.id!=null}">
					<a class="nav-link" href="${pageContext.request.contextPath}/mypage">${sessionScope.id}</a>
					</c:if>
					</li>
					
				</ul>
				<form class="d-flex" action="${pageContext.request.contextPath}/items/CartView" method="get">
					<button class="btn btn-outline-dark" type="submit">
						<i class=" me-1" ></i> 장바구니 
						<span
							class="badge bg-dark text-white ms-1 rounded-pill" ></span>
					</button>
				</form>
			</div>
		</div>
	</nav>
		    </body>
</body>
</html>