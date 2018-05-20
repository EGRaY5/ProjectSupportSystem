<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>BIT-University of Colombo School of Computing - Project
  Evaluation Support System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
  href="resources/styles/bitstudent.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="resources/scripts/bitstudent.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row"> <!--header row-->
		<jsp:include page="_header.jsp" />
	</div> <!--end of header row-->
 	<div class="row"><!--start of cntent row-->
  		<div class="col-md-2">   <!--nav bar beginning-->
  			<jsp:include page="_leftSideBarStudent.jsp"/>
  		</div> <!--nav bar end-->
  		
  		<div class="col-md-8"><!--msg view -->
          	
          	<div ng-app="myApp" ng-controller="viewMessages">
            <div class="changer" id="formload" ng-repeat="y in myArray">
            		<br>
            	<div class="well">
            		<blockquote>
             			<h3 class="text-primary text-uppercase" ><u>{{y.header}}</u></h3>
				            <br/>
				            <br/>
				            <br/>
            			<p class="text-primary text-center">{{y.detail}}</p>
            			<footer>Posted by Projct Coordinator,BIT on 11-12-2017 at 5.37 pm</footer>  
            
           			 </blockquote>
           
            	</div>
            </div> 
         	</div>
  			
  		</div> <!--msg view -->
      	<div class="col-md-2 offset-md-10"><!--right side -->
      				<br>
	        <div class="row" class="embed-responsive embed-responsive-1by1">
	         <iframe src="https://calendar.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=200&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=go7bqs1m4jm3hh3a1cjcf7hbq0%40group.calendar.google.com&amp;color=%23711616&amp;ctz=Asia%2FColombo" style="border-width:0" width="200" height="200" frameborder="0" scrolling="no"></iframe>
	        </div>
        		<br/>
        		<br>
        		<br>
        	<div class="row">

          <div class="well">
	          <p>You've submitted:
	          <div>Supervisor Agreement forms <span class="badge">1</span></div>
	          <div>Client agreement forms <span class="badge">1</span></div>
	          <div>Project proposals <span class="badge">1</span></div>
	          <div>Progress reports <span class="badge">6</span></div>
	          <div>Interim reports <span class="badge">1</span></div>
	          </p>
          </div>
        
        </div>
    </div><!--r8 side -->
        
	</div> <!--end of content row--> 
      
</div>
    
    
  
</body>
</html>