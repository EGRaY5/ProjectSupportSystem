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
<!-- Css for forum  -->	
<link rel="stylesheet" type="text/css"
	href="resources/styles/index.css" />	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery-3.1.1.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Angular link to run angular -->	
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<!-- Javascript created to run angular -->		
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
		<!-- Angular ng-app and ng-controller in loadQuestionList.js is added here -->
		<div ng-app="myApp" ng-controller="MyController1">
			<br/>
			<!-- Input given in search is filtered from quest in loadQuestionList.js scope.quest -->
			<p>Search: <input ng-model="f.quest"> </p>
			<form class="navbar-form " action="ShowAskQuestion">
				<div class="row">
				      
				      <div class="col-sm-3 col-md-6 col-lg-4" >
							
						<center><button type="submit"  class="btn btn-default" > Ask Question </button></center>
				
					</div>
				</div>
			</form>
			<br/>
			<br/>
			<!-- One row by row from table in database stored as quest in loadQuestionList.js is taken and added -->
			<div ng-repeat="x in quest | filter:f">
				<table class="table table-striped">
					<tr >
						<!-- Data loaded from angular is displayed like below inside{} and is given by names in Answer Services -->
						<td><b>{{x.quest}}</b> (Posted by {{x.userName}})</td>
					</tr>
					<tr>
						<td>{{x.reply}}</td>
					</tr>
						
					<tr>				
						<td>
							<a href="ShowReply">Reply</a>
						</td>
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
	