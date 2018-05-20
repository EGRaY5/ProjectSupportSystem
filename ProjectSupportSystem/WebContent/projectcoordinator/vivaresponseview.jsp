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
<script type="text/javascript"
	src="resources/scripts/loadStudentList.js"></script>

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
	<!--  div class="container-fluid">-->
	<button type="button" class="btn btn-primary btn-lg btn-block">Enter dates and times for viva</button>
	<br/>
				<form class="form-horizontal" method="POST" action="DoGiveVivaTime">
				
					<div class="form-group" >
						<label for="day1" class="col-sm-2 control-label" >Day 1</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" name="day1" placeholder="YYYY-MM-DD" ><br>
							<input type="text" class="form-control" name="time10" placeholder="EX:8:00 AM - 10:00AM" ><br>
							<input type="text" class="form-control" name="time11" placeholder="EX:8:00 AM - 10:00AM"" >
						</div>
					</div>
					<br>
					<div class="form-group" >
						<label for="day2" class="col-sm-2 control-label" >Day 2</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" name="day2" placeholder="YYYY-MM-DD" ><br>
							<input type="text" class="form-control" name="time20" placeholder="EX:8:00 AM - 10:00AM"><br>
							<input type="text" class="form-control" name="time21" placeholder="EX:8:00 AM - 10:00AM">
						</div>
					</div>
					<br>
					<div class="form-group" >
						<label for="day3" class="col-sm-2 control-label" >Day 3</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" name="day3" placeholder="YYYY-MM-DD" ><br>
							<input type="text" class="form-control" name="time30" placeholder="EX:8:00 AM - 10:00AM" ><br>
							<input type="text" class="form-control" name="time31" placeholder="EX:8:00 AM - 10:00AM" >
						</div>
					</div>
					<center>
						<button type="submit" class="btn btn-default btn-primary">SUBMIT</button>
					</center>
				</form>
			</div>
		</div>
	
	<br>
	<br>
	</div>
	<div class="row">
	<jsp:include page="../_footer.jsp" />
	</div>
</div>
</body>
</html>