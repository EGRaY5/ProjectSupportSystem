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
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script type="text/javascript" src="resources/scripts/insertVivaMember.js"></script>
</head>
<body>
	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftSideBarAdmin.jsp" />
	
	<div class="col-md-10">  
		<div id="student" style="height:500px;">
			<form class="form-horizontal">
						
 				<div class="container-fluid" id="formload">
					<div id="dashboard" ng-app="myApp">
		
 						<div class="container-fluid spacing"> 
							<button type="button" class="btn btn-primary col-sm-12"
								data-toggle="" data-target="#message">Add Viva Panel Member </button>
							<div id="viva" class="" ng-controller="messageController"
								ng-init="displayUsers()" style="margin-top: 50px;">
						
						
					  	<div class="form-group">
					    	<label for="" class="col-sm-3 control-label"> Examinazation ID: </label>
					    	<div class="col-sm-9"><input ng-model="viva.id" type="text" class="form-control" id="examid" placeholder="Examinazation ID"> </div>
					  	</div>
					  	<div class="form-group">
					    	<label for="InputLastName" class="col-sm-3 control-label"> Frist Name: </label>
					    	<div class="col-sm-9"><input ng-model="viva.fname" type="text" class="form-control" id="firstname" placeholder="Frist Name"> </div>
					  	</div>
					  	
					  	<div class="form-group">
					    	<label for="" class="col-sm-3 control-label"> Last Name: </label>
					    	<div class="col-sm-9"><input ng-model="viva.lname" type="text" class="form-control" id="lastname" placeholder="Last Name"> </div>
					  	</div>
					  	<div class="form-group">
					    	<label for="InputEmail" class="col-sm-3 control-label"> E-mail: </label>
					    	<div class="col-sm-9"><input ng-model="viva.email" type="email" class="form-control" id="email" placeholder="E-mail"> </div>
					  	</div>
					  	<div class="form-group">
					    	<label for="" class="col-sm-3 control-label"> Department: </label>
					    	<div class="col-sm-9"><input ng-model="viva.department" type="text" class="form-control" id="department" placeholder="Department"> </div>
					  	</div>
					  	<div class="form-group">
					    	<label for="" class="col-sm-3 control-label">Role in Exam: </label>
 							<div class="col-sm-8"  required> 
								<select name="role" class="form-control form-control-lg" ng-model="viva.role">
  								<option value="senior">Senior Lecturer</option>
  								<option value="assistance">Assistance Lecturer</option>
  								</select>
							</div> 
					  	</div>
					  	<br>
					  	<div align="center">					  	 			  	
					  	<button type="button" class="btn btn-success" style="margin-right: 50px;" ng-click="insertVivaMember()">Add</button>
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