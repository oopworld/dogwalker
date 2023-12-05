<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
	.nav-mypage-left{
		position:relative;
		margin-left:100px;
		float:left;
		width:250px;
	}
	
	.nav-mypage-left ul{
		list-style:none;
	}
	
	.nav-mypage-left a{
		text-decoration:none;
		color:black;
	}
	
	.mypage-left-list > li {
		height:30px;
		background-color:#f5f5f5;
		display:block;
	}
	
		.mypage-left-list > li > a{
		font-size:5px;
		margin-left:60px;
	}
	
	.mypage-left-list > li:first-child > a {
		font-weight:bold;	
		margin-left:60px;
		font-size:15px;
		
	}
	
	.mypage-right{
		position:relative;
		float:left;
		width:850px;
		margin-left:30px;
	}
</style>
<script>
	$(function(){
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
		memberInfoLoad();
	})
</script>
<c:set var="logincheck" value="needlogin0"/>
</head>
<body>
<!-- Header -->
<table border="solid 1px white" cellpadding="0" cellspacing="0" color="#a0a0a0" align="center" width="1536">
<tr valign="top" height="150" >
<td >
	<div id="header"></div>
</td>
</tr>
<tr valign="middle" bgcolor="#ffffff"><td>
<!-- 본문 -->	
<!-- 왼쪽 메뉴 -->
<div class="nav-mypage-left">
	<ul>
		<li>
			<ul class="mypage-left-list">
			   	<li><a href="#" onclick="memberInfoLoad()">회원정보</a></li>
			   	<li><a href="#" onclick="myInfoEditLoad()">-정보수정</a></li>
			   	<li><a href="#" onclick="DeleteMyInfo()">-회원탈퇴</a></li>
		   	</ul>
		</li>
		<li>
		   	<ul class="mypage-left-list">
			   	<li><a href="#">쇼핑내역</a></li>
			   	<li><a href="#">-구매상품목록</a></li>
			   	<li><a href="#">-주문취소내역</a></li>
		   	</ul>
		</li>
		<li>
		   <ul class="mypage-left-list">
		   		<li><a href="#">멍코인 (예치금)</a></li>
		   		<li><a href="pointcheck">-멍코인 사용내역</a></li>
		  		<li><a href="chargeform">-멍코인 충전하기</a></li>
		   	</ul>
		 </li>
		<li>
		   	<ul class="mypage-left-list">
		   		<li><a href="#" onclick="mydogInfoLoad()">내 강아지</a></li>
		   		<li><a href="#" onclick="mydogRegister()">-강아지 등록</a></li>
		   		<li><a href="#" onclick="mydogEditLoad()">-강아지 정보 수정</a></li>
		   	</ul>
		</li>
		<li>
		   	<ul class="mypage-left-list">
		   		<li><a href="#">작성글목록</a></li>
		   		<li><a href="#">-자유게시판</a></li>
		   		<li><a href="#">-Q&A게시판</a></li>
		   	</ul>
		 </li>
	</ul>
</div>
<!-- 오른쪽 메뉴 -->
<div class="mypage-right">	

