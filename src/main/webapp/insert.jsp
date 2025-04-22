<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    
   <link rel="stylesheet" href="styles/insert.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-image: url("${pageContext.request.contextPath}/img/loginBackground.jpg");
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
    <div class="registration-container">
        <h2>Cinemafy Register</h2>
        <form action="InsertServlet" method="POST">
            <div class="input-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter a unique username" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            </div>
            <button type="submit">Register</button>
            <p id="error-message" class="error-message"></p>
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
    
    
   

   
</body>
</html>
