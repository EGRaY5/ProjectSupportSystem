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

<div class="container-fluid">

<div class="row">
	<jsp:include page="_header.jsp" />
</div>
<div class="row">
<div class="col-md-2">
<jsp:include page="_leftSideBarSupervisor.jsp"/> 
</div>

<div class="col-md-10">
					
	  <div id="formload">
		<div ng-app="myApp" ng-controller="MyController" ng-init="getDataFromServer()" id="addsupervisor">

			
			
			<!-- <button ng-click="getDataFromServer()"> view </button> &nbsp;&nbsp;&nbsp; -->
			
			<div class="table table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="col-xs-4"></th>
							<th class="col-xs-8"></th>
							
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>FirstName</label></td>
							<td>{{supervisor.firstName}}</td>
					   </tr>
					   <tr>
							<td><label>LastName</label></td>
							<td>{{supervisor.lastName}}</td>
					   </tr>
					   <tr>
							<td><label>E-mail</label></td>
							<td>{{supervisor.email}}</td>
					   </tr>
					   <tr>
							<td><label>mobile No</label></td>
							<td>{{supervisor.mobileNo}}</td>
					   </tr>
					   <tr>
							<td><label>AddressLine1</label></td>
							<td>{{supervisor.addressLine1}}</td>
					   </tr>
					   <tr>
							<td><label>AddressLine2</label></td>
							<td>{{supervisor.addressLine2}}</td>
					   </tr>
					   <tr>
							<td><label>City</label></td>
							<td>{{supervisor.city}}</td>
					   </tr>
					   
					   
					   
					   
					   
					   
					   
					</tbody>
				</table>
			</div>
		<a href="EditSupervisorView" class="btn btn-info" role="button">edit</a>
		&nbsp;&nbsp;
		<a href="DeleteSupervisor" class="btn btn-danger" role="button">delete</a>
		</div>

	</div>
	</div>
</div>
</div>
			
 <script>
var app = angular.module('myApp', []);

app.controller('MyController',function($scope,$http){
		//console.log('angular efef eff');
        $scope.getDataFromServer = function() {
                $http({
                        method : 'GET',
                        url : 'http://localhost:8080/ProjectSupportSystem/DoViewSupervisorDetails'
                }).then(function successCallback(response) {
                        $scope.supervisor = response.data;
                        console.log('sucess');
                } ,function errorCallback(response){
                        console.log('error');
                });

        };
});

</script> 	  				
		
		
	
	



</body>
</html>
