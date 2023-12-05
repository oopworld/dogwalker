<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자페이지</title>

 

    <!-- Custom styles for this template-->
     <link href="./resources/css/admin.css" rel="stylesheet">
 
       <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>


        
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="../js/summernote-ko-KR.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />


        <script>
$(document).ready(function() {
    $('#summernote').summernote({
        placeholder: 'content',
          minHeight: 370,
          maxHeight: null,
          focus: true, 
          lang : 'ko-KR'
    });
  });
</script>


</head>

<!-- Modal -->
<div class="modal fade" id="archiveModal" tabindex="-1" aria-labelledby="archiveModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="archiveModalLabel">게시물 숨기기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 숨기시겠습니까 ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 삭제하시겠습니까 ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger">확인</button>
      </div>
    </div>
  </div>
</div>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">


        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-text mx-3">관리자 페이지</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            
				<!-- Nav Item - Dashboard -->
		<li class="nav-item active">
		    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoard"
		        aria-expanded="true" aria-controls="collapseBoard">
		        <i class="fa-solid fa-chalkboard"></i>
		        <span>게시판 관리</span>
		        <span class="caret"></span>
		    </a>
		    <div id="collapseBoard" class="collapse" data-parent="#accordionSidebar">
		        <div class="bg-white py-2 collapse-inner rounded">
		            <h6 class="collapse-header">게시판 목록</h6>
		            <a class="collapse-item" href="adminPage.jsp">자유게시판</a>
		            <a class="collapse-item" href="adminNoticePage.jsp">공지게시판</a>
		            <a class="collapse-item" href="adminPuppy_board.jsp">강아지자랑게시판</a>
		        </div>
		    </div>
		</li>
		
		<li class="nav-item active">
		    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReservation"
		        aria-expanded="true" aria-controls="collapseReservation">
		        <i class="fa-solid fa-user"></i>
		        <span>예약 관리</span>
		        <span class="caret"></span>
		    </a>
		    <div id="collapseReservation" class="collapse" data-parent="#accordionSidebar">
		        <div class="bg-white py-2 collapse-inner rounded">
		            <!-- 예약 관련 항목을 여기에 추가 -->
		               <h6 class="collapse-header">예약 목록</h6>
		            <a class="collapse-item" href="admin_rv_list.jsp">예약 현황</a>
		            <a class="collapse-item" href="admin_rv_application.jsp">예약 신청</a>
		            <a class="collapse-item" href="admin_rv_inquiry.jsp">신고 및 취소</a>
		        </div>
		    </div>
		</li>
		
		<li class="nav-item active">
		    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseGoods"
		        aria-expanded="true" aria-controls="collapseGoods">
		        <i class="fa-solid fa-box"></i>
		        <span>물품 관리</span>
		        <span class="caret"></span>
		    </a>
		    <div id="collapseGoods" class="collapse" data-parent="#accordionSidebar">
		        <div class="bg-white py-2 collapse-inner rounded">
		            <!-- 물품 관련 항목을 여기에 추가 -->
		               <h6 class="collapse-header">쇼핑몰 목록</h6>
		            <a class="collapse-item" href="admin_itlist.jsp">상품관리</a>
		            <a class="collapse-item" href="admin_itreview.jsp">구매평관리</a>
		            <a class="collapse-item" href="admin_inquiry.jsp">문의관리</a>
		            <a class="collapse-item" href="admin_cancel.jsp">취소관리</a>
		        </div>
		    </div>
		</li>





            <!-- Divider -->
            <hr class="sidebar-divider">

        </ul>
        <!-- Content -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- admin status -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자1</span>
                                <img class="img-profile rounded-circle" src="img/logo.png">
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- Page Content -->
                <div class="container-fluid">

 
  <h4 class="text-info text-center">공지게시판 작성</h4><br>
    <div class="container" role="main">

      <form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">


        <div class="mb-3">

          <label for="title">제목</label>

          <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">

        </div>


        <div class="mb-3">

         <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="setAtTop">
        <label class="form-check-label" for="setAtTop">
          상단고정
        </label>
      </div>

       <div class="form-check">
          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
          <label class="form-check-label" for="flexRadioDefault1">
            긴급공지
          </label>
          &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
          <label class="form-check-label" for="flexRadioDefault2">
            일반공지
          </label>
        </div>

        </div>
        

        <div class="mb-3">

          <label for="content">내용</label>

         <textarea id="summernote" name="content"></textarea>

        </div>

    
        <div class="mb-3">

          <label for="content">관리자 코드</label>

         <input type="password" class="form-control col-md-2" placeholder="******">

        </div>
      

             <div class="mb-3">

          <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="noticeValid">
              <label class="form-check-label" for="noticeValid">
                회원들이 보게 될 공지사항입니다. 자세한 검토 후 작성 부탁드립니다.
              </label>
            </div>
        </div>


      </form>

      <div class="justify-content-center">

        <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
        <button type="button" class="btn btn-sm btn-primary" id="btnreset">다시쓰기</button>
        <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

      </div>

  </div>
 


</div>
 

       
                                    
                    </div>
 
                </div>
            </div>
  
</body>

</html>