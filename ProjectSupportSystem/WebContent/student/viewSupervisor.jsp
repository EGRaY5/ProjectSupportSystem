<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/scripts/bitstudent.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


</head>
<body>
<script>
var app = angular.module('myApp', []);

app.controller('MyController',function($scope,$http){
		//console.log('angular efef eff');
        $scope.getDataFromServer = function() {
                $http({
                        method : 'GET',
                        url : 'http://localhost:8080/ProjectSupportSystem/DoViewSupervisor'
                }).then(function successCallback(response) {
                        $scope.supervisor = response.data;
                        console.log('sucess');
                } ,function errorCallback(response){
                        console.log('error');
                });

        };
});

</script>
	
	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftSideBarStudent.jsp"/>
	
	<div class="changer" id="formload">
		<div ng-app="myApp" ng-controller="MyController" id="addsupervisor">

			<c:if test="${param.success eq 1}">
				<div class="alert alert-success">
					<strong>Successfully Updated !</strong>
				</div>
			</c:if>
			<c:if test="${param.success eq 0}">
				<div class="alert alert-warning">
					<strong>Successfully Updated !</strong>
				</div>
			</c:if>
			<button ng-click="getDataFromServer()"> view </button> &nbsp;&nbsp;&nbsp;
			<a href="EditSupervisorView"> Edit </a> &nbsp;&nbsp;&nbsp; <a href="DeleteSupervisor"> delete   </a>
			<div class="table table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>FirstName</th>
							<th>LastName</th>
							<th>E-mail</th>
							<th>Mobile No</th>
							<th>AddressLine1</th>
							<th>AddressLine2</th>
							<th>City</th>
							<th>Path</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{{supervisor.firstName}}</td>
							<td>{{supervisor.lastName}}</td>
							<td>{{supervisor.email}}</td>
							<td>{{supervisor.mobileNo}}</td>
							<td>{{supervisor.addressLine1}}</td>
							<td>{{supervisor.addressLine2}}</td>
							<td>{{supervisor.city}}</td>
							<td><a href="DownloadSupervisorFrom" target="_blank">
									{{supervisor.agreementFormPath}} </a></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>


	</div>


</body>
</html>
