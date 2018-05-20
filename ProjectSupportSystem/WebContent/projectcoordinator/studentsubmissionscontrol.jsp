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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<script type="text/javascript" src="resources/scripts/insertProgress.js">
	
</script>

<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>

</head>
<body>
<div class="container-fluid">
	<div class="row">
		<jsp:include page="../_header.jsp" />
	</div>
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="../_leftSideBarCoordinator.jsp" />
		</div>
		<div class="col-md-10">
			<div class="container-fluid" id="formload">
				<div id="dashboard" ng-app="myApp">

			<div class="container-fluid spacing">
				<button type="button" class="btn btn-primary btn-lg btn-block"
					data-toggle="collapse" data-target="#message">Set Announcement </button>
				<div id="message" class="collapse" ng-controller="messageController"
					ng-init="displayMessages()" style="margin-top: 50px;">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Announcement
								Header: </label>
							<div class="col-sm-8">
								<input type="text" class="form-control"
									ng-model="message.header" required>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Announcement in
								Details: </label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="3"
									ng-model="message.detail" required> </textarea>
							</div>
						</div>
						<input type="button" class="btn btn-default" value="SAVE"
							ng-click="insertMessageData()" />
					</form>
					<div class="table table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Announncement Topic</th>
									<th>Announcement In Detail </th>
									<th>Delete</th>

								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="z in myArray2">
									<td>{{z.header}}</td>
									<td>{{z.detail}}</td>
									<td><button ng-click="deleteMessage(z.messsageId)" class="btn btn-danger btn-xs">Delete</button></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>


			<div class="container-fluid spacing">
				<button type="button" class="btn btn-primary btn-lg btn-block"
					data-toggle="collapse" data-target="#progressR">Set Deadlines For Progress
					Report Submission</button>
				<div id="progressR" class="collapse"
					ng-controller="progressController" ng-init="displayDataPR()">
					<form class="form-horizontal">

						<div class="form-group">
							<p></p>
							<label for="projectTitle" class="col-sm-2 control-label">
								Report No: </label>
							<div class="col-sm-10	">
								<select class="form-control" ng-model="progress.no">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
								</select>
							</div>
						</div>
					
						<div class="form-group">
							<label for="projectTitle" class="col-sm-2 control-label">
								End date: </label>
							<div class="col-sm-4">
								<input type="date" class="form-control"
									ng-model="progress.enddate">
							</div>
							<label for="projectTitle" class="col-sm-2 control-label">
								End Time: </label>
							<div class="col-sm-4">
								<input type="time" class="form-control"
									ng-model="progress.endtime">

							</div>
						</div>
						<input type="button" class="btn btn-default" value="SAVE"
							ng-click="insertProgressData()" />

					</form>
					<div class="table table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>

									<th>ReportNo</th>
									<th>End Date</th>
									<th>End Time</th>
									<th>Delete</th>

								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="x in myArray">
									<td>{{x.reportNo}}</td>
									<td>{{x.endDate}}</td>
									<td>{{x.endTime}}</td>
									<td> <button ng-click="deletePRData(x.reportNo)"
											class="btn btn-danger btn-xs">Delete</button> </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="container-fluid spacing">
				<button type="button" class="btn btn-primary btn-lg btn-block"
					data-toggle="collapse" data-target="#other">Set Deadlines For Other
					Submissions</button>
				<div id="other" class="collapse" ng-controller="formController"
					ng-init="displayDataForm()">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="projectTitle" class="col-sm-2 control-label">
								Form/Report type: </label>
							<div class="col-sm-10	">
								<select class="form-control" ng-model="form.type">
									<option>Supervisor Details</option>
									<option>Client Details</option>
									<option>Project Proposal</option>
									<option>Interim Report</option>
									<option>Dissertation</option>
									<option>Medical</option>
									<option>Client Certificate</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="projectTitle" class="col-sm-2 control-label">
								End date: </label>
							<div class="col-sm-4">
								<input type="date" ng-model="form.enddate" class="form-control">
							</div>
							<label for="projectTitle" class="col-sm-2 control-label">
								End Time: </label>
							<div class="col-sm-4">
								<input type="time" ng-model="form.endtime" class="form-control">

							</div>
						</div>
						<button type="button" class="btn btn-default"
							"
							ng-click="insertFormSubData()">Save</button>
						<div class="table table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>

										<th>FormType</th>
										<th>End Date</th>
										<th>End Time</th>
										<th>Delete</th>

									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="y in myArray2">
										<td>{{y.formType}}</td>
										<td>{{y.endDate}}</td>
										<td>{{y.endTime}}</td>
										<td><button ng-click="deleteFormData(y.formType)"
												class="btn btn-danger btn-xs">Delete</button></td>
									</tr>
								</tbody>
							</table>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</div>
</body>
</html>