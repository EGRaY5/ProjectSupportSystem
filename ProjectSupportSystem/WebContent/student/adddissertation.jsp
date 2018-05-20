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
			<div class="changer" id="formload">
					<form class="form-horizontal" enctype="multipart/form-data"
						method="POST" action="DoAddDissertation">
						<c:if test="${param.success eq 1}">
							<div class="alert alert-success">
								<strong>Successfully Deleted !</strong>
							</div>
						</c:if>
						<c:if test="${param.success eq 0}">
							<div class="alert alert-warning">
								<strong>Something went Wrong!</strong>
							</div>
						</c:if>
						<center>
							<h4>Final Dissertation</h4>
							<h4>  ${timeRemainingDiss} </h4>
						</center>
		
						<div class="form-group">
							<div class="col-sm-9">Please refer the instructions given in
								the Final Dissertation guidelines</div>
						</div>
						<div class="form-group">
							<label for="Inputform" class="col-sm-3 control-label">Submit:
							</label>
							<div class="col-sm-9">
								<input type="file" name="formName" required>
								<p class="help-block col-sm-7">"*filename:
									final-dissertation-index-no.pdf"</p>
							</div>
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