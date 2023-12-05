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
      
      .form-signin{
        position:relative;
        }
        
       .inputerror{
      	border:1px solid red;
      }
      
      .inputsuccess{
		border:1px solid green;
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
<div class="container">
    <div class="container text-center">
  <div class="row">
    <div class="col-md-4">

    </div>
    <div class="col-md-4">

	<main class="form-signin">
  <form name="loginform" action="login" method="post">
    <img class="mb-4" src="/img/loginlogo.png" alt="" width="280" >
    <h1 class="h3 mb-3 fw-normal">댕댕이와 함께해요!</h1>

    <div class="form-floating">
      <input type="text" class="form-control" name="id" placeholder="아이디 입력하세요">
      <label for="Id">id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력하세요">
      <label for="Password">password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <a href="signup">회원가입</a>
      </label>
    </div>
 	<c:if test="${not empty param.isloginSuccess and param.isloginSuccess.equals('fail')}">
    	<div style="color:red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
    <span class="w-100 btn btn-lg btn-primary" onclick="loginsubmit()">Sign in</span>
    <p class="mt-5 mb-3 text-muted">© DogWalker 2023</p>
  </form>
</main>
    </div>
    <div class="col-md-4">
    </div>
  </div>
</div>
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
	$(function(){
		$("#header").load("resources/template/head.jsp");
		$("#footer").load("resources/template/footer.jsp");
		
		$('input[name=id]').change(function(){
			if($(this).val().length<7){
				$(this).addClass('inputerror');
				$(this).removeClass('inputsuccess');
				$(this).next().css('display','inline-block');
			}else{
				$(this).addClass('inputsuccess');
				$(this).next().css('display','none');
			}
			
		})
		
		$('input[name=pw]').change(function(){//비밀번호 8자이상
			if($(this).val().length<8){
				$(this).addClass('inputerror');
				$(this).removeClass('inputsuccess');
				$(this).next().css('display','inline-block');
			}else{
				$(this).addClass('inputsuccess');
				$(this).next().css('display','none');
			}
			
		})
	})
	
	 function loginsubmit(){
  		if($('input[name=id]').val().length<7){
  			alert('아이디를 확인해주세요');
  			return false;
  		}
  		if($('input[name=pw]').val().length<8){
  			alert('비밀번호를 확인해주세요');
  			return false;
  		}
  		loginform.submit();
  	}
	
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>