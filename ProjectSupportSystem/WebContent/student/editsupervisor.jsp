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
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="resources/scripts/bitstudent.js"></script>
<script type="text/javascript" src="resources/scripts/loadSubmission.js"></script>

</head>
<body>
<div class="container-fluid"> <!--full container start-->
	<div class="row"><!--header row start-->
		<!-- adding header -->
		<jsp:include page="../_header.jsp" />
	</div><!--header row end-->
	<div class="row"><!-- content row start-->
		<div class="col-md-2"><!--sidebar col start-->
			<!-- Adding leftSideBar -->
			<jsp:include page="../_leftSideBarStudent.jsp" />
		</div><!--sidebar col end-->
		<div class="col-md-10">
		<br>
			<div class="row">
				<div class="col-md-1"></div>
					<div class="col-md-9" style="background-color:#EEEEEE;">
						<div class="changer" id="formload">
							<div class="input-data">
							<form class="form-horizontal" method="POST" action="DoEditSupervisor"
								enctype="multipart/form-data" name="sup">
								<c:if test="${param.success eq 1}">
								<br>
									<div class="alert alert-success">
										<strong>Successfully Updated !</strong>
									</div>
								</c:if>
								<c:if test="${param.success eq 0}">
									<div class="alert alert-warning">
										<strong>Successfully Updated !</strong>
									</div>
								</c:if>
								<center>
									<h4><u>Supervisor/Advisor Agreement</u></h4>
									<h4>${timeRemainingSup} </h4>
								</center>
								<div ng-app="myApp" ng-controller="SupController">
									<div class="form-group">
										<label for="InputFirstName" class="col-sm-3 control-label">First
											Name:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="firstName"
												id="firstName" value="{{supervisor.firstName}}"
												ng-disabled="state" required ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="InputLastName" class="col-sm-3 control-label">Last
											Name:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="lastName"
												id="lastName" value="{{supervisor.lastName}}"
												ng-disabled="state" required ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="InputEmail" class="col-sm-3 control-label">E-Mail:</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" name="email" id="email"
												value="{{supervisor.email}}" ng-disabled="state" required
												ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="InputTeleNo" class="col-sm-3 control-label">Mobile:</label>
										<div class="col-sm-9">
											<input type="number" class="form-control" name="mobileNo"
												id="mobileNo" value="{{supervisor.mobileNo}}"
												ng-disabled="state" ng-minlength=10 ng-maxlength=10 required
												ng-init="state=true">
											<span style="color:red;" class="error" ng-show="sup.mobileNo.$error.number">Not a Number</span>
										</div>
									</div>
									<div class="form-group">
										<label for="InputTeleNo" class="col-sm-3 control-label">Address
											Line 1:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="addressLine1"
												id="addressLine1" value="{{supervisor.addressLine1}}"
												ng-disabled="state" required ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="InputTeleNo" class="col-sm-3 control-label">Address
											Line 2:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="addressLine2"
												id="addressLine2" value="{{supervisor.addressLine2}}"
												ng-disabled="state" required ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="InputTeleNo" class="col-sm-3 control-label">City:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="city" id="city"
												value="{{supervisor.city}}" ng-disabled="state" required
												ng-init="state=true">
										</div>
									</div>
									<div class="form-group">
										<label for="Inputform" class="col-sm-3 control-label">Submited
											Form: </label>
										<div class="col-sm-9">
											<input type="file" name="agreementForm" ng-disabled="state"
												required ng-init="state=true">
											<p class="help-block col-sm-12">"*filename:
												supervisorAgreementForm.pdf"</p> <br/>
											
											<p class="help-block col-sm-12"> 
											<a href="DownloadSupervisorFrom" target="_blank"> Uploaded:
													{{supervisor.agreementFormPath}} </a>
											</p>
											
										</div>
									</div>
				
				
				
									<button type="submit" class="btn btn-default">Save</button>
									<a class="btn btn-default" ng-click="state=false"> Edit </a> 
									<a class="btn btn-default" href="DeleteSupervisor"> Delete </a>
								</div>
							</form>
				
						</div>


	</div>
</div>
</div>
</div>
</div><!--content row end-->
</div><!--full container end-->
</body>
</html>

