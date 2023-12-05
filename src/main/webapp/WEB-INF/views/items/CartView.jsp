<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<script>
	$(function(){
		$("#header").load("/resources/template/head.jsp");
		$("#footer").load("/resources/template/footer.jsp");
		
	})
</script>
</head>
<body>
<!-- Header -->
<table border="solid 1px white" cellpadding="0" cellspacing="0" color="#a0a0a0" align="center" width="1536">
	<tr valign="top" height="150" >
	<td>
		<div id="header"></div>
	</td>
	</tr>
	<tr valign="middle" bgcolor="#ffffff"><td>
<!-- 본문 -->		
<div class="container">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                    <div class="col-lg-6">
                        <h1 class="h2 text-uppercase mb-0">장바구니</h1>
                    </div>
                    <div class="col-lg-6 text-lg-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                                <li class="breadcrumb-item"><a class="text-dark" href="index.html"></a></li>
                                                      </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5">
        <form action="order_page.jsp" method="post">
            <h2 class="h5 text-uppercase mb-4">장바구니 목록</h2>
            <div class="row">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <!-- CART TABLE-->
                    <div class="table-responsive mb-4">
                        <table class="table text-nowrap">
                            <thead class="bg-light">
                            <tr>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase" id="pname">상품</strong></th>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase" id="pname">상품이름</strong></th>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase" id="p_price">가격</strong></th>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase"id="p_cnt">수량</strong></th>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase"id="sum">합계</strong></th>
                                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase"id="del">삭제</strong></th>
                            </tr>
                            </thead>
							<!-- ... -->
							<tbody class="border-0">
							    <c:forEach var="item" items="${cartItems}">
							        <tr id="cart${item.cart_num}">
							            <th class="ps-0 py-3 border-light" scope="row">
							                <div class="d-flex align-items-center"><a class="reset-anchor d-block animsition-link" href="it_detail/${item.it_num}"><img src="${item.it_img}" alt="..." width="70"/></a>
							                    <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" href="it_detail/${item.it_num}" id="pname">${item.it_name}</a></strong></div>
							                </div>
							            </th>
							            <td class="p-3 align-middle border-0">
							                <p class="mb-0 small">${item.it_name}</p>
							            </td>
							            <td class="p-3 align-middle border-0">
							                <p class="mb-0 small">${item.it_price}원</p>
							            </td>
							            <!-- 수량 입력 -->
							            <td class="p-3 align-middle border-0">
							                <div class="d-flex justify-content-center align-items-center">
										        <select id="quantity${item.cart_num}" onchange="changeQuantity(${item.cart_num}, ${item.it_price})">
										            <c:forEach var="i" begin="1" end="10"> <!-- 예: 1부터 10까지 -->
										                <option value="${i}" <c:if test="${i == item.quantity}">selected</c:if>>${i}</option>
										            </c:forEach>
										        </select>
										    </div>
									    </div>
							            </td>
							            <!-- 가격 표시 -->
							            <td class="p-3 align-middle border-light">
							                <p class="mb-0 small price" id="p_sum${item.cart_num}" >${item.it_price * item.quantity}원</p>
							            </td>
							            <!-- 삭제 버튼 -->
							            <td class="p-3 align-middle border-light">
							                <a class="reset-anchor" href="#!" onclick="deleteCart('${item.cart_num}')"><i class="fas fa-trash-alt small text-muted"></i></a>
							            </td>
							        </tr>
							        <input type="hidden" name="it_num" value="${item.it_num}">
				                    <input type="hidden" name="it_name" value="${item.it_name}">
				                    <input type="hidden" name="it_price" value="${item.it_price}">
				                    <input type="hidden" name="quantity" value="${item.quantity}">
							    </c:forEach>
							</tbody>

                        </table>
                    </div>

                    <!-- CART NAV-->
                    <div class="bg-light px-4 py-3">
                        <div class="row align-items-center text-center">
                            <div class="col-md-6 mb-3 mb-md-0 text-md-start">
                                <a class="btn btn-link p-0 text-dark btn-sm" href="/items"><i class="fas fa-long-arrow-alt-left me-2"></i>쇼핑계속하기</a>
                            </div>
                            <div class="col-md-6 text-md-end">
                                <button type="button" class="btn btn-outline-dark btn-sm" onclick="proceedToOrder()">구매하기<i class="fas fa-long-arrow-alt-right ms-2"></i></button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <!-- ORDER TOTAL-->
                <div class="col-lg-4">
                    <div class="card border-0 rounded-0 p-lg-4 bg-light">
                        <div class="card-body">
                            <h5 class="text-uppercase mb-4">구매 목록</h5>
                            	<ul>
							        <c:forEach var="item" items="${cartItems}">
							            <li>${item.it_name}</li>
							        </c:forEach>
							    </ul>
							    <hr>
							    <!-- 나머지 부분 생략 -->
							    <li class="d-flex align-items-center justify-content-between mb-4">
							        <strong class="text-uppercase small font-weight-bold">총 구매금액</strong>
							        <span id="totalPrice"></span>
							    </li>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <form id="orderForm" action="/order/directPurchase" method="post">
	    <input type="hidden" id="items" name="it_name">
	    <input type="hidden" id="totalAmount" name="it_price">
	</form>
		<!-- JavaScript files-->
		<!-- <script src="../resources/js/cart.js"></script> -->
		<script>
			//SVG
			function injectSvgSprite(path) {
				var ajax = new XMLHttpRequest();
				ajax.open("GET", path, true);
				ajax.send();
				ajax.onload = function(e) {
					var div = document.createElement("div");
					div.className = 'd-none';
					div.innerHTML = ajax.responseText;
					document.body
							.insertBefore(div, document.body.childNodes[0]);
				}
			}

			injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');
			
			$(document).ready(function() {
			    calculateTotalPrice(); // 페이지 로드시 처음 총 금액을 계산합니다.
			});
			
			
			function changeQuantity(cart_num, price) {
			    var quantity = $("#quantity" + cart_num).val();

			    $.ajax({
			        url: "/items/updateQuantity",
			        method: "POST",
			        data: { cart_num: cart_num, quantity: quantity },
			        success: function (response) {
			            if (response.success) {
			                // 수량 및 총 가격 업데이트
			                $("#p_sum" + cart_num).text(price * quantity + "원");
			                calculateTotalPrice();
			            } else {
			                alert("수량 업데이트 실패");
			            }
			        },
			        error: function (error) {
			            alert("에러 발생");
			        }
			    });
			}
			
			function calculateTotalPrice() {
			    var totalPrice = 0;
			    $(".price").each(function() {
			        var price = parseInt($(this).text().replace('원', ''));
			        totalPrice += price;
			    });
			    $("#totalPrice").text(totalPrice + "원");
			}
			
			
			function deleteCart(cart_num) {
				console.log("삭제 요청 시작, 장바구니 번호: " + cart_num);
				if(confirm("정말로 삭제하시겠습니까?")) {
				    $.ajax({
				        url: "/items/deleteCart",
				        method: "POST",
				        data: { cart_num: cart_num },
				        success: function (response) {
				            if (response.success) {
				                // 성공적으로 삭제되었을 때 페이지를 새로고침
				                console.log("삭제 성공, 페이지를 새로고침합니다.");
				                
				                alert("삭제 성공");
				                location.reload();
				            } else {
				                // 오류 메시지 표시
				                onsole.log("삭제 실패:", response.deleteFail);
				                alert(response.deleteFail);
				            }
				        },
				        error: function (error) {
				        	console.log("에러 발생:", error);
				            alert("삭제 실패");
				        }
				    });
				}
			}
			
			
			//주문페이지로 갈 때 필요한 함수
			function proceedToOrder() {
			    var itemsList = [];  // 여기에 구매 목록 항목들을 넣습니다.
			    
			    // 구매 목록 항목들을 itemsList에 추가합니다.
			    var itemElements = document.querySelectorAll('.card-body ul li:not(.d-flex)'); // d-flex는 총액을 제외하기 위함입니다.
			    itemElements.forEach(function(item) {
			        itemsList.push(item.innerText);
			    });

			    // 각 상품의 합계 금액을 구하고, 이를 총 합계 금액으로 더합니다.
			    var total = 0;
			    let cartItems = document.querySelectorAll(".price");
			    cartItems.forEach(function(item) {
			        let price = parseInt(item.innerText.replace("원", "").trim());
			        total += price;
			    });

			    // 폼의 input에 값을 설정합니다.
			    document.getElementById("items").value = itemsList.join(",");  // 배열을 문자열로 변환하여 저장합니다.
			    document.getElementById("totalAmount").value = total; // 총 합계 금액을 설정합니다.

			    // 동적으로 action URL을 설정
			    document.getElementById("orderForm").action = "/order/directPurchase";
			    // 폼을 제출합니다.
			    document.getElementById("orderForm").submit();
			}


		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	
	
<!-- Footer -->
</td></tr>
<tr valign="bottom" height="150"  bgcolor="#ffffff">
<td>
	<div id="footer"></div>
</td>
</tr>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>