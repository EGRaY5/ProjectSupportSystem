
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
<script type="text/javascript" src="resources/scripts/loadSubmission.js"></script>


</head>
<body>
<div class="container-fluid"> <!--full container start-->
<div class="row"><!--header row start-->
	<jsp:include page="../_header.jsp" />
</div><!--header row end-->
<div class="row"><!-- content row start-->
<div class="col-md-2"><!--sidebar col start-->
	<jsp:include page="../_leftSideBarStudent.jsp" />
</div><!--sidebar col end-->
<div class="col-md-10">
<br>
	<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-9"style="background-color:#EEEEEE;">
	<div class="changer" id="formload">
			<form class="form-horizontal" method="POST"
				action="DoEditProjectProposal">
				 <!--  alerts -->
				<c:if test="${param.success eq 1}">
				<br/>
					<div class="alert alert-success">
						<strong>Successfully Updated !</strong>
					</div>
				</c:if>
				<c:if test="${param.success eq 0}">
					<div class="alert alert-warning">
						<strong>Something went wrong !</strong>
					</div>
				</c:if>
				      <!-- alerts -->
				<center>
					<h4><u>Project Details</u></h4>
					<h4> ${timeRemainingProposal } </h4>
				</center>
				<div ng-app="myApp">
					<div ng-controller="ProposalController">
						<div class="form-group">
							<label for="projectTitle" class="col-sm-3 control-label">
								Project Title: </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="projectTitle"
									placeholder="Project Title" value="{{proposal.projectTitle}}"
									ng-disabled="state" ng-init="state=true" required>
							</div>
						</div>
						<div class="form-group">
							<label for="projectTitle" class="col-sm-3 control-label">
								Number of Attempts: </label>
							<div class="col-sm-9">
								<input type="number" class="form-control" name="noOfAttempts"
									placeholder="No of attempts (If repeat Student)"
									value="{{proposal.noOfAttempts}}" ng-disabled="state"
									ng-init="state=true" required>
							</div>
						</div>
						<div class="form-group">
							<label for="previousDecision" class="col-sm-3 control-label">
								previous Decision: </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="previousDecision"
									placeholder="Previous Decision(if repeat student)"
									value="{{proposal.previousDecision}}" ng-disabled="state"
									ng-init="state=true" required>
							</div>
						</div>
						<div class="form-group">
							<label for="earlierTitle" class="col-sm-3 control-label">
								Earlier Project Title: </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="earlierTitle"
									placeholder="Earlier Project Title(if repeat student)"
									value={{proposal.earlierProjectTitle}} ng-disabled="state"
									ng-init="state=true" required>
							</div>
						</div>
						<div class="form-group">
							<label for="motivationForProject" class="col-sm-3 control-label">
								Motivation for the Project: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="motivation" rows="3"
									placeholder="Motivation for the project" ng-disabled="state"
									ng-init="state=true" required>{{proposal.motivation}}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="Objectives" class="col-sm-3 control-label">
								Objectives: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="objectives" rows="3"
									placeholder="Objectives" ng-disabled="state"
									ng-init="state=true" required>{{proposal.objectives}}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="scope" class="col-sm-3 control-label"> Scope:
							</label>
							<div class="col-sm-9">
								<textarea class="form-control" name="scope" rows="3"
									placeholder="Scope of the project" ng-disabled="state"
									ng-init="state=true" required>{{proposal.scope}}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="functionlities" class="col-sm-3 control-label">
								Critical functionalities: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="funtionalities" rows="3"
									placeholder="Critical Functionalaties of for project"
									ng-disabled="state" ng-init="state=true" required>{{proposal.functionalities}}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="deliverables" class="col-sm-3 control-label">
								Critical functionalities: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="deliverables" rows="3"
									placeholder="Deliverables are Items that you would deliver to the client at the end of the project"
									ng-disabled="state" ng-init="state=true" required>{{proposal.deliverables}}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="resources" class="col-sm-3 control-label">
								Resource Requirements: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="resources" rows="3"
									placeholder="Eg : hardware,software, ...." ng-disabled="state"
									ng-init="state=true" required>{{proposal.resources}}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="evaluation" class="col-sm-3 control-label">
								Self-Evaluation: </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="evauation" rows="3"
									placeholder="Proposed way of self evaluating the success of your system"
									ng-disabled="state" ng-init="state=true" required>{{proposal.evaluation}}</textarea>
							</div>
						</div>
					

					<div class="form-group" ng-controller="PlanController">
						<table class="table table-bordered">
							<thead>
								<tr class="warning">
									<th>Step</th>
									<th>Starting-Date</th>
									<th>Ending Date</th>
								</tr>
							</thead>
							<tbody>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr1">
											<option>Find a project and meet client</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate1}}" id="sdate1"
										name="sdate1" ng-disabled="state" ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate1"
										name="edate1" ng-disabled="state" ng-init="state=true"
										required></td>



								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr2">
											<option>Feasibility Study</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate2}}"
										id="example-date-input" name="date2" ng-disabled="state"
										ng-init="state=true"required"></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate2"
										name="edate2" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- <option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option>
 -->

								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr3">
											<option>Gather client requirements</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate3}}"
										id="example-date-input" name="sdate3" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate3"
										name="edate3" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- <option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option>
 -->

								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr4">
											<option>Define scope</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate4}}"
										id="example-date-input" name="sdate4" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate4"
										name="edate4" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- <option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option> -->


								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr5">
											<option>Define users and use cases</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate5}}"
										id="example-date-input" name="sdate5" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate5"
										name="edate5" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- 		<option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option>

								</select></td> -->
								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr6">
											<option>Requirement Analysis</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate6}}"
										id="example-date-input" name="sdate6" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate6"
										name="edate6" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- 	<option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option>

								</select></td> -->
								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr7">
											<option>UI-Design</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate7}}"
										id="example-date-input" name="sdate7" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate7"
										name="edate7" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- <option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>
										<option>Testing</option>

								</select></td> -->
								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr8">
											<option>UI-Development</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate8}}"
										id="example-date-input" name="sdate8" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate8"
										name="edate8" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- 	<option>Feasibility Study</option
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>Back-end Development</option>
										<option>Testing</option>

								</select></td> -->
								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr9">
											<option>Back-end Development</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate9}}"
										id="example-date-input" name="sdate9" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate10"
										name="edate9" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- 	<option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Testing</option>

								</select></td> -->
								</tr>
								<tr class="info">
									<td class="col-sm-6"><select class="form-control"
										name="pr10">
											<option>Testing</option>
									</select></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.startingDate10}}"
										id="example-date-input" name="sdate10" ng-disabled="state"
										ng-init="state=true" required></td>
									<td class="col-sm-3"><input class="form-control"
										type="date" value="{{plan.endingDate1}}" id="edate10"
										name="edate10" ng-disabled="state" ng-init="state=true"
										required></td>

									<!-- 	<option>Feasibility Study</option>
										<option>Find a project and meet client</option>
										<option>Gather client requirements</option>
										<option>Define scope</option>
										<option>Define users and use cases</option>
										<option>Requirement Analysis</option>
										<option>Client Feedback</option>
										<option>UI-Design</option>
										<option>UI-Development</option>
										<option>Back-end Development</option>


								</select></td> -->
								</tr>

							</tbody>
						</table>
						</div>




					<button type="submit" class="btn btn-default">Save</button>
					<a class="btn btn-default" ng-click="state=false"> Edit </a> 
					<a class="btn btn-default" href="DoDeleteProjectProposal"> Delete </a>
				
					</div>
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
