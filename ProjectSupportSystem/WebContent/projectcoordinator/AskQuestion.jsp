<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/font-awesome.min.css">	
<link rel="stylesheet" type="text/css" href="resources/styles/login.css" />
<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
<link rel="stylesheet" type="text/css"
	href="resources/styles/index.css" />	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery-3.1.1.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<div style="margin-top:50px;">

			<div class="row">
				<center>
					

				<div class="row">
					<!-- When submiteed directs to insertNewQuestion Servelet -->
					<form action="insertNewQuestion" method="post">
						<textarea name="question" cols="155" rows="3" id="question" placeholder="Type your Question..."></textarea>
						<p>*Please type your question</p>
					 
						<button type="submit" class="btn btn-default">Submit</button>
						<!-- hyperlink to reload the same servelet -->
						<a class="btn btn-default" href="ShowAskQuestion"> Reset </a>
					</form>
						
				</div>	


			    </center>
					

			</div>	
		</div>
	</div>
</div>			
	
	</body>
	</html>