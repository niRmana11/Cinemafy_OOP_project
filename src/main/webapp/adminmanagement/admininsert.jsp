<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Admin - Cinemafy</title>
    <link rel="stylesheet" href="../css/movieInsert.css">
</head>
<body>


    <div class="form-container">
        <h2>Insert Admin Details</h2>
        <form action="../AdminInsertServlet" method="post">
            <table>
                <tr>
                    <td>Admin user name</td>
                    <td><input type="text" name="username" required></td>
                </tr>
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
                        <input type="submit" value="Add Admin" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
	<style>
        body {
            /* background-image: url('../images/dashboard-bg.jpg'); */
			background-image: url("../images/dashboard-bg2.jpg");
            background-size: cover;
            background-position: center;
        }
    </style>

</body>
</html>