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
			<a href="Dashboard" class="logo d-flex align-items-center"> <img
				src="/img/logo.png" alt=""> <span class="d-none d-lg-block">Hotel
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

			<li class="nav-item"><a class="nav-link " href="Dashboard">
					<i class="bi bi-grid"></i> <span>Dashboard</span>
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
							<li class="breadcrumb-item active">Danh sách phòng</li>
						</ol>
					</nav>
				</div>
				<div class="col-2">
					<a href="RoomView/AddRoom.jsp" type="">
						<button class="btn btn-success">Thêm phòng</button>
					</a>
				</div>
			</div>
		</div>
		<section class="section dashboard">
			<div class="row">
				<%
				String message = request.getParameter("message");
				if ("deleteSuccess".equals(message)) {
				%>
				<script type="text/javascript">
					alert('Xóa phòng thành công!');
					window.location.href = 'Room';
				</script>
				<%
				}
				%>
				<%
				if ("updateSuccess".equals(message)) {
				%>
				<script type="text/javascript">
					alert('Sửa phòng thành công!');
					window.location.href = 'Room';
				</script>
				<%
				}
				%>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Tên phòng</th>
							<th scope="col">Loại phòng</th>
							<th scope="col">Ảnh phòng</th>
							<th scope="col">Giá phòng</th>
							<th scope="col">Số người tối đa</th>
							<th scope="col">Tình trạng</th>
							<th scope="col">Tác vụ</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Room> room = (ArrayList<Room>) request.getAttribute("roomList");
						for (Room roomL : room) {
						%>
						<tr>
							<th scope="row"><%=roomL.getRoomID()%></th>
							<td><%=roomL.getRoomName()%></td>
							<td>
								<%
								int rType = roomL.getRoomTypeID();
								String displayType = "";

								if (rType == 1) {
									displayType = "Phòng lớn";
								} else if (rType == 2) {
									displayType = "Phòng vừa";
								} else if (rType == 3) {
									displayType = "Phòng nhỏ";
								}
								%> <%=displayType%>
							</td>
							<td><img
								src="<%=((HttpServletRequest) request).getContextPath() + "/" + roomL.getRoomImg()%>"
								alt="Ảnh phòng"
								style="width: 100px; height: 100px; object-fit: cover;"></td>
							<td><%=roomL.getPrice()%></td>
							<td><%=roomL.getMaxPerson()%></td>
							<td>
								<%
								String status = roomL.getStatus();
								String displayStatus = "";

								if ("ConTrong".equals(status)) {
									displayStatus = "Còn Trống";
								} else if ("DaDat".equals(status)) {
									displayStatus = "Đã Đặt";
								} else {
									displayStatus = "Không xác định"; // trường hợp nếu có giá trị khác
								}
								%> <%=displayStatus%>
							</td>
							<td>
								<form action="${pageContext.request.contextPath}/EditRoom"
									method="get" style="display: inline; margin-right: 10px;">
									<input type="hidden" name="roomID"
										value="<%=roomL.getRoomID()%>">
									<button type="submit" class="btn btn-primary text-white">
										<i class="bi bi-pencil-square"></i>
									</button>
								</form>
								<form action="${pageContext.request.contextPath}/DelRoom"
									method="post" style="display: inline;"
									onsubmit="return confirmDelete(event, '<%= roomL.getRoomID() %>');">
									<input type="hidden" name="roomID"
										value="<%=roomL.getRoomID()%>">
									<button type="submit" class="btn btn-danger text-white">
										<i class="bi bi-trash3"></i>
									</button>
								</form>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
		<!-- End Page Title -->

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
		function confirmDelete(event, roomID) {
			// Hiển thị hộp thoại xác nhận
			const isConfirmed = confirm(`Bạn có chắc chắn muốn xóa phòng không?`);

			// Nếu người dùng không đồng ý, ngăn gửi form
			if (!isConfirmed) {
				event.preventDefault();
				return false;
			}
			return true; // Cho phép gửi form
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