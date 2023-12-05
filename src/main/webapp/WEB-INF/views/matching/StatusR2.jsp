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
    <title>산책현황-준비중</title>
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
	<p>
	
	<!-- 산책현황 페이지 내용 시작 -->
	<p>
	<div class="container text-center border border-2 cm-1">
		<p>
		<div class="row">
			<div class="col text-center">
				<h1>산책현황</h1>
			</div>
		</div>
		<p>
		<div class="row">
			<div class="col"><img src="../resources/img/SD.png" alt="..."></div>
		</div><!-- row -->
		<p>
		<div class="row">
			<div class="col"><h2>준비중</h2></div>
		</div><!-- row -->
		<br>
		<div class="row">
			<div class="col"><h3>산책일 ${match.m_date}</h3></div>
		</div>
		<div class="row">
			<div class="col"><h3>시작시간 ${match.m_start}</h3></div>
		</div>
		<div class="row">
			<div class="col"><h3>산책시간 ${match.m_duration}분</h3></div>
		</div>
		<p>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-4"><img src="/resources/upload/${match.photo}" style="width: 300px;height:300px;" class="rounded-circle" alt="..."></div>
				<div class="col-4"><img src="/resources/upload/${match.dog_photo}" style="width: 300px;height:300px;" class="rounded-circle" alt="..."></div>
				<div class="col-2"></div>
			</div><!-- row -->
			<div class="row">
				<div class="col-2"></div>
				<div class="col-4"><h3>${match.name}</h3></div>
				<div class="col-4"><h3>${match.dog_name}</h3></div>
				<div class="col-2"></div>
			</div><!-- row -->
			<p>
			<div class="row">
				<div class="col"><h4>산책 준비가 완료 된 후 산책자(or 견주)를 만나<br>산책이 시작되면 아래의 버튼을 눌러주세요</h4></div>
			</div><!-- row -->
			<p>
			<div class="row">
			<div class="col-2"></div>
				<div class="col-4"><button type="button" class="btn btn-primary" onclick ="location.href = 'MstatusW' ">새로고침</button></div>
				<div class="col-4">
					<!-- 모달 시작 -->
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">산책취소</button>	
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">산책취소</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      	<p>경고 : 정당한 사유없이 산책을 당일에 취소 할 경우 패널티가 부과 됩니다.</p>
					      	<input class="form-control" type="text" placeholder="여기에 산책취소사유를 적어주세요" aria-label="default input example">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-danger"><a href="mCancel2?m_num=${match.m_num}" style="text-decoration:none">제출 후 산책 취소하기</a></button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 모달 끝 -->
				</div>
				
				<div class="col-2"></div>
			</div><!-- row -->
			<div class="row">
			<p>
			<div class="col-2"></div>
				<div class="col-4"><p>새로고침 버튼을 눌러서 산책진행상황을 확인할 수 있습니다<br></div>
				<div class="col-4"><p style="color:red">경고 : 정당한 사유없이 산책을 당일에 <br> 취소 할 경우 패널티가 부과 됩니다.</p></div>
				<div class="col-2"></div>
			</div><!-- row -->
			<p>
	</div>
	<!-- 컨테이너 -->
	<!-- 산책현황 페이지 내용 끝 -->
	<p>
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