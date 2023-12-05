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
	$(function(){
		$("#header").load("/resources/template/head.jsp");
		$("#footer").load("/resources/template/footer.jsp");
	})
	
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
       /* 버튼  */
        .recharge-button{
        background-color: #E0E0E0; /* 배경색 */
	    color: #000; /* 버튼 텍스트 색상 */
	    padding: 2px 6px; /* 내부 여백으로 크기 조정 */
	    border: none;
	    cursor: pointer;
	    font-size: 16px; /* 폰트 크기 */
        }
        /* form */
	.form-group {
	    display: flex;
	    align-items: center;
	    margin-bottom: 10px; /* 항목 사이 간격 설정 */
	}
	
	.form-group label {
	    flex-basis: 100px; /* 레이블의 너비 설정 */
	    margin-right: 10px; /* 레이블과 입력 필드 사이 간격 설정 */
	}
	
	.form-buttons {
	    margin-top: 10px; /* 버튼과 항목 위 간격 설정 */
	}

	 </style>
	 
</head>

<!-- Modal -->
		<%@ include file="/WEB-INF/views/admin_template/admin_header.jsp"%>
		
		<div class="modal fade" id="archiveModal" tabindex="-1" aria-labelledby="archiveModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="archiveModalLabel">게시물 숨기기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        게시물을 숨기시겠습니까 ?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-danger">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
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
		
			 <div class="main-content">
	<div class="main-content">
	<div class="container">
		<table width="800px" height="150px" border="0" cellspacing="0" cellpagging="0" align="center">
			<tr>
				<td colspan="2"><h1>스프링 게시판 </h1></td>	
			</tr>
			</table>
			<div class="tablst">
			<table  width="800px" height="300px" border="0" cellspacing="0" cellpagging="0" align="center">
			<tr>
				<td>번호</td>		
				<td>${board2.seq2}</td>		
			</tr>
			<tr>
				<td>글쓴이</td>
				<td>${board2.writer2}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${board2.title2}</td>
			</tr>
			<tr><!--  선긋기-->
				<td colspan="2">
					<hr size="1" width="100%" noshade>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${board2.content2}</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr size="1" width="100%" noshade>
				</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board2.hit2}</td>
			</tr>
			<tr>
				<td>등록날짜</td>
				<td>${board2.regdate2}</td>
			</tr>
			<tr><!--글목록보기에 출력  -->
				<td>첨부파일</td>
				<td><a href="file2?filename=${board2.filename2}">${board2.filename2 }</a></td>
			</tr>
			</table>
			</div>
			<table  width="800px" height="300px" border="0" cellspacing="0" cellpagging="0" align="center">
			<tr>
				<td align="right" colspan="2">				
					    
					<input class="recharge-button" type="button" value="목록" onclick="location.href='/admin/adminPage'">
				</td>
			</tr>
			</table>
		
	</div>	
</div>	
</div>		
		 
</body>

</html>