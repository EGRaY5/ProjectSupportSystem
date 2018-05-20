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
<div class="container-fluid"> <!--full container start-->
	<div class="row"><!--header row start-->
		<jsp:include page="../_header.jsp" />
	</div><!--header row end-->
	<div class="row"><!-- content row start-->
		<div class="col-md-2"><!--sidebar col start-->
			<jsp:include page="../_leftSideBarStudent.jsp" />
		</div><!--sidebar col end-->
		<div class="col-md-10"> <!--start of the content col-->
			<br>
			<div class="row"><!--to makethe content resposive-->
				<div class="col-md-1"></div> <!--to leave a space..:D-->
				<div class="col-md-9" style="background-color:#EEEEEE;"><!--include the table form or whatever-->
					<div class="changer" id="formload"> <!-- form -->
							<form class="form-horizontal" method="POST"
								action="DoAddProjectProposal">
										<!-- alerts -->
								<c:if test="${param.success eq 1}">
									<div class="alert alert-success">
										<strong>Successfully Deleted !</strong>
									</div>
								</c:if>
								<c:if test="${param.success eq 0}">
									<div class="alert alert-warning">
										<strong>Successfully Updated !</strong>
									</div>
								</c:if>
									<!-- end alerts -->
								<center>
									<h4>Project Details</h4>
									<h4> ${timeRemainingProposal} </h4>
								</center>
								<div class="form-group">
									<label for="projectTitle" class="col-sm-3 control-label">
										Project Title: </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="projectTitle"
											placeholder="Project Title" required>
									</div>
								</div>
								<div class="form-group">
									<label for="projectTitle" class="col-sm-3 control-label">
										Number of Attempts: </label>
									<div class="col-sm-9">
										<input type="number" class="form-control" name="noOfAttempts"
											placeholder="No of attempts (If repeat Student)" required>
									</div>
								</div>
								<div class="form-group">
									<label for="previousDecision" class="col-sm-3 control-label">
										previous Decision: </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="previousDecision"
											placeholder="Previous Decision(if repeat student)" required>
									</div>
								</div>
								<div class="form-group">
									<label for="earlierTitle" class="col-sm-3 control-label">
										Earlier Project Title: </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="earlierTitle"
											placeholder="Earlier Project Title(if repeat student)" required>
									</div>
								</div>
								<div class="form-group">
									<label for="motivationForProject" class="col-sm-3 control-label">
										Motivation for the Project: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="motivation" rows="3"
											placeholder="Motivation for the project" required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="Objectives" class="col-sm-3 control-label">
										Objectives: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="objectives" rows="3"
											placeholder="Objectives" required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="scope" class="col-sm-3 control-label"> Scope: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="scope" rows="3"
											placeholder="Scope of the project " required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="functionlities" class="col-sm-3 control-label">
										Critical functionalities: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="funtionalities" rows="3"
											placeholder="Critical Functionalaties of for project" required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="deliverables" class="col-sm-3 control-label">
										Deliverables: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="deliverables" rows="3"
											placeholder="Deliverables are Items that you would deliver to the client at the end of the project"
											required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="resources" class="col-sm-3 control-label">
										Resource Requirements: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="resources" rows="3"
											placeholder="Eg : hardware,software, ...." required></textarea>
									</div>
								</div>
				
								<div class="form-group">
									<label for="evaluation" class="col-sm-3 control-label">
										Self-Evaluation: </label>
									<div class="col-sm-9">
										<textarea class="form-control" name="evauation" rows="3"
											placeholder="Proposed way of self evaluating the success of your system"
											required></textarea>
									</div>
								</div>
								<div class="form-group"">
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
													type="date" value="2011-08-19" id="sdate1" name="sdate1"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate1"></td>
				
				
				
											</tr>
											<tr class="info">
												<td class="col-sm-6"><select class="form-control"
													name="pr2">
														<option>Feasibility Study</option>
												</select></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="sdate2"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate2"></td>
				
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
													type="date" id="example-date-input" name="sdate3"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate3"></td>
				
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
													type="date" id="example-date-input" name="sdate4"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate4"></td>
				
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
													type="date" id="example-date-input" name="sdate5"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate5"></td>
				
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
													type="date" id="example-date-input" name="sdate6"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate6"></td>
				
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
													type="date" id="example-date-input" name="sdate7"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate7"></td>
				
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
													type="date" id="example-date-input" name="sdate8"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate8"></td>
				
												<!-- 	<option>Feasibility Study</option>
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
													type="date" id="example-date-input" name="sdate9"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate9"></td>
				
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
													type="date" id="example-date-input" name="sdate10"></td>
												<td class="col-sm-3"><input class="form-control"
													type="date" id="example-date-input" name="edate10"></td>
				
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
							</form>
						</div>
						</div>
					</div>
					</div>
		</div><!--end of the content col-->
	</div><!--content row end-->
</div><!--full container end-->

</body>
</html>
