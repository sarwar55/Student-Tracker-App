<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Student</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="jumbotron">
		<h1 style="text-align: center">A Manohar Production</h1>
		<p style="text-align: center">Welcome to Our Student Management
			Application</p>
	</div>
	<div class="container">
		<div class="row clearfix"></div>
		<h3 style="text-align: center">
			<i>Add Student Here</i>
		</h3>
		<form role="form" action="students" method="POST">
			<input type="hidden" name="command" value="ADD">
			<div class="form-group row">
				<label for="inputFirstName" class="col-sm-2 col-form-label">First
					Name</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputFirstName"
						name="firstName" placeholder="Manohar">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputLastName" class="col-sm-2 col-form-label">Last
					Name</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputLastName"
						name="lastName" placeholder="Reddy Annapureddy">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="inputEmail"
						name="email" placeholder="Email">
				</div>
			</div>
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-12">
					<button type="submit" class="btn btn-lg btn-primary pull-right">Add
						Student</button>
				</div>
			</div>
		</form>
		<a href="students"><button type="button"
				class="btn btn-lg btn-success">Back To Student List</button></a>
	</div>
	<footer class="footer-basic-centered">
	<p class="footer-company-motto">We Are Here To Serve and Create
		Better Future</p>

	<p class="footer-company-name">&copy; Again A Manohar, Inc. 2017</p>
	</footer>
</body>
</html>