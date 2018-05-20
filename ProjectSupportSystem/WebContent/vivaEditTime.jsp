<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
 
 <link rel="stylesheet" type="text/css" href="resources/styles/vivapanel.css" />

<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- ---------------------------------------------------------->
<% String message = (String)request.getAttribute("alertMsg");%>
<script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>

<!-- ------------------------------------------------------->
	
<title> BIT-University of Colombo School of Computing - Project Evaluation Support System </title>
</head>
<body>
	<!-- include header -->
	<jsp:include page="_header.jsp" />
	
		<!-- get logged user's name & show it -->
		<div id="loginedUser">
			<p>You are logged in as: ${user.userName}</p>
		</div>
		
		<div class="container" >
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-8">
					<form class="form-horizontal" method="POST" action="DoEditTimeViva">
				<h4>Do changes</h4>
				<br>
				
				<div class="form-group" >
					<label for="name" class="col-sm-3 control-label" >Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="name" placeholder="Name" required>
					</div>
				</div>
				
				<table class="table table-bordered table-striped" style="background-color:white">
  					<thead>
   		 				<tr class="success">
      						<th scope="col" ><center><b>Date</b></center></th>
      						<th scope="col" ><center><b>Time</b></center></th>
      						<th scope="col" ><center><b>Selection</b></center></th>
    					</tr>
  					</thead>
  					<tbody>
    					<tr>
					      <td>2018-02-04</td>
					      <td>10.00 a.m. - 12.00 a.m.</td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox1" value="Day 01 1st slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
					      <td>2018-02-04</td>
					      <td><%=request.getAttribute("time11")%></td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox2" value="Day 01 2nd slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
					      <td><%=request.getAttribute("day2")%></td>
					      <td><%=request.getAttribute("time20")%></td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox3" value="Day 02 1st slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
					      <td><%=request.getAttribute("day2")%></td>
					      <td><%=request.getAttribute("time21")%></td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox4" value="Day 02 2nd slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
					      <td><%=request.getAttribute("day3")%></td>
					      <td><%=request.getAttribute("time30")%></td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox5" value="Day 03 1st slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
					      <td><%=request.getAttribute("day3")%></td>
					      <td><%=request.getAttribute("time31")%></td>
					      <td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox6" value="Day 03 2nd slot" aria-label="..."></center></td>
    					</tr>
    					<tr>
    						<td colspan="2">No selections</td>
    						<td><center><input class="form-check-input position-static" type="checkbox" name="time" id="Checkbox7" value="No Selection" aria-label="..."></center></td>
    					</tr>
  				</tbody>
			</table>		
		
				
				
						
				<center>
					<button type="submit" class="btn btn-default btn-primary">EDIT</button>
				</center>
				
			</form>
				
				</div>
				 
				<div class="col-md-3">
					<iframe src="https://calendar.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=300&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=d9urelilq2fhlsggqh2eudqqc0%40group.calendar.google.com&amp;color=%23865A5A&amp;ctz=Asia%2FColombo" style="border-width:0" width="300" height="300" frameborder="0" scrolling="no"></iframe>
				</div>
			</div>
		
		</div>
		
		<br>
		<br>
		
	<!-- include footer -->
	<jsp:include page="_footer.jsp" />
	
</body>

</html>