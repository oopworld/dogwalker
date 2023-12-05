<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>강아지 산첵 관리자페이지</title>

 

    <!-- Custom styles for this template-->
     <link href="../resources/css/admin.css" rel="stylesheet">
       	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
  


</head>
<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">상품 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        상품을 삭제하시겠습니까 ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <form action="deleteProduct" method="post" style="display: inline;">
          <input type="hidden" id="it_num_input" name="it_num" value="${it_num}" />
        <button type="submit" class="btn btn-danger">확인</button>
        </form>
      </div>
    </div>
  </div>
</div>


<body id="page-top">
    <!-- Page Wrapper -->

				<!-- Nav Item - Dashboard -->
				<%@ include file="/WEB-INF/views/admin_template/admin_header.jsp"%>
                <!-- Page Content -->
                <div id="wrapper">
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">상품 관리</h1>
                        <button type="button" class="btn btn-primary" id="registerButton">상품 등록</button>
                    </div>
					<!-- 모달 -->
				    <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="productModalLabel">상품 등록</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                    <!-- 여기에 상품 등록에 필요한 입력 폼을 추가하세요 -->
				                    <form action="addProduct" method="post" enctype="multipart/form-data">
				                        <div class="mb-3">
				                            <label for="it_name" class="form-label">상품 이름</label>
				                            <input type="text" class="form-control" id="it_name" name="it_name">
				                        </div>
				                        <div class="mb-3">
										    <label for="it_img" class="form-label">상품 이미지</label>
										    <input type="file" class="form-control" id="it_img" name="insertImg">
										</div>
										
										<div class="mb-3">
										    <label for="it_content" class="form-label">상품 설명</label>
										    <textarea class="form-control" id="it_content" name="it_content" rows="3"></textarea>
										</div>
										
										<div class="mb-3">
										    <label for="it_price" class="form-label">상품 가격</label>
										    <input type="number" class="form-control" id="it_price" name="it_price">
										</div>
										
										<div class="mb-3">
										    <label for="catecode" class="form-label">카테고리 코드</label>
										    <select class="form-control" id="catecode" name="catecode">
										        <option value="장난감">장난감</option>
										        <option value="사료">사료</option>
										        <option value="간식">간식</option>
										    </select>
										</div>
										
										<div class="mb-3">
										    <label for="it_cnt" class="form-label">상품 수량</label>
										    <input type="number" class="form-control" id="it_cnt" name="it_cnt">
										</div>
										<div class="modal-footer">
										    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										    <button type="submit" class="btn btn-primary">상품 등록</button>
										</div>
				                    </form>
				                </div>
				                
				            </div>
				        </div>
				    </div>
				    
				   
				    <!-- 모달 수정 폼 -->
				    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModal" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="updateModal">상품 수정</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                    <!-- 여기에 상품 수정에 필요한 입력 폼을 추가하세요 -->
				                    <form action="updateProduct" method="post" enctype="multipart/form-data">
				                    	<input type="hidden" name="it_num" value="${item.it_num}" />
				                    	<input type="hidden" name="page" value="${page}" />
				                        <div class="mb-3">
				                            <label for="it_name" class="form-label">상품 이름</label>
				                            <input type="text" class="form-control" id="it_name" name="it_name">
				                        </div>
				                        <div class="mb-3">
										    <label for="it_img" class="form-label">상품 이미지</label>
										    <input type="file" class="form-control" id="it_img" name="insertImg">
										</div>
										<div class="mb-3">
										    <label for="it_content" class="form-label">상품 설명</label>
										    <textarea class="form-control" id="it_content" name="it_content" rows="3"></textarea>
										</div>
										<div class="mb-3">
										    <label for="it_price" class="form-label">상품 가격</label>
										    <input type="number" class="form-control" id="it_price" name="it_price">
										</div>
										<div class="mb-3">
										    <label for="catecode" class="form-label">카테고리 코드</label>
										    <select class="form-control" id="catecode" name="catecode">
										        <option value="장난감">장난감</option>
										        <option value="사료">사료</option>
										        <option value="간식">간식</option>
										    </select>
										</div>
										<div class="mb-3">
										    <label for="it_cnt" class="form-label">상품 수량</label>
										    <input type="number" class="form-control" id="it_cnt" name="it_cnt">
										</div>
										<div class="modal-footer">
										    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										    <button type="submit" class="btn btn-primary">저장</button>
										</div>
				                    </form>
				                </div>
				            </div>
				        </div>
				    </div>
                    <div class="alert alert-success d-none" role="alert" >
                      This is a warning alert—check it out!
                        <button type="button" class="close">&times;</button>
                    </div>
                    <div class="row mb-5">
					  <div class="col-md-6">
					    <div class="btn-group" id="category-pills" role="group" aria-label="Product Categories">
					      <button type="button" class="btn btn-secondary active" data-cate="all">전체 상품</button>
						  <button type="button" class="btn btn-secondary" data-cate="장난감">장난감</button>
						  <button type="button" class="btn btn-secondary" data-cate="사료">사료</button>
						  <button type="button" class="btn btn-secondary" data-cate="간식">간식</button>
					    </div>
					  </div>
					</div>
                     <form class="d-flex justify-content-end" action="admin_itlist" method="get">
                        <input class="form-control col-md-2" name="searchWord" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                      </form>
                      <br>
				<!-- 상품 리스트 -->
				<div class="row">
                        <table class="table table-hover">

                          <thead>
                            <tr>
                              <th scope="col">번호</th>
                              <th scope="col">상품명</th>
                              <th scope="col">상품이미지</th>
                              <th scope="col">상품가격</th>
                              <th scope="col">상품내용</th>
                              <th scope="col">재고</th>
                              <th scope="col">상품카테고리</th>
                              <th scope="col">등록일</th>
                               <th scope="col">수정 및 삭제</th>
                            </tr>
                          </thead>  
                          <tbody>
							<c:forEach items="${adminItems}" var="item">
	                            <tr>
	                               <td data-it_num="${item.it_num}">${item.it_num}</td>
								    <td data-it_name="${item.it_name}">${item.it_name}</td>
								    <td data-it_img="${item.it_img}"><img src="${item.it_img}" alt="..." width="30" height="30"></td>
								    <td data-it_price="${item.it_price}">${item.it_price} 원</td>
								    <td data-it_content="${item.it_content}">${item.it_content}</td>
								    <td data-it_cnt="${item.it_cnt}">${item.it_cnt}</td>
								    <td data-catecode="${item.catecode}">${item.catecode}</td>
								    <td data-it_rdate="${item.it_rdate}">${item.it_rdate}</td>
								    <td>
								        <button type="button" class="btn btn-outline-warning updateBtn" data-toggle="modal" data-target="#updateModal" data-it_num="${item.it_num} data-page="${page}"">수정</button>
								        <button type="button" class="btn btn-outline-danger deleteBtn" data-toggle="modal" data-target="#deleteModal" data-it_num="${item.it_num}">삭제</button>
								    </td>
	                            </tr>
	                       </c:forEach>   
                          </tbody>
                        </table>
                    </div>
                    <!-- 페이지네이션 바 -->
                     <nav aria-label="Page navigation example">
					    <ul class="pagination justify-content-center">
					        <li class="page-item <c:if test='${page == 1}'>disabled</c:if>">
					            <a class="page-link" href="<c:if test='${page > 1}'>admin_itlist?page=${page - 1}&catecode=${catecode}&searchWord=${searchWord}</c:if>" aria-label="Previous">
					                <span aria-hidden="true">이전</span>
					            </a>
					        </li>
					        <c:forEach var="i" begin="${startPage}" end="${endPage}">
					            <li class="page-item <c:if test='${i == page}'>active</c:if>">
					                <a class="page-link" href="admin_itlist?page=${i}&catecode=${catecode}&searchWord=${searchWord}">${i}</a>
					            </li>
					        </c:forEach>
					        <li class="page-item <c:if test='${page == totalPages}'>disabled</c:if>">
					            <a class="page-link" href="<c:if test='${page < totalPages}'>admin_itlist?page=${page + 1}&catecode=${catecode}&searchWord=${searchWord}</c:if>" aria-label="Next">
					                <span aria-hidden="true">다음</span>
					            </a>
					        </li>
					    </ul>
					</nav>

            </div>
        </div>
    <!-- Bootstrap 5 JavaScript 및 Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
    <!-- 상품가격 숫자만허용 -->
    function validateNumberInput(inputElement) {
    	// 정규식 패턴: 숫자만 허용 (음수는 허용하지 않음)
        var pattern = /^[0-9]*$/;
        var errorMessage = document.getElementById("error-message");

        if (!pattern.test(inputElement.value)) {
            // 입력값이 숫자가 아닐 경우 에러 메시지를 표시하고 입력값을 공백으로 처리
            errorMessage.style.display = "block";
            inputElement.value = inputElement.value.replace(/[^\d]/g, '');
        } else {
            // 입력값이 유효할 경우 에러 메시지를 숨김
            errorMessage.style.display = "none";
        }
    }
    //상품 개수 
    function limitStockInput() {
        var stockInput = document.getElementById("it_cnt");
        var inputValue = stockInput.value;

        // 입력값이 9999보다 크면 9999로 설정합니다.
        if (parseInt(inputValue) > 9999) {
            stockInput.value = "9999";
        }
    }
    //카테고리
    /* function selectCategory(category) {
        var categoryInput = document.getElementById("cate_num");
        categoryInput.value = category;
        
    } */
    
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, "0");
        var day = String(today.getDate()).padStart(2, "0");
        return `${year}-${month}-${day}`;
    }
 	
 	
    function selectCategory(category) {
        // 선택된 카테고리를 버튼에 반영합니다.
        document.getElementById('catecode').innerText = category;
        
     // ${item.catecode}에 선택한 카테고리 값을 반영합니다.
        document.getElementById('hidden-catecode').value = category;
    }
    
    function addProduct() {
        // 폼 데이터 가져오기
        const formData = new FormData();
        formData.append("it_num", document.getElementById("it_num").value);
        formData.append("it_name", document.getElementById("it_name").value);
        formData.append("it_price", document.getElementById("it_price").value);
        formData.append("it_img", document.getElementById("it_img").files[0]);
        formData.append("catecode", document.getElementById("catecode").innerText);
        formData.append("it_content", document.getElementById("it_content").value);
        formData.append("it_cnt", document.getElementById("it_cnt").value);

        // 서버로 데이터 전송
        fetch('/save-product', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                alert('상품 등록이 완료되었습니다.');
                location.reload(); // 페이지 새로고침하여 등록된 상품 표시
            } else {
                alert('상품 등록에 실패하였습니다. 다시 시도해주세요.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('상품 등록에 실패하였습니다. 다시 시도해주세요.');
        });
    }
    
    // 상품 등록 버튼을 클릭했을 때 실행될 함수를 정의합니다.
    $(document).ready(function() {
	  $('#registerButton').click(function() {
		  var page = $(this).data('page');
		  
		// 수정 모달의 폼에 페이지 번호를 hidden input으로 추가
		  $('#updateModal form').append('<input type="hidden" name="page" value="' + page + '" />');
		  $('#productModal').modal('show');
	  });
	});
    
    $(document).on('click', '.updateBtn', function() {
    	var $row = $(this).closest('tr'); 
    	var it_num = $row.find('td[data-it_num]').data('it_num');
        var it_name = $row.find('td[data-it_name]').data('it_name');
        var it_img = $row.find('td[data-it_img]').data('it_img');
        var it_price = $row.find('td[data-it_price]').data('it_price');
        var it_content = $row.find('td[data-it_content]').data('it_content');
        var itCnt = $row.find('td[data-it_cnt]').data('it_cnt');
        var catecode = $row.find('td[data-catecode]').data('catecode');
        
        $('#updateModal').find('input[name="it_num"]').val(it_num); // input 필드에 값을 설정
        $('#updateModal').find('input[name="it_name"]').val(it_name);
        $('#updateModal').find('input[name="it_img"]').val(it_img);
        $('#updateModal').find('input[name="it_price"]').val(it_price);
        $('#updateModal').find('input[name="it_content"]').val(it_content);
        $('#updateModal').find('input[name="it_cnt"]').val(it_cnt);
        $('#updateModal').find('input[name="catecode"]').val(catecode);
        
    });
    
    $('.deleteBtn').on('click', function() {
    	  var it_num = $(this).data('it_num'); // 상품 번호 가져오기
    	  $('#it_num_input').val(it_num); // 숨겨진 입력 필드에 값 설정
    	});
    
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
	    var baseUrl = "/admin/admin_itlist";
	    var currentSearch = $("input[name='searchWord']").val();
	    if (cate !== 'all') {
	        window.location.href = baseUrl + "?catecode=" + cate + "&searchWord=" + currentSearch;
	    } else {
	        window.location.href = baseUrl + "?searchWord=" + currentSearch;
	    }
	}
    </script>
</body>

</html>