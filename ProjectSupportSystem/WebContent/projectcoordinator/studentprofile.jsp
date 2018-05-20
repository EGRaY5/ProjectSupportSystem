<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/projectcoordinator.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="resources/scripts/loadSubmission.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">UCSC </a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="#"> You are logged in as: ${user.userName} </a></li>
			<li><a href="#">${student.fullName} </a></li>

			<li><a href="#"> ${student.studentId}</a>
		</ul>
	</div>
	</nav>
	<div class="col-sm-6 col-md-4 col-lg-3 mt-4">
		<div class="card">
			 <img class="img-responsive picture" src="http://www.kusalimika.ch/file/2017/02/avaar.jpg">
			<div class="card-block">

				<h4 class="card-title mt-3">Zahir patel</h4>
				<div class="meta">
					<h5>India, 22 ans</h5>

				</div>

			</div>
			<div class="card-footer">

				<div class="icon pull-right">
					<a href="#"><i class="fa fa-envelope fa-fw fa-2x"
						aria-hidden="true"></i></a> <a href="#"><i class="fa fa-ban fa-2x"
						aria-hidden="true"></i></a>

				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6">
	
 	</div>
	
</body>
</html>