<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Admin - Cinemafy</title>
    <link rel="stylesheet" href="../css/movieInsert.css">
    <style>
        body {
            /* background-image: url('../images/dashboard-bg.jpg'); */
			background-image: url("../images/dashboard-bg2.jpg");
            background-size: cover;
            background-position: center;
        }
    </style> 
</head>
<body>


    <div class="form-container">
        <h2>Admin Login</h2>
        <form action="../AdminLoginServlet" method="post">
            <table>
               
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" step="0.1" name="password" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Log in" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
        
        <div style="margin-top: 10px; text-align: center;">
            <a href="../login.jsp">Login as a user</a>
        </div>
        
    </div>
	

</body>
</html>