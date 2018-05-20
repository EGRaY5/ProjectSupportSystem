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
<script type="text/javascript"
	src="resources/scripts/loadStudentListofSupervisor.js"></script>

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
		<jsp:include page="../_leftSideBarSupervisor.jsp" />
	</div>
	<div class="col-md-10">
	<div id="formload">
			<div ng-app="myApp" ng-controller="MyController">
			<br/>
			<br>
			
				<div class="table table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>IndexNo</th>
								<th>NIC</th>
								<th>Full Name</th>
								<th>Initials</th>
								<th>SurName</th>
								<th>E-Mail</th>
								<th>Telephone No</th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="x in myArray | filter:f">
								 <td><a href="ShowStudentSubmissions?stuID={{x.studentId}}" target="_blank"> {{x.studentId}} </a></td>
								<td>{{x.nic}}</td>
								<td>{{x.fullName}}</td>
								<td>{{x.initial}}</td>
								<td>{{x.surName}}</td>
								<td>{{x.email}}</td>
								<td>{{x.telephoneNo}}</td>

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