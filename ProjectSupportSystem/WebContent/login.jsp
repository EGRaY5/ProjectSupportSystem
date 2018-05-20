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
<link rel="stylesheet" type="text/css" href="resources/styles/login.css" />
<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp" />
	<c:if test="${param.success eq 0}">
				<div class="alert alert-danger">
					<strong> Wrong password or UserName !</strong>
				</div>
	</c:if>
	<div class="wrapper">
		<form class="form-signin" method="POST" action="doLogin">
			<h2 class="form-signin-heading">Please login</h2>
			<input type="text" class="form-control" name="username" id="username"
				placeholder="username" required="" autofocus="" /> <input
				type="password" class="form-control" name="password" id="password"
				placeholder="Password" required="" /> <label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe"
				name="rememberMe"> Remember me
			</label>
			<button class="btn btn-lg btn-primary btn-block" type="submit" id="submitlogin">Login</button>
		</form>
	</div>

<jsp:include page="_footer.jsp" />
</body>
</html>