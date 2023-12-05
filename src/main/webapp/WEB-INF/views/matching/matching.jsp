<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- 지도 넣으며 변경 -->
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>예약신청페이지</title>
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- CSS only -->
<style>
* {
	font-size: 16px;
	font-family: Consolas, sans-serif;
}
.cm-1{
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- 네이버지도 스크립트 -->
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3bonmdfkjb"></script>

<!-- 네이버 지도 스크립트 시작 -->

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
	<!-- 메인페이지 시작 -->

	<p>
	<div class="container border border-2 cm-1">
		<!-- 주 컨텐츠 컨테이너 시작 -->
			<!-- 페이지 설명 시작 -->
		<p>
		<div class="row">
			<div class="col text-center">
				<h1>예약신청하기</h1>
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<p>강아지를 산책 시켜줄 믿음직스러운 산책자에게 산책을 신청해보세요! <br> or 오늘은 어떤 귀여운 강아지를
					산책시켜볼까요?</p>
			</div>
		</div>
		<!-- 페이지 설명 끝 -->
		<br>
		<!-- 날짜 선택 시작 -->
		<div class="row">
			<div class="col-1">
				<img src="../resources/img/n1.png" class="float-end" style="width: 40px;" alt="...">
			</div>
			<div class="col-2">
				<h2>날짜 선택</h2>
			</div>
			<div class="col-6">
				 <label for="date-input">날짜:</label>
				 <input type="date" id="date-input" name="date" min="">
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<p>산책을 진행할 날짜를 먼저 선택해주세요</p>
				<p>
			</div>
		</div>
		<!-- 날짜 선택 끝 -->
		<p>
		<p>
		<!-- 지도 시작 -->
		<div class="row">
			<div class="col-1"><img src="../resources/img/n2.png" class="float-end" style="width: 40px;" alt="..."></div>
			<div class="col-10">
				<div id="map" style="max-width: none; height:600px; border: 0;"></div><!-- 네이버 지도 API 반드시 height 줘야 함 -->
			</div>
			<div class="col-1"></div>
		</div>
		<p>
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<p>지도에서 산책자(or 강아지)를 선택해주세요</p>
				<p>
			</div>
		</div>
		<!-- 지도 끝 -->
		<p>
		<p>
		<!-- 산책 시간 설정 시작 -->
		<div class="container">
			<div class="row">
				<div class="col-1"><img src="../resources/img/n3.png" class="float-end" style="width: 40px;" alt="..."></div>
				<div class="col-2">
					<h5>산책 시작 시간</h5>
					<p>
					<h5>산책 종료 시간</h5>
				</div>
				<div class="col-3">
						<input type="time" id="startTimeInput" value="13:10" >
						<p>
						<p>
						<input type="text" value="" id="runningTimeInput" placeholder="분단위로 숫자만 적어주세요.">
				</div>
				<div class="d-grid gap-3 col-5">
						<button type="button" class="btn btn-primary" onclick="submitMatching()">신청하기</button>
						<br>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<p>원하시는 산책 시간을 선택해주세요</p>
				<p>
			</div>
		</div>
		<!-- 산책 시간 설정 끝 -->
	</div><!-- 주 컨텐츠 컨테이너 끝 -->
	<p>
	<p>
	<!-- 메인페이지 끝 -->
</td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>

<script>
var HOME_PATH = window.HOME_PATH || '.';

var CalendarDate='';
var Arraymarkers=[];
var Arraycontents=[];
var Arrayinfowindows=[];
var MarkerObject={};
var ContentObject={};
var InfoWindowObject={};

var selected_dog_id;
var startTime;
var runningTime;
var JsonParsed;

//날짜 설정 시작
const seoulTime = new Date().toLocaleString('en-US', { timeZone: 'Asia/Seoul' });//서울의 현재 날짜와 시간 가져오기
const seoulDate = new Date(seoulTime).toISOString().split('T')[0]; //날짜와 시간 문자열로부터 (YYYY-MM-DD) 이 형태로 추출하기
const dateInput = document.getElementById('date-input');//날짜 인풋 엘리먼트를 가져온다
dateInput.setAttribute('min', seoulDate); // 서울의 현재날짜를 min속성에 설정한다.
//날짜 설정 끝

var kic = new naver.maps.LatLng(37.4989458, 127.0281476);
var map = new naver.maps.Map('map', {//날짜선택이 끝나면 지도 생성
    		center: kic,
    		zoom: 16
		   });

window.navermap_authFailure = function () {
    // 인증 실패 시 처리 코드 작성
    console.log('네이버 map API 접근 실패');
}

function sendDate(){//달력에서 날짜를 선택하면 자동으로 해당 날짜보다 뒤의 날짜의 Dog정보들을 가져오도록하는것

		$.ajax({
			url:'getMarker',
			type:'post',
			dataType:'text',
			data:{date:CalendarDate},
			success:function(data){
				if(data=="needlogin"){//선택한 날짜에 해당하는 목록이 없다면
					alert('로그인이 필요합니다.');
					location.href=window.location.origin+'/login';
				}else if(data.length==0){
					alert('해당 날짜에는 신청된 산책내역이 없습니다.');
				}else if(data=="fail"){
					alert('해당 날짜에는 이미 회원님의 예정된 산책이 존재합니다.');
				}else{
					JsonParsed=JSON.parse(data);
					setMarker(JsonParsed);
				}
				
				//MatchingController의 getMarker()메서드로 부터 반환받은 json형태의 String을 json객체로 형변환 
				//내가만든 marker함수 참고
				
			},error:function(){
				alert('서버요청 및 json파일 불러오기 실패!!!');
			}
		});
		

	};//sendDate() 함수
	
	function setMarker(listdate){//list형태의 json값을 for문으로 하나씩 가져와 Marker로만드는역할
		
		for(let i=0;i<listdate.length;i++){ //let을 쓰거나 i대신 idx_setMarker같이 다른 함수에 의해 값이 변경될일이없는 복잡한이름으로 하기
			
			dog_id=listdate[i].dog_id;
			dog_name=listdate[i].dog_name;
			dog_age=listdate[i].dog_age;
			dog_breed=listdate[i].dog_breed;
			dog_address=listdate[i].address;
			dog_address_detail=listdate[i].address_detail;
			dog_photo=listdate[i].dog_photo;
			dog_favtime=listdate[i].dog_favtime;
			
			latitude=listdate[i].latitude;
			longitude=listdate[i].longitude;
			console.log('위도 setMarker=>'+latitude);
			console.log('경도 setMarker=>'+longitude);
			console.log('주소=>'+dog_address);
			console.log('주소상세=>'+dog_address_detail);
			
			Arraymarkers[i] = new naver.maps.Marker({ //동적으로 마커(Marker) 생성
			   	map: map,
			    position: new naver.maps.LatLng(latitude,longitude)
		   	});
			
			window['MarkerObject'+i]=Arraymarkers[i];
			
			Arraycontents[i] = [
				 '<div class="iw_inner">',
				    '   <table class="table">',
				    '   <tr><img src="'+ HOME_PATH +'/resources/upload/'+dog_photo+'" style="height:150px;" class="rounded-circle mx-auto d-block" alt="..."></tr>',
				    '   <tr><td>반려견 이름</td><td>'+dog_name+'</td></tr>',
				    '   <tr><td>반려견 나이</td><td>'+dog_age+'</td></tr>',
				    '   <tr><td>반려견 견종</td><td>'+dog_breed+'</td></tr>',
				    '   <tr><td>주소</td><td>'+dog_address+'</td></tr>',
				    '   <tr><td></td><td>'+dog_address_detail+'</td></tr>',
				    '   </table>',
			    ].join('');
			
			window['ContentObject'+i]=Arraycontents[i];	
			
			Arrayinfowindows[i]=new naver.maps.InfoWindow({//마커를 눌렀을때 뜨는 창
			    content: Arraycontents[i],
			    maxWidth: 400,
			    backgroundColor: "#eee",
			    borderColor: "#2db400",
			    borderWidth: 5,
			    anchorSize: new naver.maps.Size(30, 30),
			    anchorSkew: true,
			    anchorColor: "#eee",
			    pixelOffset: new naver.maps.Point(20, -20)
			});
				
			window['InfoWindowObject'+i]=Arrayinfowindows[i]
	        
			window['dog_id'+i]=listdate[i].dog_id;
			
	     	 naver.maps.Event.addListener(Arraymarkers[i], "click", function(e) {
	                
	            	if (Arrayinfowindows[i].getMap()) {
	            		Arrayinfowindows[i].close();
	            		selected_dog_id='';
	                } else {
	                	Arrayinfowindows[i].open(map, Arraymarkers[i]);
	                	selected_dog_id=window['dog_id'+i];
	                }
	           
	         }); 
 
	     	
				
		}
	}	

	
function submitMatching(){
		
	
		startTime=$('#startTimeInput').val();
		runningTime=parseInt($('#runningTimeInput').val());
		var beforeJson= {m_date:CalendarDate,
				dog_id:selected_dog_id,
				m_start:startTime,
				m_duration:runningTime};
		
		beforeJson = JSON.stringify(beforeJson);
		
		if(selected_dog_id==''){
			alert('강아지 마커를 선택해주세요.');
			return;
		}
		
		$.ajax({
			url:'submitmatching',
			method:'POST',
			contentType:'application/json',
			data:beforeJson,
			dataType:'text',
			success:function(data){
				if(data=='success'){
					alert('신청이 완료되었습니다.');
					location.href=window.location.origin+'/rescheck';
				}
				
				
				//MatchingController의 getMarker()메서드로 부터 반환받은 json형태의 String을 json객체로 형변환 
				//내가만든 marker함수 참고
				
			},error:function(){
				alert('서버요청 및 json파일 불러오기 실패!!!');

			}
		});
	
}
	
	
	
$(function(){
		
	
			$("#header").load("resources/template/head.jsp");
			$("#footer").load("resources/template/footer.jsp");
			
		
		$('#date-input').change(function(){//달력에서 날짜를 선택하면 자동으로 해당 날짜보다 뒤의 날짜의 Dog정보들을 가져오도록 함수 지정
				CalendarDate=$('#date-input').val();
				sendDate(CalendarDate);//정보가져와서 마커생성
				//Arrayinfowindows[0].open(map, Marker0);
		});
		
});

</script>

<!-- 네이버 지도 스크립트 끝 -->
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>