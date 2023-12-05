<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>산책현황-없음</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
$(function(){
	$("#header").load("/resources/template/head.jsp");
	$("#footer").load("/resources/template/footer.jsp");
})
</script>
<style>
	.cm-1{
		margin-top: 50px;
		margin-bottom: 50px;
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
	<!-- 산책현황 페이지 내용 시작 -->
	<div class="container text-center border border-2 cm-1">
		<p>
		<div class="row">
			<div class="col text-center">
				<h1>산책현황</h1>
			</div>
		</div>
		<p>
		<div class="row">
			<div class="col"><img src="../resources/img/LD.png" alt="..."></div>
		</div><!-- row -->
		<p>
		<div class="row">
			<div class="col"><h2>없음</h2></div>
		</div><!-- row -->
		<div class="row">
			<div class="col"><h3>  </h3></div>
		</div>
		<p>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-4"><img src="../resources/img/not.png" style="width: 300px;height:300px;" class="rounded-circle" alt="..."></div>
				<div class="col-4"><img src="../resources/img/not.png" style="width: 300px;height:300px;" class="rounded-circle" alt="..."></div>
				<div class="col-2"></div>
			</div><!-- row -->
			<div class="row">
				<div class="col-2"></div>
				<div class="col-4"><h3>  </h3></div>
				<div class="col-4"><h3>  </h3></div>
				<div class="col-2"></div>
			</div><!-- row -->
			<p>
			<div class="row">
				<div class="col"><h4>예약되어 있거나 진행중인 산책이 없어요...<br>새로 신청해볼까요?</h4></div>
			</div><!-- row -->
			<p>
			<div class="row">
			<div class="col-4"></div>
				<div class="col-4"><button type="button" class="btn btn-primary" onclick ="location.href = 'findDog' ">예약신청 하러 가기</button></div>
				<div class="col-4"></div>
			</div><!-- row -->
			<div class="row">
			<p>
	</div>
	<!-- 컨테이너 -->
	<!-- 산책현황 페이지 내용 끝 -->
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