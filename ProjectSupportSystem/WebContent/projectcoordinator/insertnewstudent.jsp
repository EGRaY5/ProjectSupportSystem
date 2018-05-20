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
		<br/>
		<div class="container-fluid" id="formload">
		<form class="form-horizontal">
		<c:if test="${param.success eq 0}">
				<div class="alert alert-danger">
					<strong> Duplicate Data Found. Please try again!</strong>
				</div>
		</c:if>
		<c:if test="${param.success eq 1}">
				<div class="alert alert-success">
					<strong> Student list has been successfully inserted !</strong>
				</div>
		</c:if>
		<c:if test="${param.success eq 2}">
				<div class="alert alert-danger ">
					<strong> Excel sheet not in correct Form Please Try Again</strong>
				</div>
		</c:if>
			<button type="button" class="btn btn-primary btn-lg btn-block" disbled> New Student Insertion </button>
			<br/>
			<br/>
			<br/>
			<p class="help-block col-sm-3"> Excel file should be in the following format </p>
			<span class="border-1">
			<img src="./resources/Images/stud.png" class="img-fluid" alt="Responsive image">
			</span>
			
			<br/>
			<br/>
			<br/>
			<p> *Upload the excel file </p>
			</form>
			<form action="InsertNewStudentList" method="POST" enctype="multipart/form-data">
  				<div class="form-group">
    			<label for="Inputform">Submit Form: </label>
    			<input type="file" name="studentlist" class="form-control-file" id="exampleFormControlFile1" required>
  				</div>
			<button class="btn btn-primary" type="submit" value="submit"> Submit </button> 
		</form>
		</div>
	</div>
</div>
</div>
</div>	
</body>
</html>
