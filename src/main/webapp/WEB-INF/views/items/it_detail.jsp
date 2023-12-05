<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Layout</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script>
	$(function(){
		$("#header").load("/resources/template/head.jsp");
		$("#footer").load("/resources/template/footer.jsp");
	})	
</script>
<style>
    h3.display-3 {
      font-size: 24px; 
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
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center" id="product-detail">
            <!-- productDetail  -->
            <div class="col-md-6">
                <img class="card-img-top mb-5 mb-md-0" src="${item.it_img}" alt="Product Image" /> <!-- item의 이미지 경로를 출력합니다. -->
            </div>
            <div class="col-md-6">
                <div class="small mb-1">상품번호 : ${item.it_num}</div> <!-- item의 상품 번호를 출력합니다. -->
                <div class="small mb-1">카테고리 : ${item.catecode}</div> <!--item의 카테고리  -->
                <h1 class="display-5 fw-bolder">${item.it_name}</h1> <!-- item의 이름을 출력합니다. -->
                <div class="fs-5 mb-5">
                    <div class="row data">
                        <div class="subdiv">
                            <div class="basketprice">
                                <input type="hidden" name="p_price" id="p_price1" class="p_price" value="${item.it_price}"> <!-- item의 가격을 출력합니다. -->
                            </div>
                            <div class="num">
                                <div class="updown">
                                주문수량
                                    <input type="text" name="p_num1" id="p_num1" size="1" maxlength="4" class="p_num" value="1" onkeyup="changePNum(1, ${item.it_price});"> <!-- item의 가격을 함수에 전달합니다. -->
                                    <span onclick="changePNum(1, ${item.it_price});"><i class="fas fa-arrow-alt-circle-up up"></i></span> <!-- item의 가격을 함수에 전달합니다. -->
                                    <span onclick="changePNum(1, ${item.it_price});"><i class="fas fa-arrow-alt-circle-down down"></i></span> <!-- item의 가격을 함수에 전달합니다. -->
                                </div>
                            </div>
                            <div class="sum">${item.it_price} 원</div> <!-- item의 가격을 출력합니다. -->
                        </div>
                    </div>
                    <p class="lead">${item.it_content}</p> <!-- item의 내용을 출력합니다. -->
                    <div class="d-flex">
						    <button type="submit" class="btn btn-outline-dark flex-shrink-0 addCart"><i class="bi-cart-fill me-1"></i> 장바구니 담기</button>
                        <p>&nbsp;&nbsp;</p>
                        
                     <form action="/order/directPurchase" method="post">
	                     	<input type="hidden" name="it_name" value="${item.it_name}">
	    					<input type="hidden" id="hiddenItemPrice" name="it_price" value="${item.it_price}">
                        <button class="btn btn-outline-dark flex-shrink-0 direct-buy" type="submit">바로구매</button>
                     </form>   
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer -->
</td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>
<script>
	function changePNum(pos, productPrice) {
	    var item = document.querySelector('input[name=p_num' + pos + ']');
	    var p_num = parseInt(item.getAttribute('value'));
	    var newval = event.target.classList.contains('up') ? p_num + 1
	            : event.target.classList.contains('down') ? p_num - 1
	                    : event.target.value;
	
	    if (parseInt(newval) < 1 || parseInt(newval) > 99) {
	        return false;
	    }
	
	    item.setAttribute('value', newval);
	    item.value = newval;
	
	    var productPriceFloat = parseFloat(productPrice);
	    var sumElement = item.closest('.num').nextElementSibling; // .sum 클래스를 가진 요소를 선택합니다.
	
	    var updatedPrice = newval * productPriceFloat; // 수량에 따른 업데이트 된 가격
	    sumElement.textContent = updatedPrice + '원';
	
	    // 숨겨진 input 필드의 값을 업데이트
	    document.getElementById('hiddenItemPrice').value = updatedPrice;
	}

	// "장바구니 담기" 버튼 클릭 이벤트에 대한 처리를 추가
	$('.addCart').on('click', function() {
		console.log($(".p_num").val());
	    const form = {
	        id: '${id}',
	        it_num: '${it_num}',
	        quantity: $(".p_num").val() // 이 위치에서 값을 가져오도록 변경
	    };
	    $.ajax({
	        url: '/items/addCart', // 호출할 url
	        type: 'POST',    // 호출할 방법
	        data: form,      // 서버로 보낼 데이터
	        success: function(result) { // 서버가 요청을 성공하면 수행될 메서드, 파라미터는 서버가 반환한 값
	            if (result == '0') {
	                alert("장바구니에 이미 추가되어져 있습니다.");
	            } else if (result == '1') {
	                alert("장바구니에 추가되었습니다.");
	            } else if (result == '5') {
	                alert("로그인이 필요합니다.");
	            }
	        }
	    }); 
	});
	
	


	    

	    
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>