<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"> </script>


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"> </script>
<script type="text/javascript"
	src="resources/scripts/loadStudentList.js"></script>

<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>
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

	<div id="formload" ng-app="myApp">
			<div class="row">
			<button class="btn btn-primary col-md-12"> Dissertation submitted student List</button>
			</div>
			<div class="row" ng-controller="DissertationSubmitted">
			<p>Search: <input ng-model="f.studentId"> </p><a href="GenerateDissSubmittedList" target="_blank"> Generate Pdf </a>
				<div class="table table-responsive">
				 
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Evaluation</th>
								<th>Marks Obtained</th>
								<th>StudentId</th>
								
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="z in disArray | filter:f">
								<td ng-if="z.total > 0"> <button class="btn btn-success btn-xs"> Marked </button> </td>
								<td ng-if="z.total <= 0"> <button class="btn btn-warning btn-xs"> Not Marked </button> </td>
								<td>{{z.total}}</td>
								<td> <a href="ShowStudentSubmissions?stuID={{z.studentId}}" target="_blank"> {{z.studentId}} </a></td>
								
								
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				<div class="row" ng-controller="DissertationNotSubmitted">
					<button class="btn btn-danger col-md-12"> Dissertation not submitted student list (Automatically Blocked by the System) </button>
					<div class="table table-responsive">
				 
					<table class="table table-striped">
						<thead>
							<tr>
								<th>NIC</th>
								<th>E-Mail</th>
								<th>TelephoneNo </th>
								<th>IndexNo</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="y in notDisArray">
								<td>{{y.nic}}</td>
								<td>{{y.email}}</td>
								<td>{{y.telephoneNo }}</td>
								<td><a> {{y.studentId}} </a></td>

							</tr>
						</tbody>
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>