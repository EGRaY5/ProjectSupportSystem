<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title> BIT-University of Colombo School of Computing - Project Evaluation Support System </title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/styles/admin.css"/> 	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="resources/scripts/insertUser.js"></script>
</head>

<body>
	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftSideBarAdmin.jsp" />
	<div id="loginedUser">
		<p>You are logged in as: ${user.userName}</p>
	</div>
	<div class="col-md-10">  
		<div id="student" style="height:1000px;">
			<form class="form-horizontal" >
				
				<div class="container-fluid" id="formload">
					<div id="dashboard" ng-app="myApp">
		
 						<div class="container-fluid spacing"> 
							<button type="button" class="btn btn-primary col-sm-12"
								data-toggle="" data-target="#message">Create Account </button>
							<div id="user" class="" ng-controller="messageController"
								ng-init="displayUsers()" style="margin-top: 50px;">
						<form class="form-horizontal">
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">User
								Name: </label>
							<div class="col-sm-8">
								<input type="text" value="${newUser.userName}"class="form-control"
									ng-model="user.name" required>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Password: </label>
							<div class="col-sm-8">
								<input type="text" value="${newUser.position}"class="form-control"
									ng-model="user.password" required>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Position: </label>
 							<div class="col-sm-8"  required> 
								<select name="role" class="form-control form-control-lg" ng-model="user.position">
								<option>---select position---</option>
  								<option value="coordinatr">Project Coordinator</option>
  								<option value="assistance">Project Assistance Coordinator</option>
  								</select>
							</div> 
						</div>
						<input type="button" class="btn btn-default" value="SAVE"
							ng-click="insertUserData()" > 
					</form>
					<button type="button" class="btn btn-primary col-sm-12"
								data-toggle="" data-target="#message">Edit and Delete Account </button>
 					<div class="table table-responsive"> 
						<table class="table table-striped">
							<thead>
								<tr>
									<th>User Name</th>
									<th>Password </th>
									<th>Position</th>
									<th>Delete</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="z in myArray2">
									<td>{{z.userName}}</td>
									<td>{{z.password}}</td>
									<td>{{z.position}}</td>
									<td><button ng-click="deleteUser(z.userName)" class="btn btn-danger btn-xs">Delete</button></td>
									<td><a type="button" href="EditUsers?uName={{z.userName}}" class="btn btn-success btn-xs" >Edit</button></td>
								</tr>
							</tbody>
						</table>
						</div>

					</div>
				</div>
		
		
		</div>
		</div>
		
					  	
					</form>
				</div>
			</div>
</body>
</html>