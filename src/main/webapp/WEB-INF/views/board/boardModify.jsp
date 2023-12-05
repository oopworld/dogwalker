<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<script>
	$(function(){
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
	})
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
</td></tr>

<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>			
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>