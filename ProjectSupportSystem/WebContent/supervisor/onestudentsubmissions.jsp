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
<script type="text/javascript" src="resources/scripts/loadSubmissionsForSup.js"></script>




<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>

</head>
<body>






	<%-- <jsp:include page="../_header.jsp" />  --%>
	<%-- <jsp:include page="../_leftSideBarCoordinator.jsp" />  --%>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">UCSC </a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="#"> You are logged in as: ${user.userName} </a></li>
			<li><a href="#">${student.fullName} </a></li>

			<li><a href="#"> ${student.studentId}</a>
		</ul>
	</div>
	</nav>


	<div class="container-fluid" id="formload">
		<div id="submittedlist" style="margin-top:50px;">
			<div ng-app="myApp">
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-info col-sm-12"
						data-toggle="collapse" data-target="#proposal">Project
						Details</button>
					<div id="proposal" class="collapse">
						<form class="form-horizontal">
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
										<input type="text" class="form-control" name="noOfAttempts"
											placeholder="No of attempts (If repeat Student)"
											value="{{proposal.noOfAttempts}}" ng-disabled="state"
											ng-init="state=true" required>
									</div>
								</div>
								<div class="form-group">
									<label for="previousDecision" class="col-sm-3 control-label">
										previous Decision: </label>
									<div class="col-sm-9">
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
									<div class="col-sm-9">
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
									<label for="scope" class="col-sm-3 control-label">
										Scope: </label>
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
											placeholder="Eg : hardware,software, ...."
											ng-disabled="state" ng-init="state=true" required>{{proposal.resources}}</textarea>
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
						
						<!-- aproval of supervisr -->
														
														
			<div  class="container-fluid" ng-app="myApp"  ng-show="proposal.approval != 'Pending'" ng-controller="ProposalController">
						<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">Approved</label>
				</div>		
						
				<div class="container-fluid" ng-app="myApp" ng-show="proposal.approval == 'Pending'" ng-controller="ProposalController" >
						
				<div   ng-controller="ProjectApprove">
				
				
				<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">{{ approve }}</label>
				
				
			<div ng-model="show" id="show"  >
			
				
			
			<input type="text" ng-model="comm.comment" id="myText" placeholder="comment here"></input>
				<select name="approval" ng-model="comm.approval">
			<option value="approve">approve</option>
																	
			<option value="disapprove">disapprove</option>
																	
			</select>
			
			<input type="hidden" ng-model="comm.report" ></input>
			
			<button ng-click=" approve =comm.approval+'d';insertApproval();" name="report" value="progressDetails" >SAVE ME</button>
			</div>
			</div>
			</div>


											
													
														
																	
						<!-- end of supervisor approval -->
				
						
						
						
						
					</div>
					<p></p>
				</div>
				
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-info col-sm-12"
						data-toggle="collapse" data-target="#super">Supervisor
						Details</button>
					<div id="super" class="collapse col-sm-6">
						<form class="form-horizontal" enctype="multipart/form-data">

							<div ng-controller="SupController">
								<div class="form-group">
									<label for="InputFirstName" class="col-sm-3 control-label">First
										Name:
									</label>
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
						
						
						<!-- aproval of supervisr -->
				<div  class="container-fluid" ng-app="myApp"  ng-show="supervisor.approval != null" ng-controller="SupController">
						<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">Approved</label>
				</div>		
						
				<div class="container-fluid" ng-app="myApp" ng-show="supervisor.approval == null" ng-controller="SupController" >
						
				<div   ng-controller="SupervisorApprove">
				
				
				<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">{{ approve }}</label>
				
				
			<div ng-model="show" id="show"  >
			
				
			
			<input type="text" ng-model="comm.comment" id="myText" placeholder="comment here"></input>
				<select name="approval" ng-model="comm.approval">
			<option value="approve">approve</option>
																	
			<option value="disapprove">disapprove</option>
																	
			</select>
			
			<input type="hidden" ng-model="comm.report" ></input>
			
			<button ng-click=" approve =comm.approval+'d';insertApproval();" name="report" value="progressDetails" >SAVE ME</button>
			</div>
			</div>
			</div>


											
													
						<!-- end of supervisor approval -->
				


					</div>
					<p></p>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-info col-sm-12"
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
								<iframe src={{client.formName}} width="100%" height="500px">

								</iframe>
							</div>

						</form>
						
								
								
								<!-- aproval of supervisr -->
								
								
								<div  class="container-fluid" ng-app="myApp"  ng-show="client.approval != null" ng-controller="ClientController">
						<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">Approved</label>
				</div>		
						
				<div class="container-fluid" ng-app="myApp" ng-show="client.approval == null" ng-controller="ClientController" >
						
				<div   ng-controller="ClientApprove">
				
				
				<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">{{ approve }}</label>
				
				
			<div ng-model="show" id="show"  >
			
				
			
			<input type="text" ng-model="comm.comment" id="myText" placeholder="comment here"></input>
				<select name="approval" ng-model="comm.approval">
			<option value="approve">approve</option>
																	
			<option value="disapprove">disapprove</option>
																	
			</select>
			
			<input type="hidden" ng-model="comm.report" ></input>
			
			<button ng-click=" approve =comm.approval+'d';insertApproval();" name="report" value="progressDetails" >SAVE ME</button>
			</div>
			</div>
			</div>


											
													
								
								
								
								<!-- end of supervisor approval -->
				
								
							
				
						
						
					</div>
					<p></p>
				</div>
				<div class="container-fluid spacing">
					<button type="button" class="btn btn-info col-sm-12"
						data-toggle="collapse" data-target="#progress">Progress-Report
						Details</button>
					<div id="progress" class="collapse">
					
					
					<div ng-controller="progressReportMarkController" ng-init="loadProgressReportList();">
					<div class="table table-responsive">
						<table class="table table-striped">
						<thead>
							<tr>
								<th>Progress ReportNo</th>
								<th>Supervisor's Remark</th>
								<th>Supervisor's State</th>
								<th>Marks Obtained</th>
								<th> view </th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="a in reportList">
								<td>{{a.reportNo}}</td>
								<td>{{a.supervisorRemark}}</td>
								<td>{{a.supervisorState}}</td>
								<td>{{a.mark}} </td>
								<td> <a type="button" class="btn btn-info btn-xs" href="ShowProgressReportList?stuID={{a.studentId}}&repNO={{a.reportNo}}" target="_blank"> View </a> </td>
							</tr>
						</tbody>
						</table>
					</div>
					</div>
					
					
											
								<!-- aproval of supervisr -->
							
							
			<div  class="container-fluid" ng-app="myApp"  ng-show="proposal.approval != null" ng-controller="ProgressController">
						<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">Approved</label>
				</div>		
						
				<div class="container-fluid" ng-app="myApp" ng-show="proposal.approval == null" ng-controller="ProgressController" >
						
				<div   ng-controller="ProgressApprove">
				
				
				<label style="color:green;background-color:#bafcc4;font-size:35px;width:100%;">{{ approve }}</label>
				
				
			<div ng-model="show" id="show"  >
			
				
			
			<input type="text" ng-model="comm.comment" id="myText" placeholder="comment here"></input>
				<select name="approval" ng-model="comm.approval">
			<option value="approve">approve</option>
																	
			<option value="disapprove">disapprove</option>
																	
			</select>
			
			<input type="hidden" ng-model="comm.report" ></input>
			
			<button ng-click=" approve =comm.approval+'d';insertApproval();" name="report" value="progressDetails" >SAVE ME</button>
			</div>
			</div>
			</div>


											
													
							
				
				

	      					  <!-- end of supervisor approval -->
					
					
					
					</div>
					
				</div>

				<div class="container-fluid spacing">
					<button type="button" class="btn btn-info col-sm-12"
						data-toggle="collapse" data-target="#interim">Interim
						Report</button>
					<div id="interim" class="collapse in">
						<div class="col-sm-8">
						<form class="form-horizontal" enctype="multipart/form-data">
							<div ng-controller="InterimController">
								<div class="form-group">
									<label for="hide1" class="col-sm-1 control-label"></label>
									<p class="help-block col-sm-6">
										<a href="DownloadInterimReport" target="_blank">
											Uploaded:{{interim.formName}} </a>
									</p>
									<iframe src="test/Group_12.pdf" width="100%" height="500px">

									</iframe>
									</div>


							</div>

						</form>
						</div>
						<div class=col-sm-3>
							<!--  <table class="table table-bordered" style="margin-top:50px;">
							<tbody>
							<tr> 
								<th>Insert Marks </th>
								<td> <input type="text" class="form-control"> </td>
								<td> <a type="button" class="btn btn-primary btn"> save </a></td>
							</tr>
							</tbody>
							</table>
						-->
			<!--start of appro -->			
		


									
								
		<!--end of appro -->
					</div>
						
					</div>
					<p></p>
				</div>

			</div>
		</div>
	</div>



</body>
</html>