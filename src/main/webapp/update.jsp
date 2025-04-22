<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/updates.css">
	<style>
body {
	font-family: Arial, sans-serif;
	background-image:url("${pageContext.request.contextPath}/images/CINEMAFY.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>

</head>
<body>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	%>
	<div class="update-container">

		<h2>Update Details</h2>

		<form action="UpdateServlet" method="POST">


			<div class="input-group">
				<label for="name">User ID</label> <input type="text" id="user_id"
					name="user_id" value="<%=id%>" readonly>
			</div>
			<div class="input-group">
				<label for="name">Full Name</label> <input type="text" id="name"
					name="name" value="<%=name%>" placeholder="Enter your full name"
					required>
			</div>
			<div class="input-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" value="<%=username%>"
					placeholder="Enter a unique username" required>
			</div>
			<div class="input-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" value="<%=email%>" placeholder="Enter your email"
					required>
			</div>
			<div class="input-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" value="<%=password%>"
					placeholder="Enter your password" required>
			</div>
			<div class="input-group">
				<label for="confirmPassword">Confirm Password</label> <input
					type="password" id="confirmPassword" name="confirmPassword"
					value="<%=password%>" placeholder="Confirm your password" required>
			</div>
			<button type="submit">Register</button>
			<p id="error-message" class="error-message"></p>
		</form>

	</div>


	body > 
	
	</html>