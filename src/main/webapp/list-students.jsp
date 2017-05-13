<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.footer-basic-centered {
	background-color: #292c2f;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	font: normal 18px sans-serif;
	padding: 45px;
	margin-top: 80px;
}

.footer-basic-centered .footer-company-motto {
	color: #8d9093;
	font-size: 24px;
	margin: 0;
}

.footer-basic-centered .footer-company-name {
	color: #8f9296;
	font-size: 14px;
	margin: 0;
}
</style>

<title>Student Tracker App</title>

<!-- Latest compiled and minified CSS -->
<link type="text/css" rel="stylesheet" href="css/style-sheet.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="jumbotron">
		<h1 style="text-align: center">A Manohar Production</h1>
		<p style="text-align: center">Welcome to Our Student Management
			Application</p>
	</div>
	<div class="container theme-showcase">
		<div class="page-header">

			<form class="navbar-form" role="search" action="students" method="GET">
				<div class='btn-group'>
					<button type='button' class='btn btn-primary'
						onclick="window.location.href='add-student-form.jsp'; return false;">Add
						Students</button>
				</div>
				<input type="hidden" name="command" value="SEARCH" />
				<div class="input-group add-on col-md-push-8">
					<input class="form-control" placeholder="Search" name="search"
						id="srch-term" type="text" name="searchName">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-info">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
					</div>
				</div>
			</form>
		</div>
		<div class="container" class="row">
			<div id="content" class="col-md-8 col-md-push-2">
				<table class="table table-bordered table-striped text-center">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${studentList}" var="tempStudent">
							<c:url var="tempLink" value="students">
								<c:param name="command" value="LOAD" />
								<c:param name="studentId" value="${tempStudent.id}" />
							</c:url>
							<c:url var="deleteLink" value="students">
								<c:param name="command" value="DELETE" />
								<c:param name="studentId" value="${tempStudent.id}" />
							</c:url>
							<tr>
								<td>${tempStudent.id}</td>
								<td>${tempStudent.firstName}</td>
								<td>${tempStudent.lastName}</td>
								<td>${tempStudent.email}</td>
								<td><a href="${tempLink}"><button type="button"
											class="btn btn-sm btn-link">Update</button></a> | <a
									href="${deleteLink}"
									onclick="if(!(confirm('Are You Sure To Delete This User!!'))) return false"><button
											type="button" class="btn btn-sm btn-link">Delete</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<c:if test="${requestScope.viewBackButton ne 'false'}">
		<a href="students"><button type="button"
				class="btn btn-lg btn-success">Back To Student List</button></a></c:if>
	</div>
	<footer class="footer-basic-centered">
	<p class="footer-company-motto">We Are Here To Serve and Create
		Better Future</p>

	<p class="footer-company-name">&copy; Again A Manohar, Inc. 2017</p>
	</footer>
</body>
</html>