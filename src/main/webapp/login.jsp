<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles/logins.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password"  placeholder="Enter your password" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <p>Don't have an account? <a href="insert.jsp">Register here</a></p>

        <!-- New button for Admin login -->
        <div class="admin-login">
            <p>Are you an admin? <a href="adminmanagement/adminLogin.jsp"><button>Log in as Admin</button></a></p>
        </div>
    </div>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("${pageContext.request.contextPath}/images/CINEMAFY.jpg");
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
        
        .admin-login {
            margin-top: 15px;
            text-align: center;
        }
        
        .admin-login button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
        }

        .admin-login button:hover {
            background-color: #45a049;
        }
    </style>

</body>
</html>
