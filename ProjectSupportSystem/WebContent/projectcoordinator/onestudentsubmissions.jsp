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
<script type="text/javascript" src="resources/scripts/loadSubmission.js"></script>




<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>

</head>
<body>

	<%-- <jsp:include page="../_header.jsp" />  --%>
	<%-- <jsp:include page="../_leftSideBarCoordinator.jsp" />  --%>
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
		<div class="row" style="margin-top: 50px;">
			<ul class="pager">
				<li class="previous"><a
					href="ShowStudentSubmissions?stuID=${studentID-1}"> <<< GOTO
						PREVIOUS STUDENT </a></li>
				<li class="next"><a
					href="ShowStudentSubmissions?stuID=${studentID+1}">GOTO NEXT
						STUDENT >>> </a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div ng-app="myApp">

				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#progress">Progress-Report
						Details</button>

					<div id="progress" class="collapse in">
						<div ng-controller="progressReportMarkController"
							ng-init="loadProgressReportList();">
							<div class="table table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Progress ReportNo</th>
											<th>Supervisor's Remark</th>
											<th>Supervisor's State</th>
											<th>Marks Obtained</th>
											<th>view</th>

										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="a in reportList">
											<td>{{a.reportNo}}</td>
											<td>{{a.supervisorRemark}}</td>
											<td>{{a.supervisorState}}</td>
											<td>{{a.mark}}</td>
											<td><a type="button" class="btn btn-info btn-xs"
												href="ShowProgressReportList?stuID={{a.studentId}}&repNO={{a.reportNo}}"
												target="_blank"> View </a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<p></p>
				</div>

				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#interim">Interim
						Report</button>
					<div id="interim" class="collapse in">
						<div class="col-sm-8">
							<form class="form-horizontal" enctype="multipart/form-data">
								<div ng-controller="InterimController">
									<div class="form-group">
										<p style="margin-top: 5px;">
											<b> Supervisor State:</b>
											<button type="button" class="btn btn-success btn-xs">{{interim.supervisorApproval}}</button>
											</br> <b> {{interim.supervisorComment}} </b>
										</p>
										<label for="hide1" class="col-sm-1 control-label"></label>
										<p class="help-block col-sm-6">
											<a href="DownloadInterimReport" target="_blank">
												Uploaded:{{interim.formName}} </a>
										</p>
										<iframe ng-src="{{interim.formName}}" width="100%"
											height="600px"> </iframe>
									</div>


								</div>

							</form>
						</div>
						<div class=col-sm-4>
							<button type="button" class="btn btn col-sm-12"
								style="margin-top: 20px;">Marks Obtained(Maximum 05)</button>
							<div ng-controller="InterimMarkController"
								ng-init="displayInterimMark();">
								<form class="">
									<div class="form-group">
										<label for="showmarks" class="col-sm-12 control-label">
										</label> <br /> <input type="text" class="form-control" name=total
											" ng-disabled="state" ng-init="state=true"
											value="{{interim.totalMarks}}" required
											style="margin-top: 40px;">
									</div>
									<div class="form-group">
										Title = {{interim.titleM}} <br /> Abstract =
										{{interim.abstractM}} <br /> Introduction =
										{{interim.introductionM}} <br /> Analysis =
										{{interim.analysisM}} <br /> Design of solution =
										{{interim.solutionM }} <br />

									</div>
								</form>
								<form name="markform" method="post">
									<!-- 		marking data validation -->
									<div role="alert">
										<span style="color: red;" class="error"
											ng-show="markform.totalMark.$error.max"> Not in Valid
											range (max-05)</span> <span style="color: red;" class="error"
											ng-show="markform.totalMark.$error.min">Not in Valid
											range (Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.totalMark.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.title.$error.max"> Not in Valid
											range (max-01)</span> <span style="color: red;" class="error"
											ng-show="markform.title.$error.min">Not in Valid range
											(Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.title.$error.number">Not a Number</span> <span
											style="color: red;" class="error"
											ng-show="markform.abstract.$error.max"> Not in Valid
											range (max-01)</span> <span style="color: red;" class="error"
											ng-show="markform.abstract.$error.min">Not in Valid
											range (Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.abstract.$error.number">Not a Number</span>
										<span style="color: red;" class="error"
											ng-show="markform.introduction.$error.max"> Not in
											Valid range (max-01)</span> <span style="color: red;" class="error"
											ng-show="markform.introduction.$error.min">Not in
											Valid range (Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.introduction.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.analysis.$error.max"> Not in Valid
											range (max-01)</span> <span style="color: red;" class="error"
											ng-show="markform.analysis.$error.min">Not in Valid
											range (Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.analysis.$error.number">Not a Number</span>
										<span style="color: red;" class="error"
											ng-show="markform.solution.$error.max"> Not in Valid
											range (max-01)</span> <span style="color: red;" class="error"
											ng-show="markform.solution.$error.min">Not in Valid
											range (Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.solution.$error.number">Not a Number</span>

									</div>
									<table class="table table-bordered" style="margin-top: 20px;">
										<thead>
											<tr>
												<th class="col-sm-8">Marking Criteria</th>
												<th class="col-sm-4">Marks</th>
												<!-- <td><a type="button" class="btn btn-primary btn">
															save </a></td> -->
											</tr>

										</thead>
										<tbody>
											<tr>
												<th>Title</th>
												<td><input type="number" step="0.01" min="0" max="1"
													class="form-control" name="title" ng-model="intMark.title"
													required></td>
											</tr>
											<tr>
												<th>Abstract</th>
												<td><input type="number" min="0" max="1" step="0.01"
													class="form-control" name="abstract"
													ng-model="intMark.abstract" required></td>
											</tr>
											<tr>
												<th>Introduction</th>
												<td><input type="number" min="0" max="1" step="0.01"
													class="form-control" name="introduction"
													ng-model="intMark.intro"required"></td>
											</tr>
											<tr>
												<th>Analysis</th>
												<td><input type="number" min="0" max="1" step="0.01"
													class="form-control" name="analysis"
													ng-model="intMark.analysis" required></td>
											</tr>
											<tr>
												<th>Design of solution</th>
												<td><input type="number" min="0" max="1" step="0.01"
													class="form-control" name="solution"
													ng-model="intMark.solution" required></td>
											</tr>
											<tr>
												<th>Total:</th>
												<td><input type="number" max="5" min="0" step="0.01"
													class="form-control" name="totalMark"
													ng-model="intMark.totalmarks"
													ng-value="(intMark.title-0)+(intMark.abstract-0)+(intMark.intro-0)+(intMark.analysis-0)+(intMark.solution-0)+0"
													required></td>
											</tr>

										</tbody>
									</table>
									<!-- <div role="alert">
										<span class="error" ng-show="markform.title.$error.max"> Not valid number!</span>
										</div> -->
									<button type="submit" class="btn btn-primary"
										ng-click="insertInterimMark();">Insert</button>

								</form>


							</div>

						</div>
						<p></p>
					</div>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#dist">Dissertation</button>
					<div id="dist" class="collapse in">
						<div class="col-sm-8">
							<form class="form-horizontal" enctype="multipart/form-data">
								<div ng-controller="DissertationController">
									<div class="form-group">
										<p style="margin-top: 5px;">
											<b> Supervisor States:</b>
											<button type="button" class="btn btn-success btn-xs">{{dissertation.supervisorApproval}}</button>
											</br> <b> Supervisor Comment:
												{{dissertation.supervisorComment}} </b> <label for="hide1"
												class="col-sm-1 control-label"></label>
										<p class="help-block col-sm-6">
											<a href="DownloadDissertation" target="_blank">
												Uploaded:{{dissertation.formName}} </a>
										</p>
										<iframe ng-src="{{dissertation.formName}}" width="100%"
											height="850px"> </iframe>

									</div>
								</div>
							</form>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn col-sm-12"
								style="margin-top: 20px;">Marks Obtained(Maximum 90)</button>
							<div ng-controller="DissertationMarkController"
								ng-init="displayDissertationMark();">
								<form class="">
									<div class="form-group">
										<label for="showmarks" class="col-sm-12 control-label">
										</label> <br /> <input type="text" class="form-control" name=total
											" ng-disabled="state" ng-init="state=true"
											value="{{dissert.total}}" required style="margin-top: 40px;">
									</div>
									<div class="form-group">
										Introduction = {{dissert.introduction}} <br /> Analysis =
										{{dissert.analysis}} <br /> Design = {{dissert.design}} <br />
										Implementation = {{dissert.design}} <br /> Evaluation =
										{{dissert.evaluation }} <br /> Conclusion =
										{{dissert.conclusion}}<br /> Reference =
										{{dissert.reference}} <br /> Appendices =
										{{dissert.appendices}} <br /> General = {{dissert.general}}<br />

									</div>
								</form>
								<form name="markform" method="post">
									<!-- 		marking data validation -->
									<div role="alert">
										<span style="color: red;" class="error"
											ng-show="markform.total.$error.max"> Not in Valid
											range (max-05)</span> <span style="color: red;" class="error"
											ng-show="markform.total.$error.min">Not in Valid range
											(Min-0)</span> <span style="color: red;" class="error"
											ng-show="markform.total.$error.number">Not a Number</span> <span
											style="color: red;" class="error"
											ng-show="markform.analysis.$error.number">Not a Number</span>
										<span style="color: red;" class="error"
											ng-show="markform.design.$error.number">Not a Number</span> <span
											style="color: red;" class="error"
											ng-show="markform.introduction.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.implementation.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.evaluation.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.conclution.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.reference.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.appendices.$error.number">Not a
											Number</span> <span style="color: red;" class="error"
											ng-show="markform.general.$error.number">Not a Number</span>
										<span style="color: red;" class="error"
											ng-show="markform.total.$error.number">Not a Number</span>

									</div>
									<table class="table table-bordered" style="margin-top: 20px;">
										<thead>
											<tr>
												<th class="col-sm-8">Marking Criteria</th>
												<th class="col-sm-4">Marks</th>
												<!-- <td><a type="button" class="btn btn-primary btn">
															save </a></td> -->
											</tr>

										</thead>
										<tbody>
											<tr>
												<th>Introduction</th>
												<td><input type="number" class="form-control"
													name="introduction" ng-model="disMark.introduction"
													required></td>
											</tr>
											<tr>
												<th>Analysis</th>
												<td><input type="number" class="form-control"
													name="analysis" ng-model="disMark.analysis" required></td>
											</tr>
											<tr>
												<th>Design</th>
												<td><input type="number" class="form-control"
													name="design" ng-model="disMark.design"required"></td>
											</tr>
											<tr>
												<th>Implementation</th>
												<td><input type="number" class="form-control"
													name="implementation" ng-model="disMark.implementation"
													required></td>
											</tr>
											<tr>
												<th>Evaluation</th>
												<td><input type="number" class="form-control"
													name="evaluation" ng-model="disMark.evaluation" required></td>
											</tr>
											<tr>
												<th>Conclusion</th>
												<td><input type="number" class="form-control"
													name="conclution" ng-model="disMark.conclution" required></td>
											</tr>
											<tr>
												<th>Reference</th>
												<td><input type="number" class="form-control"
													name="solution" ng-model="disMark.reference" required>
												</td>
											</tr>
											<tr>
												<th>Appendices</th>
												<td><input type="number" class="form-control"
													name="appendices" ng-model="disMark.appendices" required>
												</td>
											</tr>
											<tr>
												<th>General</th>
												<td><input type="number" class="form-control"
													name="general" ng-model="disMark.general" required>
												</td>
											</tr>
											<tr>
												<th>Total</th>
												<td><input type="number" class="form-control"
													name="total" ng-model="disMark.total"
													ng-value="(disMark.introduction-0)+(disMark.analysis-0)+(disMark.design-0)+(disMark.implementation-0)+(disMark.evaluation-0)+(disMark.conclution-0)+(disMark.reference-0)+(disMark.appendices-0)+(disMark.general-0)"
													required></td>
											</tr>

										</tbody>
									</table>
									<!-- <div role="alert">
										<span class="error" ng-show="markform.title.$error.max"> Not valid number!</span>
										</div> -->
									<button type="submit" class="btn btn-primary"
										ng-click="insertDissertation();">Insert</button>

								</form>


							</div>
						</div>
					</div>
					<p></p>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#proposal">Project
						Details</button>
					<div id="proposal" class="collapse">
						<form class="form-horizontal">
							<div ng-controller="ProposalController">
								<div class="form-group">
									<label for="projectTitle" class="col-sm-3 control-label"
										style="margin-top: 50px;"> Project Title: </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="projectTitle"
											placeholder="Project Title" value="{{proposal.projectTitle}}"
											ng-disabled="state" ng-init="state=true" required
											style="margin-top: 50px;">
									</div>
								</div>
								<div class="form-group">
									<label for="projectTitle" class="col-sm-3 control-label">
										Number of Attempts: </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="noOfAttempts"
											placeholder="No of attempts (If repeat Student)"
											value="{{proposal.noOfAttempts}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="previousDecision" class="col-sm-3 control-label">
										previous Decision: </label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											name="previousDecision"
											placeholder="Previous Decision(if repeat student)"
											value="{{proposal.previousDecision}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="earlierTitle" class="col-sm-3 control-label">
										Earlier Project Title: </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="earlierTitle"
											placeholder="Earlier Project Title(if repeat student)"
											value={{proposal.earlierProjectTitle}} ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="motivationForProject"
										class="col-sm-3 control-label"> Motivation for the
										Project: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="motivation" rows="3"
											placeholder="Motivation for the project" ng-disabled="state"
											ng-init="state=true" required>{{proposal.motivation}}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="Objectives" class="col-sm-3 control-label">
										Objectives: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="objectives" rows="3"
											placeholder="Objectives" ng-disabled="state"
											ng-init="state=true" required>{{proposal.objectives}}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="scope" class="col-sm-3 control-label">
										Scope: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="scope" rows="3"
											placeholder="Scope of the project" ng-disabled="state"
											ng-init="state=true" required>{{proposal.scope}}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="functionlities" class="col-sm-3 control-label">
										Critical functionalities: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="funtionalities" rows="3"
											placeholder="Critical Functionalaties of for project"
											ng-disabled="state" ng-init="state=true" required>{{proposal.functionalities}}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="deliverables" class="col-sm-3 control-label">
										Critical functionalities: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="deliverables" rows="3"
											placeholder="Deliverables are Items that you would deliver to the client at the end of the project"
											ng-disabled="state" ng-init="state=true" required>{{proposal.deliverables}}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="resources" class="col-sm-3 control-label">
										Resource Requirements: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="resources" rows="3"
											placeholder="Eg : hardware,software, ...."
											ng-disabled="state" ng-init="state=true" required>{{proposal.resources}}</textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="evaluation" class="col-sm-3 control-label">
										Self-Evaluation: </label>
									<div class="col-sm-8">
										<textarea class="form-control" name="evauation" rows="3"
											placeholder="Proposed way of self evaluating the success of your system"
											ng-disabled="state" ng-init="state=true" required>{{proposal.evaluation}}</textarea>
									</div>
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
												name="sdate1" ng-disabled="state" ng-init="state=true"
												required></td>
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

										</tr>

									</tbody>
								</table>
							</div>
						</form>
					</div>
					<p></p>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#super">Supervisor
						Details</button>
					<div id="super" class="collapse col-sm-12">
						<form class="form-horizontal" enctype="multipart/form-data">

							<div ng-controller="SupController">
								<div class="form-group">
									<label for="InputFirstName" class="col-sm-3 control-label">First
										Name: </label>
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
										<input type="email" class="form-control" name="email"
											id="email" value="{{supervisor.email}}" ng-disabled="state"
											required ng-init="state=true">
									</div>
								</div>
								<div class="form-group">
									<label for="InputTeleNo" class="col-sm-3 control-label">Mobile:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="mobileNo"
											id="mobileNo" value="{{supervisor.mobileNo}}"
											ng-disabled="state" ng-minlength=10 ng-maxlength=10 required
											ng-init="state=true">
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
										<p class="help-block col-sm-6">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="DownloadSupervisorFrom" target="_blank">
												Uploaded: {{supervisor.agreementFormPath}} </a>
										</p>


									</div>
								</div>
							</div>
						</form>



					</div>
					<p></p>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-primary col-sm-12"
						data-toggle="collapse" data-target="#client">Client
						Details</button>
					<div id="client" class="collapse">
						<form class="form-horizontal" enctype="multipart/form-data">

							<div ng-controller="ClientController">
								<div class="form-group">
									<label for="nameOfOrganization" class="col-sm-3 control-label">Name
										of the Organization:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="name"
											value="{{client.organizationName}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="registrationNo" class="col-sm-3 control-label">Organization
										Registration No:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="registrationNo"
											value="{{client.registrationNo}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="addressline1" class="col-sm-3 control-label">Address
										Line 1:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="addressLine1"
											value="{{client.addressLine1}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="addressline2" class="col-sm-3 control-label">Address
										Line 2:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="addressLine2"
											value="{{client.addressLine2}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="addressline3" class="col-sm-3 control-label">Address
										Line 3:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="addressLine3"
											value="{{client.addressLine3}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>

								<div class="form-group">
									<label for="InputEmail" class="col-sm-3 control-label">Organization
										E-Mail:</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" name="email"
											value="{{client.organizationEmail}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="InputTeleNo" class="col-sm-3 control-label">Telephone
										No:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="telephoneNo"
											value="{{client.telephoneNo}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="Inputform" class="col-sm-3 control-label">Submit
										Form: </label>
									<div class="col-sm-9">
										<p class="help-block col-sm-6">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="DownloadClientAgreementForm" target="_blank">
												Uploaded: {{client.formName}} </a>
										</p>
									</div>
								</div>

							</div>

						</form>
					</div>
					<p></p>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	</div>



</body>
</html>