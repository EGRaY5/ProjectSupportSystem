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
			href="../resources/styles/vivapanel.css" />
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


		<script
			src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
		<script type="text/javascript"
			src="resources/scripts/loadStudentList.js"></script>

		<title>BIT-University of Colombo School of Computing - Project Evaluation Support System</title>
	</head>

	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../_header.jsp" />
			</div>
			<div class="row">
				<div class="col-md-2">
					<jsp:include page="../_leftSideBarViva.jsp" />
				</div>
				<div class="col-md-8">
					<div class="container-fluid">
						<button type="button" class="btn btn-primary btn-lg btn-block" disabled>Selelct dates and times for viva</button>
					</div>
					<hr>
					<div class="well">
						<form class="form-horizontal" action="#">
    						<div class="form-group">
      							<label class="control-label col-sm-2" for="date">Date:</label>
      							<div class="col-sm-10">
        						<input type="date" class="form-control" id="date" placeholder="#" name="date">
      							</div>
    						</div>
    						<div class="form-group">
      							<label class="control-label col-sm-2" for="time">Time:</label>
      							<div class="col-sm-10">          
        						<input type="password" class="form-control" id="time" placeholder="#" name="time">
      							</div>
    						</div>
    						<div class="form-group">        
      							<div class="col-sm-offset-2 col-sm-10">
        						<button type="submit" class="btn btn-default" id-"myBtn">Submit</button>
      							</div>
   			 				</div>
  						</form>
					</div>
				</div>
				
				<div class="col-md-2 sidenav">
      				<div class="well">
        				<p>ADS</p>
      				</div>
      				<div class="well">
        				<p>ADS</p>
      				</div>
    			</div>
			</div>
			<div class="row align-items-end">
				<jsp:include page="../_footer.jsp" />
			</div>
		</div>
	</body>

</html>