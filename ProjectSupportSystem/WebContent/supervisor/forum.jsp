<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/font-awesome.min.css">	
<link rel="stylesheet" type="text/css" href="resources/styles/login.css" />
<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
<link rel="stylesheet" type="text/css"
	href="resources/styles/index.css" />	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery-3.1.1.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>	
<script type="text/javascript"
	src="resources/scripts/loadQuestionList.js"></script>


</head>
<body>

<div class="container-fluid">
	<div class="row">
		<jsp:include page="../_header.jsp" />
	</div>
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="../_leftSideBarCoordinator.jsp" />
		</div>
	<div class="col-md-10">
		<center>
		<div id="formload">
		<div ng-app="myApp" ng-controller="MyController1">
			<br/>
			<p>Search: <input ng-model="f.quest"> </p>
			
			<br/>
			<br/>
			<div ng-repeat="x in quest | filter:f">
				<table class="table table-striped">
					<tr >
						<td><b>{{x.quest}}</b> (Posted by {{x.userName}})</td>
					</tr>
					<tr>
						<td>{{x.reply}}</td>
					</tr>
						
					
								
				</table>
			</div>
			
		</div>
		</div>	
			
		</center>			
				
		</div>
	</div>
</div>	
	
	
</body>
</html>	
	