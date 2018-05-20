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
						<!-- Give to input mail,heading and content and when submit direct to EmailReminder servelet -->
                        <form action="EmailReminder" method="post">
                            <textarea name="recipientmail" cols="155" rows="1" id="recipientmail"
                                      placeholder="Type Recipient Student's mail address"></textarea>
                            <p>*Please type Recipient Student's mail address</p>
                            <textarea name="heading" cols="155" rows="1" id="heading"
                                      placeholder="Type E-mail Reminder Content Heading"></textarea>
                            <p>*Please type E-mail Reminder Content Heading</p>
                            <textarea name="mail" cols="155" rows="10" id="mail"
                                      placeholder="Type E-mail Reminder Content"></textarea>
                            <p>*Please type E-mail Reminder Content</p>

                            <button type="submit" class="btn btn-default">Send</button>
                            <a class="btn btn-default" href="SendReminders"> Reset </a>
                        </form>

                    </div>


			    </center>
					

			</div>	
		</div>
	</div>
</div>			
	
	</body>
	</html>