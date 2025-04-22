<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie - Cinemafy</title>
    <link rel="stylesheet" href="../css/movieInsert.css">
</head>
<body>

    <%
        String admin_id = request.getParameter("admin_id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String created_at = request.getParameter("created_at");
    %>

    <div class="form-container">
        <h2>Update Admin Details</h2>
        <form action="../AdminUpdateServlet" method="post">
            <table>
                <tr>
                    <td>Admin ID:</td>
                    <td><input type="text" name="admin_id" value="<%=admin_id%>" readonly></td>
                </tr>
                <tr>
                    <td>Admin Username:</td>
                    <td><input type="text" name="username" value="<%=username%>" required></td>
                </tr>
                <tr>
                    <td>Email :</td>
                    <td><input type="text" name="email" value="<%=email%>" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" step="0.1" name="password" value="<%=password%>" required></td>
                </tr>
                <tr>
                    <td>Created At :</td>
                    <td><input type="text" name="created_at" value="<%=created_at%>" readonly></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Update Admin details" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    
    <style>
        body {
            /* background-image: url('images/dashboard-bg.jpg'); */
            background-image: url("${pageContext.request.contextPath}/images/dashboard-bg2.jpg");
            background-size: cover;
            background-position: center;
        }
    </style>

</body>
</html>
