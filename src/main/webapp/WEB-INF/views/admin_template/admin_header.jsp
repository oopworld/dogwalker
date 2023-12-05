<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
<meta charset="UTF-8">
		<title>header</title>
		</head>
		    <body>
		 <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/adminPage">
                <div class="sidebar-brand-text mx-3">관리자 페이지</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fa-solid fa-chalkboard"></i>
                    <span>게시판 관리</span>
                    <span class=”caret“></span></a>
                    <div id="collapseTwo" class="collapse"   data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판 목록</h6>
                       <a class="collapse-item" href="${pageContext.request.contextPath}/admin/adminPage">
							    <span>자유게시판</span>
							</a>

                       <a class="collapse-item" href="${pageContext.request.contextPath}/admin/adminNoticePage">
                       
			                    <span>공지사항</span></a>
                        
                       <a class="collapse-item" href="${pageContext.request.contextPath}/admin/adminPuppy_board">
													    <span>강아지 자랑 게시판</span>
													</a>
                    </div>
                </div>
            </li>



            <li class="nav-item active">
                <a class="nav-link" href="#">
                   <i class="fa-solid fa-user"></i>
                    <span>회원 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_itlist">
                 <i class="fa-solid fa-box"></i>
                    <span>물품 관리</span></a>
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
                                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/img/logo.png">
                            </a>
                                                        <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
		    </body>
</body>
</html>