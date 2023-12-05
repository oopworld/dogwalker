<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Layout</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
   		ul{
   		list-style:none;
   		}
   		
   		.nav-left-sub1{
   		background:blue;
   		}
   		.nav-left-sub1 > li {
   		background:white;
   		}

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .inputerror{
      	border:1px solid red;
      }
      
      .inputsuccess{
		border:1px solid green;
      }
      
      .signupdiv{
      position:relative;
      	width:700px;
      	margin:0 auto;
      	margin-bottom:50px;
      }
      
      .form-label{
      font-weight:bold;
      color:#4169E1;
      }
      
    </style>

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
<div class="signupdiv">
		<h4 class="mb-3">회원가입	</h4>
        <form class="needs-validation" name="signform" enctype="multipart/form-data" method="post" action="signup">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">이름</label>
              <input type="text" class="form-control inputnoempty" id="name" name="name" placeholder="이름" >
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">전화번호</label>
              <input type="text" class="form-control inputnoempty" id="phone" name="phone" placeholder="전화번호" >
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">닉네임</label>
              <div class="input-group has-validation">
			  <input type="text" class="form-control inputnoempty" id="nickname" name="nickname" placeholder="닉네임">
			  <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
              </div>
            </div>
            
             <div class="col-10">
              <label for="id" class="form-label">아이디</label>
              <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
              <span style="font-size:5px;color:red;display:none" >아이디는 7자 이상 입력해야됩니다.</span>
             </div>
             
             <div class="col-2">
             <label class="form-label">중복확인</label>
             <input type="button" class="btn btn-info text-white buttonnotyet" id="idcheckbutton" value="중복확인" onclick="idcheck()" >
             </div>
            
            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
              <span style="font-size:5px;color:red;display:none" >비밀번호는 8자 이상 입력해야됩니다.</span>
             </div>

            <div class="col-6">
              <label for="email" class="form-label">이메일</label>
              <input type="email" class="form-control inputnoempty" id="email" name="email" placeholder="이메일@example.com">
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>
            
           <div class="col-md-2">
              <label for="state" class="form-label">성별</label>
              <select class="form-select" name="mem_gender" required="">
                <option value="man">남성</option>
                <option value="woman">여성</option>
              </select>
            </div>

			<div class="col-md-4">
              <label for="photo" class="form-label">사진</label>
              <input type="file" id="upload" class="buttonnotyet" name="upload">
            </div>
						
            <div class="col-10">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control inputnoempty" id="address" name="address" placeholder="주소검색 버튼으로 주소를 입력하세요" readonly>
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>
            
			<div class="col-2">
              <label for="addressSearch" class="form-label">주소찾기</label>
              <input type="button" class="btn btn-info text-white" id="address_search" value="주소 검색" onclick="searchAddress()" >
            </div>

            <div class="col-md-7">
              <label for="address" class="form-label">상세주소</label>
              <input type="text" class="form-control inputnoempty" id="address_detail" name="address_detail" placeholder="동을 입력하세요" >
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>
			
			<div class="col-2">
              <label for="addressSearch" class="form-label">지오코딩</label>
              <input type="button" class="btn btn-info text-white buttonnotyet" id="geoMap" value="지오코딩" onclick="getGEOmap()" >
            </div>


            <div class="col-md-3">
              <label for="zip" class="form-label">우편번호</label>
              <input type="text" class="form-control inputnoempty" id="zipcode" name="zipcode" placeholder="우편번호" required="">
              <span style="font-size:5px;color:red;display:none" >필수입력입니다.</span>
            </div>
            
          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" name="sign_agree">
            <label class="form-check-label" for="same-address">회원가입에 동의합니까</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" name="sign_age">
            <label class="form-check-label" for="save-info">14세 이상입니까</label>
          </div>
		  <hr class="my-4">
			
			<div class="col-md-6">
				<span class="w-100 btn btn-primary btn-lg col-md-4" onclick="submitCheck()">회원가입</span>
			</div>
			<div class="col-md-6">
				<button class="w-100 btn btn-danger btn-lg col-md-8" type="reset">초기화</button>
			</div>
		<input type="hidden" name="latitude" id="latitude" value="">
		<input type="hidden" name="longitude" id="longitude" value="">
        </form>
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
	
    	$(function(){//아이디 7자이상
    		
    		$('#id').change(function(){
    			$('#idcheckbutton').removeClass('buttonSuccess');
    			$('#idcheckbutton').addClass('buttonnotyet');
    			
    			if($(this).val().length<7){
    				$(this).addClass('inputerror');
    				$(this).removeClass('inputsuccess');
    				$(this).next().css('display','inline-block');
    			
    			}else{
    				$(this).addClass('inputsuccess');
    				$(this).removeClass('inputerror');
    				$(this).next().css('display','none');
    			}
    			
    		})
    		
    		$('#pw').change(function(){//비밀번호 8자이상
    			if($(this).val().length<8){
    				$(this).addClass('inputerror');
    				$(this).removeClass('inputsuccess');
    				$(this).next().css('display','inline-block');
    			}else{
    				$(this).addClass('inputsuccess');
    				$(this).next().css('display','none');
    			}
    			
    		})
    		
    		$('.inputnoempty').change(function(){//이름,전화번호,닉네임,이메일,주소,상세주소,우편번호
    			if($(this).val().length<1){
    				$(this).addClass('inputerror');
    				$(this).removeClass('inputsuccess');
    				$(this).next().css('display','inline-block');
    			}else{
    				$(this).addClass('inputsuccess');
    				$(this).removeClass('inputerror');
    				$(this).next().css('display','none');
    				
    			}
    			
    		})
    		
    		   $('#upload').change(function(){//이미지의 확장자는 'jpg', 'jpeg', 'png', 'gif' 만 가능하도록 설정
    			    
    			  var allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    			  var fileName = $(this).val();
    			  var fileExtension = fileName.split('.').pop().toLowerCase();

    			  if ($.inArray(fileExtension, allowedExtensions) === -1) {
    			        alert('이미지는 img, png, jpeg, gif 확장자만 등록가능합니다.');
    			        $(this).val(''); 
    			    } else {
    			        $(this).removeClass('buttonnotyet');
    			        $(this).addClass('buttonSuccess');
    			    }
    		
    			})
    		
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
    	}  	

    	)
    	
    	
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
    	
    	function idcheck(){
    		
    		var id=document.getElementById('id').value;
    		console.log(id);
    		if($('#id').val()!=null && document.getElementById('id').classList.contains('inputsuccess')){//id가 입력돼있다면
    			$.ajax({ 
   				 url:'idcheck/'+id,
   				 type:'post',
   				 data:id,
				 dataType:'text',
   				 success:function(result){
   					 if(result=="success"){
   						 alert("사용가능한 아이디입니다.");
   						 $('#idcheckbutton').addClass("buttonSuccess");
   						$('#idcheckbutton').removeClass("buttonnotyet");
						 console.log(this.url);
   					 }else if(result=="fail"){
   						 alert("이미 사용중인 아이디입니다");
   						$('#idcheckbutton').removeClass("buttonSuccess");
   						$('#idcheckbutton').addClass("buttonnotyet");
   						$('#id').addClass('inputerror').removeClass('inputsuccess').css('display','inline-block');
   					 }
   				 },//예외처리를 반드시 할것
   				 error:function(result){
   					 alert("서버요청실패!!");
   				 }
   			 })
    		}else {//id 가입력안돼있다면
    			alert("아이디를먼저입력해주세요");
    		}
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
    			var loginUrl = baseUrl+'/login';
    			$.ajax({ 
    				 url:'signup',
    				 type:'post',
    				 data:formData,
    				 enctype:'multipart/form-data',
    				 processData: false,
    				 contentType: false,
    				 success:function(result){
    					 if(result=='success'){
    						 alert('회원가입에 성공하였습니다.');
    						 console.log(baseUrl);
    						 console.log(loginUrl);
    						 document.location=loginUrl;
    					 }else if(result=='fail'){
    						 alert('회원가입에 실패하였습니다.');
    					 }
    				 },//예외처리를 반드시 할것
    				 error:function(result){
    					 alert('서버요청실패!!');
    				 }
    			 })
  		
    		//signform.submit();
		
    	}

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>