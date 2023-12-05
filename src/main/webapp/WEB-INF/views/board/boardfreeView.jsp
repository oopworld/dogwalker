<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@page import="java.util.*,com.dogwalker.domain.*" %>
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
        /* 표 */

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
				<td><a href="file2?filename2=${board2.filename2}">${board2.filename2 }</a></td>
			</tr>
			</table>
			</div>
			<table  width="800px" height="300px" border="0" cellspacing="0" cellpagging="0" align="center">
			<tr>
				<td align="right" colspan="2">
					<input class="recharge-button" type="button" value="수정" 
					   onclick="location.href='update2?seq2=${board2.seq2}'">
					   
					<input class="recharge-button" type="button" value="삭제" 
					   onclick="location.href='delete2?seq2=${board2.seq2}'">
					  
					<input class="recharge-button" type="button" value="목록" onclick="location.href='list2'">
				</td>
			</tr>
			</table>
		
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