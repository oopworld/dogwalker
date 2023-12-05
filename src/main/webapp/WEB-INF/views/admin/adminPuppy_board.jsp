<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>강아지 산첵 관리자페이지</title>

 

    <!-- Custom styles for this template-->
     <link href="/resources/css/admin.css" rel="stylesheet">
 
       <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
   
   <script>

	
	 $(document).ready(function() {
		$('#category-pills .btn').on('click', function() {
		console.log('Category button clicked'); // 클릭 로깅
		var selectedCate = $(this).data('cate');
		$('#category-pills .btn').removeClass('active');
		$(this).addClass('active');

		// 페이지 번호 및 페이지 크기를 설정하고 선택된 카테고리로 상품 목록을 요청
		
	});
});
</script>

 <style>


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
	 
</head>
		
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="deleteModalLabel">게시물 삭제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        게시물을 삭제하시겠습니까 ?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-danger">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<body id="page-top">
		
					<%@ include file="/WEB-INF/views/admin_template/admin_header.jsp"%>
		<div class="container">
			
				<div class="jusc">			
					<table class="table table-hover">
					<h1 style="text-align:center; margin-bottom:40px;">강아지자랑게시판</h1>
						<thead class="table-light">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회</th>
								<th>삭제</th>
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

							<c:forEach var="article3" items="${noticeList3}">
								<tr>
									<td align="center">${article3.seq3}</td>
									<td><a href="NotView3.do?seq3=${article3.seq3}">${article3.title3}</a></td>
									<td>${article3.writer3}</td>
									<td>${article3.regdate3}</td>
									<td>${article3.hit3}</td>
									<td>
									<input class="recharge-button" type="button" value="삭제" onclick="location.href='delete25?seq3=${article3.seq3}'">
								    
								    </td>
								</tr>
							</c:forEach>
							<tr><!-- 링크문자열(이전,현재블럭,다음) -->
								<td align="center" colspan="5">${pagingHtml}</td>
							</tr>
							
						</tbody>
					</table>
					<form action="list2" name="search" method="get" onsubmit="return searchCheck()">
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
		

				</div>
			  </div>

           
</body>

</html>