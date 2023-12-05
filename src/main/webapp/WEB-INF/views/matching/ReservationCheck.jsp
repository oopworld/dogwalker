<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>예약확인페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
<script>
	$(function(){
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
	})
</script>
  </head>
  <!-- 자바스크립트 시작 -->
  <script> 
  function btn(sample){  
     alert(sample); 
  } 
 </script> 
  <!-- 자바스크립트 끝 -->
<style>
    ul{
    list-style:none;
    }
    
a{
text-decoration:none;
color:#000;

}

a:hover{
text-decoration:none;
color:#000;
}

.ListBox{
background: #eee;
width: 200px;
}
.ListBox ul{
padding: 0px;
}

.ListBox ul li{
text-align: center;
padding: 3px;
font-size: 15px;
}

.ListLabel{
text-align: center;
border-bottom: 2px solid #000;
font-size: 20px;
padding: 10px;
font-weight: 900;

}

.List{
list-style: none;
}

.List > a{
display:block;
padding: 10px 20px;
text-decoration: none;

}

.List > a:hover{
background: #999;
}

.List > a:hover li {color: #fff;}

.board_wrap_2  {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }

    .board_list_wrap {
        width: calc(100% - 220px);
        
    }
    
    .px-2{
    	margin-right: 40px;
    }
    
    .mt-1{
    	margin-top: 100px;
    }

</style>
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
	<p>
	<div class="container mt-1">
		<!-- 사이드바, 게시판 리스트 묶는 div -->
		<div class="board_wrap_2">
			<div class="ListBox px-2">
				<div>
					<p class="ListLabel">예약 확인</p>
					<ul>
						<li><a href="rescheck?viewType=all">전체 예약</a></li>
						<li><a href="rescheck?viewType=approved">확정 예약</a></li>
						<li><a href="rescheck?viewType=send">보낸 예약신청</a></li>
						<li><a href="rescheck?viewType=receive">받은 예약신청</a></li>
					</ul>
				</div>
			</div>

			<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th>산책자</th>
						<th>강아지</th>
						<th>산책일</th>
						<th>시작시간</th>
						<th>산책시간</th>
						<th>신청타입</th><!-- 내가 받은 예약인지 보낸 예약인지 -->
						<th>상태</th><!-- 신청 => 확정 => 진행중 => 완료 -->
						<th></th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<!-- 예약 내역이 없을 때 -->
					<c:if test="${count==0}">
						<tr>
						    <td align="center">
						        <h2>예약 내역이 존재하지 않습니다.</h2>
						    </td>
						</tr>
					</c:if>
					  <c:forEach var="article" items="${list}"> <!-- 안되면 item.변수명으로 바꿔보기 -->
				            <tr>
				                <td>${article.name}</td>
				                <td>${article.dog_name}</td>
				                <td>${article.m_date}</td>
				                <td>${article.m_start}</td>
				                <td>${article.m_duration}</td>
				                    <c:choose>
				                        <c:when test="${article.m_level == 1 && sessionScope.id != article.id}">
				                        	<td>받은 예약신청</td>
				                        	<td>신청</td>
				                        	<td>
					                        	<button type="button" class="btn btn-primary"><a href="reqagree?m_num=${article.m_num}">확정하기</a></button> <!-- 컨트롤러에서 업데이트 메서드 실행 -->
												<button type="button" class="btn btn-danger"><a href="mreject?m_num=${article.m_num}">거절하기</a></button> <!-- 컨트롤러에서 딜리트 메서드 실행 -->
											<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 1 && sessionScope.id == article.id}">
				                            <td>보낸 예약신청</td>
				                        	<td>신청</td>
				                        	<td>
				                        		<button type="button" class="btn btn-secondary" disabled>승인 대기중</button>
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 2 && sessionScope.id != article.id}">
				                            <td>받은 예약신청</td>
				                        	<td>확정</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>확정됨</button>
												<!-- 모달 시작 -->
												<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">취소하기</button>	
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													 <div class="modal-dialog">
													   <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel">예약취소</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
												      	<p>경고 : 정당한 사유없이 산책을 당일에 취소 할 경우 패널티가 부과 됩니다.</p>
												      	<input class="form-control" type="text" placeholder="산책취소 사유를 적어주세요" aria-label="default input example">
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
												        <button type="button" class="btn btn-danger"><a href="mCancel1?m_num=${article.m_num}">제출 후 취소하기</a></button> <!-- 관리자 페이지로 보내기 -->
												      </div>
												     </div>
												 	</div>
												</div>
												<!-- 모달 끝 -->
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 2 && sessionScope.id == article.id}">
				                            <td>보낸 예약신청</td>
				                        	<td>확정</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>확정됨</button>
												<!-- 모달 시작 -->
												<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">취소하기</button>	
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													 <div class="modal-dialog">
													   <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel">예약취소</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
												      	<p>경고 : 정당한 사유없이 산책을 당일에 취소 할 경우 패널티가 부과 됩니다.</p>
												      	<input class="form-control" type="text" placeholder="산책취소 사유를 적어주세요" aria-label="default input example">
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
												        <button type="button" class="btn btn-danger"><a href="mCancel1?m_num=${article.m_num}" style="text-decoration:none">제출 후 취소하기</a></button> <!-- 관리자페이지로 보내기 -->
												      </div>
												     </div>
												 	</div>
												</div>
												<!-- 모달 끝 -->
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 3 && sessionScope.id != article.id}">
				                            <td>받은 예약신청</td>
				                        	<td>진행중</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>진행중</button>
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 3 && sessionScope.id == article.id}">
				                            <td>보낸 예약신청</td>
				                        	<td>진행중</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>진행중</button>
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 4 && sessionScope.id != article.id}">
				                            <td>받은 예약신청</td>
				                        	<td>완료</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>산책완료</button>
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 4 && sessionScope.id == article.id}">
				                            <td>보낸 예약신청</td>
				                        	<td>완료</td>
				                        	<td>
				                        		<button type="button" class="btn btn-primary" disabled>산책완료</button>
				                        	<td>
				                        </c:when>
				                        <c:when test="${article.m_level == 0 && sessionScope.id != article.id}">
				                            <td>받은 예약신청</td>
				                        	<td>취소</td>
				                        	<td>
				                        		<button type="button" class="btn btn-danger" disabled>취소</button>
				                        	<td>
				                        </c:when>
				                        <c:otherwise>
				                            <td>보낸 예약신청</td>
				                        	<td>취소</td>
				                        	<td>
				                        		<button type="button" class="btn btn-danger" disabled>취소</button>
				                        	<td>
				                        </c:otherwise>
				                    </c:choose>
				            </tr>
				        </c:forEach>
					    <tr><!-- 링크문자열(이전,현재블럭,다음) -->
							<td align="center" colspan="5">${pagingHtml}</td>
						</tr>
				    </tbody>
						
				   </div>
	<!-- 푸터 시작 : 푸터 꺠져서 일단 주석처리 -->
<!-- </td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table> -->
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>