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
		

		<body id="page-top">
		
	 <div class="main-content">
	<div class="container">
		<!-- enctype->파일 첨부를 하기위해서 필요 
		       spring:message 액션태그->code="불러올 키값"
		       form:errors 액션태그=>path="적용필드명(DTO중 입력받은 필드명)"
		       spring:hasBindErros name="커맨드객체별칭" =>에러발생시 처리
		       form:errors path="커맨드객체별칭" ->폼안에서의 입력받을때 에러처리 지정
		-->

		
		<form action="write" enctype="multipart/form-data" method="post">
		    <div class="form-group">
		        <label for="title">제목</label>
		        <input type="text" id="title" name="title" value="${command.title}">
		    </div>
		    <div class="form-group">
		        <label for="writer">작성자</label>
		        <input type="text" id="writer" name="writer" value="${command.writer}">
		    </div>
		    <div class="form-group">
		        <label for="pwd">비밀번호</label>
		        <input type="password" id="pwd" name="pwd">
		    </div>
		    <div class="form-group">
		        <label for="content">내용</label>
		        <textarea rows="10" cols="50" id="content" name="content"></textarea>
		    </div>
		    <div class="form-group">
		        <label for="upload">파일업로드</label>
		        <input type="file" id="upload" name="upload">
		    </div>
		    <div class="form-buttons">
		        <input class="recharge-button" type="submit" value="저장">
		        <input class="recharge-button" type="button" value="목록" onclick="location.href='list.do'">
		    </div>
		</form>
	</div>
</div>			
		 
</body>

</html>