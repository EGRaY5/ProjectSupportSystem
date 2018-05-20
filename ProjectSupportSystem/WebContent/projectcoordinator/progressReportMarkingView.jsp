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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="resources/scripts/loadSubmission.js"></script>




<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>

</head>
<body>

	<%-- <jsp:include page="../_header.jsp" />  --%>
	<%-- <jsp:include page="../_leftSideBarCoordinator.jsp" /> --%>
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-inverse navbar-fixed-top">

			<div class="navbar-header">
				<a class="navbar-brand" href="#">UCSC </a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#"> You are logged in as: ${user.userName} </a></li>
				<li><a href="#">${student.fullName} </a></li>

				<li><a href="#"> ${student.studentId}</a>
			</ul>

			</nav>
		</div>

		<div class="row">
			<div class="sm-12" id="topspace"></div>
		</div>

		<div class="row">
			<div class="col-sm-1"></div>

			<div class="col-sm-6">
				<div id="progressreport1">
					<form class="form-horizontal">
						<c:if test="${param.success eq 1}">
							<div class="alert alert-success">
								<strong>Successfully Updated! </strong>
							</div>
						</c:if>
						<c:if test="${param.success eq 0}">
							<div class="alert alert-warning">
								<strong> Something went wrong! </strong>
							</div>
						</c:if>

						<h4>PROGRESS REPORT NO: ${reportNo}</h4>

						<div>
							<div class="form-group col-sm-12">
								<input type="hidden" name="reportNo" id="reportNo"
									value="${reportNo}" />
							</div>
							<div class="form-group col-sm-12">
								<label for="exampleTextarea">Work carried out between
									this meeting and previous meeting: </label> <select
									class="form-control" name="workCarried" disabled>
									<option>${progressreport.workCarried}</option>
									<option>Feasibility Study</option>
									<option>Find a project and meet client</option>
									<option>Gather client requirements</option>
									<option>Define scope</option>
									<option>Define users and use cases</option>
									<option>Requirement Analysis</option>
									<option>Client Feedback</option>
									<option>UI-Design</option>
									<option>UI-Development</option>
									<option>Back-end Development</option>
									<option>Testing</option>


								</select>
							</div>
							<div class="form-group col-sm-12">
								<label for="exampleTextarea">Describe the above task: </label>
								<textarea class="form-control" id="exampleTextarea" rows="3"
									name="description" disabled>${progressreport.describe}</textarea>
							</div>
							<div class="form-group col-sm-12">
								<label for="exampleTextarea">Problems Encountered: </label>
								<textarea class="form-control" id="exampleTextarea" rows="3"
									name="problems" disabled>${progressreport.problems}</textarea>
							</div>
							<div class="form-group col-sm-12">
								<label for="exampleTextarea">Planned work that were
									unable to carry out with reasons: </label>
								<textarea class="form-control" id="exampleTextarea" rows="3"
									name="workPlannedButNotDone" disabled>${progressreport.workPlannedButNotDone}</textarea>
							</div>
							<div class="form-group col-sm-12">
								<label for="exampleTextarea">Work planned until next
									meeting: </label> <select class="form-control" name="workPlanned"
									disabled>
									<option>${progressreport.workPlanned}</option>
									<option>Testing</option>
									<option>Feasibility Study</option>
									<option>Find a project and meet client</option>
									<option>Gather client requirements</option>
									<option>Define scope</option>
									<option>Define users and use cases</option>
									<option>Requirement Analysis</option>
									<option>Client Feedback</option>
									<option>UI-Design</option>
									<option>UI-Development</option>
									<option>Back-end Development</option>


								</select>

							</div>





						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<div class=col-sm-4>
				<div class="container-fluid">
					<button type="button" class="btn btn-primary col-sm-12"
						data-target="#progressList">Marks Obtained</button>

					<div id="progressList" ng-app="myApp" ng-controller="progressReportMarkController" ng-init="displayDataPR();">
						<form class="systemMarks">
							<div class="form-group">
								<label for="showmarks" class="col-sm-12 control-label">
								</label> <br /> <input type="text" class="form-control" name="prmarks" ng-disabled="state"
									ng-init="state=true" value="{{marks}}" required style="margin-top: 40px;">
							</div>
						</form>

						<form class="manualMarks" style="margin-top: 50px;">
							<div class="form-group col-sm-12">
								<input type="hidden" name="reportNo" id="reportNo"
									value="${reportNo}" ng-model="prMark.reportNo" />
							</div>
							<div class="form-group col-sm-12">
								<input type="hidden" name="reportNo" id="reportNo"
									value="${studentId}" ng-model="prMark.studentId" />
							</div> 
							<div class="form-group">
								<label for="showmarks" class="col-sm-12 control-label">
									Insert Marks Manually:</label> <br /> <input type="text"
									class="form-control" ng-model="prMark.mark" required>
							</div>
							<button type="button" class="btn btn-primary" ng-click="insertProgressReportMarks()">Insert</button>
						</form>

					</div>

				</div>
			</div>

		</div>






	</div>