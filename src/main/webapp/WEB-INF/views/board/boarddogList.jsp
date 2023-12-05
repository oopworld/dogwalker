<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>리스트</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	 <style>
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
        cursor: pointer;
        font-size: 15px;
        
        
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
    .sidebar-item + .sidebar-item {
        margin-top: 5px;
    }

    /* 본문 스타일링 */
        .main-content {
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 1552px;
            height: 800px;
            opacity: 1;
            border: 0px;
        }
        .jusc{
        justify-content: center;
        width: 1000px;
        }
        /* 버튼 */
        .recharge-button{
        background-color: #E0E0E0; /* 배경색 */
	    color: #000; /* 버튼 텍스트 색상 */
	    padding: 2px 6px; /* 내부 여백으로 크기 조정 */
	    border: none;
	    cursor: pointer;
	    font-size: 16px; /* 폰트 크기 */
        }
      .form-buttons {
	    display: flex;
	    justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
	    margin-top: 10px; /* 필요한 간격 설정 */
	}  
	.recharge-button.form-buttons {
	    align-self: flex-end; /* 버튼을 오른쪽으로 정렬 */
	    margin-top: 10px; /* 버튼 위 간격 설정 */
	    margin-left: auto; /* 왼쪽 여백을 자동으로 설정하여 오른쪽에 배치 */
	}

	 </style>
	
	<script>
	$(function(){
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
	})
	</script>
  </head>
  <body>

       
  	<table border="solid 1px white" cellpadding="0" cellspacing="0" color="#a0a0a0" align="center" width="1536">
<tr valign="top" height="150" >
<td >
	<div id="header"></div>
</td>
</tr>
<tr valign="middle" bgcolor="#ffffff"><td>
 <div class="main-content">
   <div class="container">
           <!-- 사이드바 부분 -->
       <div class="box-1">
            <!-- 사이드바 항목들 -->
            <div class="sidebar-item" onclick="toggleContent('member-info')">공지사항</div>
            <div class="content" id="member-info">
                <ul>
                	<li onclick="location.href='list.do'" >공지사항 게시판</li>
                </ul>
            </div>
            <div class="sidebar-item" onclick="toggleContent('order')">자유게시판</div>
            <div class="content" id="order">
                <ul>
                    <li onclick="location.href='list2.do'"  >자유게시판</li>                   
                </ul>
            </div>

            <div class="sidebar-item" onclick="toggleContent('my-dog')">강아지 자랑게시판</div>
            <div class="content" id="my-dog">
                <ul>
                    <li onclick="location.href='list3.do'" >강아지 자랑게시판</li>
                    
                </ul>
            </div>
        </div>
	<div class="container">
		<div class="jusc">
			<h1 style="text-align:center; margin-bottom:40px;">강아지자랑게시판</h1>
			<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<!--레코드가 없다면  -->
					<c:if test="${count==0}">
						<tr>
						    <td colspan="5" align="center">
						        등록된 게시물이 없습니다.
						    </td>
						</tr>
					</c:if>
					<c:forEach var="article3" items="${list3}">
						<tr>
							<td align="center">${article3.seq3}</td>
							<td><a href="detail3?seq3=${article3.seq3}">${article3.title3}</a></td>
							<td>${article3.writer3}</td>
							<td>${article3.regdate3}</td>
							<td>${article3.hit3}</td>
						</tr>
					</c:forEach>
					<tr><!-- 링크문자열(이전,현재블럭,다음) -->
						<td align="center" colspan="5">${pagingHtml}</td>
					</tr>
					
				</tbody>
			</table>
			<form action="list3" name="search" method="get" onsubmit="return searchCheck()">
					<table align="center" width="200" border="0" cellspacing="0" cellpagging="2">
						<tr>
							<td align="center">
								<select name="keyField">
									<option value="title3">제목</option>
									<option value="writer3">이름</option>
									<option value="content3">내용</option>
									<option value="all3">전체</option>
								</select>
							</td>
							<td>
								<input type="text" size="16" name="keyWord">
							</td>
							<td>
								<input class="recharge-button" type="submit" value="찾기">
							</td>
						
						</tr>
					</table>
				</form>
				<input class="recharge-button form-buttons"  type = "button" value="글쓰기" onclick="location.href='write3'">
		</div>
	  </div>
	</div>
		</td></tr>

<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>					
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <!-- 사이드바 스크립트  -->
   <script>
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
                contentToShow.style.maxHeight = contentToShow.scrollHeight + "px"; /* 내용 열기 */
            } else {
                contentToShow.style.maxHeight = "0px"; /* 내용 닫기 */
            }
        }
        
        /*페이지 넘어가는 함수  */
        function goToMypage() {
       window.location.href = "mypage.jsp"; }
        
        function goToMypageadd(){
         window.location.href = "mypage_add.jsp"; }
        
    </script>
    
  </body>
</html>