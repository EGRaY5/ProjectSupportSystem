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
		<div class="col-md-10">
			<center>
				<div class="row">
					<form class="navbar-form ">
				      <div class="form-group">
				        <input type="text" class="form-control" placeholder="Search">
				      </div>
				      <button type="submit" class="btn btn-default" ><a href="ShowselectedQuestion" style="text-decoration:none; color:black"> SEARCH</a></button>
				    </form>
				</div>
			</center>

			<form class="navbar-form " >
				<div class="row">
				      
				      <div class="col-sm-3 col-md-6 col-lg-4">
							
						<center><button type="submit"  class="btn btn-default" ><a href="ShowAskQuestion" style="text-decoration:none; color:black"> Ask Question </a></button></center>
				
					</div>
				</div>
			</form>
				<br/>
				<br/>
			<div class="row">
				<div class="container">
				  <div class="panel-group">
				    <div class="panel panel-default">
				      <div class="panel-heading">
				        <h4 class="panel-title">
				          <a data-toggle="collapse" href="#collapse1">What is Lorem Ipsum?</a>
				          
				      </div>

				        </h4>
				      </div>
				      <div id="collapse1" class="panel-collapse collapse">
				        <div class="panel-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. <a><i class="fa fa-pencil pull-right" aria-hidden="true"></i></a> <a><i class="fa fa-trash pull-right" aria-hidden="true"></i></a></div>
				        <div class="panel-body">ans 2 <a><i class="fa fa-pencil pull-right" aria-hidden="true"></i></a> <a><i class="fa fa-trash pull-right" aria-hidden="true"></i></a></div>
				        <div class="panel-body">ans 3 <a><i class="fa fa-pencil pull-right" aria-hidden="true"></i></a> <a><i class="fa fa-trash pull-right" aria-hidden="true"></i></a></div>
				        <div class="panel-body">ans 4 <a><i class="fa fa-pencil pull-right" aria-hidden="true"></i></a> <a><i class="fa fa-trash pull-right" aria-hidden="true"></i></a></div>
				        <div class="panel-body">ans 5 <a><i class="fa fa-pencil pull-right" aria-hidden="true"></i></a> <a><i class="fa fa-trash pull-right" aria-hidden="true"></i></a></div>
				      </div>
				    </div>
				  </div>
				</div>

				
				
				</div>
			</div>	
		</div>

		
</body>

</html>
