<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<div class="main-container">
        
        <nav class="sidebar">
            <ul>
           		 <li><a href="GetAdminInfoServlet">Admin Dashboard</a></li>
                <li><a href="GetAllMovieServlet">Movies Management</a></li>
                <li><a href="GetAllTvSeriesServlet">TV Series Management</a></li>
                <li><a href="getAllServlrt">User Management</a></li>
                <li><a href="GetAllAdminsServlet">Admin Management</a></li>
                <li><a href="GetAllReviewsServlet">Reviews Management</a></li>
            </ul>
        </nav>
        
     </div>
    <div class="container">
        <h1>User Management</h1>
        
        <input type="text" id="searchInput" placeholder="Search for users..." class="search-bar">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${allUsers}">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.name}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                        <td class="actions">
                            <a href="update.jsp?id=${user.user_id}&name=${user.name}&username=${user.username}&email=${user.email}&password=${user.password}" class="btn update-btn">
                                Update
                            </a>
                            <form action="DeleteServlet" method="Post" class="delete-form">
                                <input type="hidden" name="id" value="${user.user_id}" />
                                <button type="submit" class="btn delete-btn">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script>
        function filterTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.querySelector("table");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        }
                    }
                }
            }
        }

        document.getElementById("searchInput").addEventListener("input", filterTable);
    </script>
    
    <style>
    
    body{
    
    background-image: url("${pageContext.request.contextPath}/images/CINEMAFY.jpg");
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat;
    background-attachment: fixed;
    
    }
    
    </style>
    
</body>
</html>
