<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>
<%@page import="controller.roomController.*"%>
<%@page import="dao.*"%>
<%@page import="db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Hotel Booking Administration</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/AdminFrontendAssets/css/stylex.css"
	rel="stylesheet">
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<%
		String mail = (String) session.getAttribute("admin-email");
		%>

		<div class="d-flex align-items-center justify-content-between">
			<a href="DatPhongKhachSan/Dashboard"
				class="logo d-flex align-items-center"> <img src="/img/logo.png"
				alt=""> <span class="d-none d-lg-block">Hotel
					Management</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <span
						class="d-none d-md-block dropdown-toggle ps-2"><%=mail%></span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6><%=mail%></h6> <span>Admin</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="AdminLogout"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
									xuất</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link "
				href="/DatPhongKhachSan/Dashboard"> <i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->
			<li class="nav-item"><a class="nav-link "
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-door-closed"></i><span>Quản lý phòng</span>
			</a>
				<ul id="components-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a href="Room" class="active"> <i class="bi bi-circle"></i><span>Danh
								sách phòng</span>
					</a></li>
					<li><a href="RoomType"> <i class="bi bi-circle"></i><span>Danh
								sách loại phòng</span>
					</a></li>
				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="BookingController"> <i class="bi bi-file-earmark-check"></i><span>Quản
						lý đơn đặt phòng</span>
			</a></li>

			<!-- End Forms Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="AdminLogout"> <i class="bi bi-box-arrow-in-right"></i> <span>Đăng
						xuất</span>
			</a></li>
			<!-- End Login Page Nav -->

		</ul>
	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<div class="row">
				<div class="col-10">
					<h1>Quản lý phòng</h1>
					<nav>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
							<li class="breadcrumb-item active">Thêm phòng</li>
						</ol>
					</nav>
				</div>
				<div class="col-2">
					<a href="#" type="">
						<button class="btn btn-success">Thêm phòng</button>
					</a>
				</div>
			</div>
		</div>

		<!-- End Page Title -->
		<section class="section dashboard">
			<div class="row">
				<%
				String message = request.getParameter("message");
				if ("addSuccess".equals(message)) {
				%>
				<script type="text/javascript">
					alert('Thêm phòng thành công!');
					window.location.href = 'Room';
				</script>
				<%
				}
				%>
				<!-- Vertical Form -->
				<div class="card">
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/EditRoom"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="roomID" value="${RoomL.getRoomID()}">
							<div class="col-12">
								<label for="roomName" class="form-label">Tên Phòng</label> <input
									type="text" class="form-control" id="roomName" name="roomName"
									value="${RoomL.getRoomName()}" required>
							</div>
							<div class="col-12">
								<label for="roomTypeID" class="form-label">Loại Phòng</label> <select
									class="form-select" id="roomTypeID" name="roomTypeID">
									<option value="1">Lớn</option>
									<option value="2">Vừa</option>
									<option value="3">Nhỏ</option>
								</select>
							</div>
							<div class="col-12">
								<label for="price" class="form-label">Giá Phòng</label> <input
									type="number" class="form-control" id="price" name="price"
									value="${RoomL.getPrice()}" required>
							</div>
							<div class="col-12">
								<label for="maxPerson" class="form-label">Số Người Tối
									Đa</label> <input type="number" class="form-control" id="maxPerson"
									name="maxPerson" value="${RoomL.getMaxPerson()}" required>
							</div>
							<div class="col-12">
								<label for="roomImg" class="form-label">Chọn Ảnh Phòng</label> <input
									type="file" class="form-control" id="roomImg" name="roomImg">

								<!-- Hiển thị ảnh phòng cũ -->
								<div class="mt-2">
									<label>Ảnh hiện tại:</label> <img src="${RoomL.getRoomImg()}"
										alt="Ảnh phòng"
										style="width: 100px; height: 100px; object-fit: cover;">
								</div>
							</div>
							<div class="col-12">
								<label for="status" class="form-label">Trạng Thái</label> <select
									class="form-select" id="status" name="status">
									<option value="ConTrong">Còn Trống</option>
									<option value="DaDat">Đã Đặt</option>
								</select>
							</div>

							<button type="submit" class="btn btn-primary"
								onclick="return confirmUpdate()">Cập Nhật</button>
						</form>
					</div>
				</div>

			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<script>
		function confirmUpdate() {
			return confirm("Bạn có chắc chắn muốn cập nhật thông tin phòng này không?");
		}
	</script>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/chart.umd.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/quill.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/AdminFrontendAssets/js/main.js"></script>

</body>
</html>