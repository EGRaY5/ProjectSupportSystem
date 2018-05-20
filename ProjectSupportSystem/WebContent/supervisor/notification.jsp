<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Support System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/scripts/bitstudent.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

</head>
<body>

<script>
var app = angular.module('myApp', []);

app.controller('MyController',function($scope,$http){
		//console.log('angular efef eff');
        $scope.getDataFromServer = function() {
                $http({
                        method : 'GET',
                        url : 'http://localhost:8080/ProjectSupportSystem/DoGiveNotification'
                }).then(function successCallback(response) {
                        $scope.notification = response.data;
                        console.log('sucess');
                } ,function errorCallback(response){
                        console.log('error');
                });

        };
});

</script> 

<!--  
	
	
	<div class="up-header">
		<nav class="navbar navbar-default" id="header">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://www.bit.lk"> <img
						src="resources/Images/bit_logo.png" class="bit_logo">
					</a>
					<h3> BACHELOR OF INFORMATION TECHNOLOGY- UCSC</h3>
					<a class="navbar-brand" href="http://ucsc.cmb.ac.lk/"> <img
						src="resources/Images/ucsc_logo.png" class="ucsc_logo">
					</a>
					<ul class="nav navbar-nav">
					</ul>
				</div>
				</div>
		</nav>
	</div>



<!--  grey color navigation bar up-->
<!-- 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="http://vle.bit.lk/">BIT</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> You're logged in as:${user.userName}</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
	
	
	
	
	
	<div class="row">
		<div class="col-md-3">
			
			<div class="container-fluid">
	<div class="row">
		<nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link active" href="supervisor.jsp"
					onclick="">Profile</a></li>
				<li class="nav-item"><a class="nav-link" href="supervisor/notification.jsp">
						Notifications</a></li>
				
				
				<li class="nav-item"><a class="nav-link" href="ShowStudentList"> Student
						Progress</a></li>
			</ul>
		</nav>
	</div>
</div>
			
			
		</div>
		<div class="col-md-9">
				<div ng-app="myApp" ng-controller="MyController" ng-init="getDataFromServer()" id="addsupervisor">
				
			<div class="container">
			<div class=jumbotron style="background-color: #80ccff; border-left: 6px solid #79abfc;">
					 <a href="ShowStudentSubmissions?stuID={{notification.studentID}}" target="_blank"> {{notification.name}} </a> uploaded {{notification.report}}
			</div>
			</div>
			

		</div>


				
			
		</div>
	
	</div>

-->	
	
<div class="container-fluid">

<div class="row">
	<div class="up-header">
		<nav class="navbar navbar-default" id="header">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://www.bit.lk"> <img
						src="resources/Images/bit_logo.png" class="bit_logo">
					</a>
					<h3> BACHELOR OF INFORMATION TECHNOLOGY- UCSC</h3>
					<!--<a class="navbar-brand" href="http://ucsc.cmb.ac.lk/"> <img
						src="resources/Images/ucsc_logo.png" class="ucsc_logo">
					</a>  -->
					<ul class="nav navbar-nav">
					</ul>
				</div>
				</div>
		</nav>
	</div>



<!--  grey color navigation bar up-->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="http://vle.bit.lk/">BIT</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> You're logged in as:${user.userName}</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
	
	
	
</div>
<div class="row">
<div class="col-md-2">
<jsp:include page="../_leftSideBarSupervisor.jsp"/> 
</div>

<div class="col-md-10">
<div ng-app="myApp" ng-controller="MyController" ng-init="getDataFromServer()" id="addsupervisor">
				
			<div class="container">
			<div class=jumbotron style="background-color: #80ccff; border-left: 6px solid #79abfc;">
					 <a href="ShowStudentSubmissions?stuID={{notification.studentID}}" target="_blank"> {{notification.name}} </a> uploaded {{notification.report}}
			</div>
			</div>
					
</div>

	</div>
	</div>
</div>
</div>	
		
					
	  
			
				
		
		
	
	





</body>
</html>