</div> 
<!-- 본문끝 -->
<!-- Footer -->
</td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>
<script>

	var addressforGEO='';
	
	function memberInfoLoad(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/myinfo.html');
		loadMyInfo();	
	}
	
	function myInfoEditLoad(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/myinfoedit.html');
		loadMyInfo();
	}
	
	function DeleteMyInfo(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/deletemyinfo.html');
		
	}

	function mydogInfoLoad(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/mydoginfo.html');
		mydoginfoload();
	}
	
	function mydogEditLoad(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/mydogedit.html');
		mydoginfoload();
		
	}
	
	function mydogRegister(){
		$('.mypage-right').empty();
		$('.mypage-right').load('resources/template/mydogregister.html');
	}
	
	
	function loadMyInfo(){
		$.ajax({url:'memberinfo',
			type:'GET',
			contentType: "application/json; charset=UTF-8",
			success:function(data){
				data=JSON.parse(data);
				
				var koreanDateFormat = new Intl.DateTimeFormat("ko-KR", { //Unix타임스태프형으로 받는 가입일을 한국식으로변경
					  year: "numeric",
					  month: "long",
					  day: "numeric",
					  hour: "numeric",
					  minute: "numeric",
					  second: "numeric",
					  timeZone: "Asia/Seoul"
					});
				
				joindate = koreanDateFormat.format(data.joindate);
				
				document.getElementById('id').value=data.id;
				document.getElementById('name').value=data.name;
				document.getElementById('nickname').value=data.nickname;
				document.getElementById('phone').value=data.phone;
				document.getElementById('email').value=data.email;
				document.getElementById('address').value=data.address;
				document.getElementById('address_detail').value=data.address_detail;
				document.getElementById('zipcode').value=data.zipcode;
				document.getElementById('latitude').value=data.latitude;
				document.getElementById('longitude').value=data.longitude;
				document.getElementById('joindate').value=joindate;
				myphotoname=data.photo;
				
				$('#myphoto').attr('src','resources/upload/'+myphotoname).attr('width','300px');
				
				//$('#memberPhoto').setAttribute('src','/resources/upload/'+data.photo);
			},error:function(){
    			var baseUrl = window.location.origin;
    			var MainUrl = baseUrl+"/main";
				alert('서버요청 및 json파일 불러오기 실패!!!');
				document.location=MainUrl;
			}
		})
		}
		
		function mydoginfoload(){
			$.ajax({url:'mydoginfo',
				type:'GET',
				contentType: "application/json; charset=UTF-8",
				success:function(data){
					data=JSON.parse(data);
					
					document.getElementById('id').value=data.id;
					document.getElementById('dog_name').value=data.dog_name;
					document.getElementById('dog_age').value=data.dog_age;
					document.getElementById('dog_breed').value=data.dog_breed;
					document.getElementById('dog_favtime').value=data.dog_favtime;

					mydogphotoname=data.dog_photo;
					
					$('#dog_photo').attr('src','resources/upload/'+mydogphotoname).attr('width','300px');
					
					//$('#memberPhoto').setAttribute('src','/resources/upload/'+data.photo);
				},error:function(){
	    			var baseUrl = window.location.origin;
	    			var MainUrl = baseUrl+"/main";
					alert('서버요청 및 json파일 불러오기 실패!!!');
					document.location=MainUrl;
				}
			})
		}
	
		
		function searchAddress(){
   		 new daum.Postcode({
			        oncomplete: function(data) {
			        	document.getElementById('zipcode').value = data.zonecode;
						document.getElementById('address').value=data.address;
						$('#address').addClass('inputsuccess');
						$('#zipcode').addClass('inputsuccess');
						
						$('#geoMap').addClass('buttonnotyet');
						$('#geoMap').removeClass('buttonSuccess');
						
						addressforGEO=data.address+data.buildingName;
						
			        }
			    }).open();
   		
		}
		

    		function getGEOmap(){
    			console.log(addressforGEO);
        		
    			$.ajax({
        			url:'proxy/geo',
        			type:'post',
        			dataType:'text',
        			data: { address: addressforGEO },
        			success:function(data){
        				data=JSON.parse(data);
    					var latitude=data.response.result.point.y;
    					var longitude=data.response.result.point.x;
        				document.getElementById('latitude').value=latitude;
    					document.getElementById('longitude').value=longitude;
    					console.log('latitude=>'+latitude+',longitude=>'+longitude);
    					$('#geoMap').addClass("buttonSuccess");
    					$('#geoMap').removeClass("buttonnotyet");
        			},error:function(){
        				alert('서버요청 및 json파일 불러오기 실패!!!');
        				$('#geoMap').removeClass("buttonSuccess");
        				$('#geoMap').addClass("buttonnotyet");
        				console.log(this.data);
        			 }
        			})
        		}
    	
		function submitCheck(){

    		if(!document.getElementById('name').classList.contains('inputsuccess')){
    
    			alert(document.getElementById('name').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    			
    		}
    		if(!document.getElementById('phone').classList.contains('inputsuccess')){
    		
    			alert(document.getElementById('phone').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('nickname').classList.contains('inputsuccess')){
    	
    			alert(document.getElementById('nickname').parentElement.parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('id').classList.contains('inputsuccess')){
    		
    			alert(document.getElementById('id').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('pw').classList.contains('inputsuccess')){
    	
    			alert(document.getElementById('pw').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('email').classList.contains('inputsuccess')){
    	
    			alert(document.getElementById('email').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('address').classList.contains('inputsuccess')){
    		
    			alert(document.getElementById('address').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			document.getElementById('address').focus();
    			return false;
    		}
    		if(!document.getElementById('address_detail').classList.contains('inputsuccess')){
    	
    			alert(document.getElementById('address_detail').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('zipcode').classList.contains('inputsuccess')){
    		
    			alert(document.getElementById('zipcode').parentElement.firstElementChild.innerHTML+' 칸을 확인해주세요');
    			this.focus();
    			return false;
    		}
    		if(!document.getElementById('idcheckbutton').classList.contains('buttonSuccess')){
    		    
    			alert('중복된 아이디인지 확인해주세요');
    			this.focus();
    			return false;
    			
    		}
    		if(!document.getElementById('geoMap').classList.contains('buttonSuccess')){
    		    
    			alert('지오 코딩 버튼을 실행시켜주세요');
    			this.focus();
    			return false;
    			
    		}
    		
    		if(!document.getElementById('upload').classList.contains('buttonSuccess')){
    		    
    			alert('사진을 등록해주세요');
    			return false;
    			
    		}
    		
    		if(!$('.form-check-input')[0].checked){
    	
    			alert('회원가입에 동의해주세요');
    			return false;
    		}
    		
    		if(!$('.form-check-input')[1].checked){

    			alert('14세 이상인지 확인해주세요');
    			return false;
    		}
    		
  
				
    		/* 	var id=$('#id').val();
    			var pw=$('#pw').val();
    			var name=$('#name').val();
    			var phone=$('#phone').val();
    			var zipcode=$('#zipcode').val();
    			var address=$('#address').val();
    			var address_detail=$('#address_detail').val();
    			var nickname=$('#nickname').val();
    			var email=$('#email').val();
    			var photo=$('#photo').val();
    			var latitude=$('#latitude').val();
    			var longitude=$('#longitude').val(); */
    			
    			var formData = new FormData(document.signform);
    			var baseUrl = window.location.origin;
    			var loginUrl = baseUrl+"/login";
    			$.ajax({ 
    				 url:'signup',
    				 type:'post',
    				 data:formData,
    				 enctype:"multipart/form-data",
    				 processData: false,
    				 contentType: false,
    				 success:function(result){
    					 if(result=="success"){
    						 alert("회원가입에 성공하였습니다.");
    						 console.log(baseUrl);
    						 console.log(loginUrl);
    						 document.location=loginUrl;
    					 }else if(result=="fail"){
    						 alert("회원가입에 실패하였습니다.");
    					 }
    				 },//예외처리를 반드시 할것
    				 error:function(result){
    					 alert("서버요청실패!!");
    				 }
    			 })			
    		//signform.submit();
		
    	}
	
	
		
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>