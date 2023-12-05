<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Layout</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
    <div class="container px-4 px-lg-5 mt-5">
      <!-- Category Bar -->
      <div class="row mb-5">
		  <div class="col-md-6">
		    <div class="btn-group" id="category-pills" role="group" aria-label="Product Categories">
		      <button type="button" class="btn btn-secondary active" data-cate="all" onclick="changeCategory('all')">전체 상품</button>
			  <button type="button" class="btn btn-secondary" data-cate="장난감" onclick="changeCategory('장난감')">장난감</button>
			  <button type="button" class="btn btn-secondary" data-cate="사료" onclick="changeCategory('사료')">사료</button>
			  <button type="button" class="btn btn-secondary" data-cate="간식" onclick="changeCategory('간식')">간식</button>
		    </div>
		  </div>
		</div>
		<div class="row mb-4">
			<form action="/items/it_list" method="get">
			    <div class="col-md-6 offset-md-3">
			        <div class="input-group">
			            <input type="search" class="form-control" name="searchWord" placeholder="상품 검색...">
			            <button class="btn btn-outline-secondary" type="submit">검색</button>
			        </div>
			    </div>
		    </form>
		</div>
		<!-- Product Cards-->
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="product-list">
							<c:forEach var="item" items="${items}">
								<div class="col mb-5 product-card" data-cate="${item.catecode}">
									<div class="card h-100">
										<img class="card-img-top" src="${item.it_img}" alt="...">
										<div class="card-body p-4">
											<div class="text-center">
												<h6 class="fw-bolder">${item.it_name}</h6>
												${item.it_price} 원
											</div>
										</div>
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto view-options-btn"
													href="it_detail/${item.it_num}">View options</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- 페이지네이션 바 -->
	                     <nav aria-label="Page navigation example">
						    <ul class="pagination justify-content-center">
						        <li class="page-item <c:if test='${page == 1}'>disabled</c:if>">
						            <a class="page-link" href="<c:if test='${page > 1}'>it_list?page=${page - 1}&catecode=${catecode}&searchWord=${searchWord}</c:if>" aria-label="Previous">
						                <span aria-hidden="true">이전</span>
						            </a>
						        </li>
						        <c:forEach var="i" begin="${startPage}" end="${endPage}">
						            <li class="page-item <c:if test='${i == page}'>active</c:if>">
						                <a class="page-link" href="it_list?page=${i}&catecode=${catecode}&searchWord=${searchWord}">${i}</a>
						            </li>
						        </c:forEach>
						        <li class="page-item <c:if test='${page == totalPages}'>disabled</c:if>">
						            <a class="page-link" href="<c:if test='${page < totalPages}'>it_list?page=${page + 1}&catecode=${catecode}&searchWord=${searchWord}</c:if>" aria-label="Next">
						                <span aria-hidden="true">다음</span>
						            </a>
						        </li>
						    </ul>
						</nav>
		
    </div>
  </section>
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
		$("#header").load("/resources/template/head.jsp");
		$("#footer").load("/resources/template/footer.jsp");
	})
	
	 $(document).ready(function() {
        $('#category-pills .btn').on('click', function() {
        	console.log("Button with category: " + $(this).data('cate') + " clicked.");
            // 모든 버튼에서 'active' 클래스 제거
            $('#category-pills .btn').removeClass('active');

            // 현재 클릭된 버튼에 'active' 클래스 추가
            $(this).addClass('active');

            // 선택된 카테고리 값을 얻어서 서버에 전송하거나 다른 동작 수행 (예: changeCategory 함수 호출)
            var selectedCate = $(this).data('cate');
            changeCategory(selectedCate); // 이 부분은 필요에 따라 주석 처리하거나 사용하세요.
        });
    });

	
	function changeCategory(cate) {
	    var baseUrl = "/items/it_list";
	    var currentSearch = $("input[name='searchWord']").val();
	    if (cate !== 'all') {
	        window.location.href = baseUrl + "?catecode=" + cate + "&searchWord=" + currentSearch;
	    } else {
	        window.location.href = baseUrl + "?searchWord=" + currentSearch;
	    }
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
