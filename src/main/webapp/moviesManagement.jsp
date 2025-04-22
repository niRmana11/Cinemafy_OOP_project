<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Management - Cinemafy</title>
    <link rel="stylesheet" href="css/movieManagements.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar Navigation -->
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

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="movie-management">
                <h2>Movie Management</h2>

                <!-- Add Movie Button -->
                <div class="add-movie">
                    <a href="movieinsert.jsp">
                        <button class="add-button">Add Movie</button>
                    </a>
                </div>

                <!-- Search Bar -->
                <input type="text" id="searchInput" placeholder="Search movies...">

                <!-- Movie Table -->
                <table>
                    <tr>
                        <th>Movie ID</th>
                        <th>Title</th>
                        <th>Release Date</th>
                        <th>Rating</th>
                        <th>Duration</th>
                        <th>Language</th>
                        <th>Poster Image</th>
                        <th>Trailer URL</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="count" items="${allMovie}">
                        <tr>
                            <td>${count.movie_id}</td>
                            <td>${count.title}</td>
                            <td>${count.release_date}</td>
                            <td>${count.rating}</td>
                            <td>${count.duration}</td>
                            <td>${count.language}</td>
                            <td>${count.poster_image_url}</td>
                            <td>${count.trailer_url}</td>
                            <td>${count.description}</td>
                            <td>
							    <div class="action-buttons">
							        <a href="movieUpdate.jsp?movie_id=${count.movie_id}&title=${count.title}&release_date=${count.release_date}&description=${count.description}&rating=${count.rating}&duration=${count.duration}&language=${count.language}&poster_image_url=${count.poster_image_url}&trailer_url=${count.trailer_url}">
							            <button class="update-button">Update</button>
							        </a>
							        <form action="MovieDeleteServlet" method="post" style="display:inline;">
							            <input type="hidden" name="movie_id" value="${count.movie_id}">
							            <button class="delete-button">Delete</button>
							        </form>
							    </div>
							</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
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
        body {
            /* background-image: url('images/dashboard-bg.jpg'); */
            background-image: url("${pageContext.request.contextPath}/images/dashboard-bg.jpg");
            background-size: cover;
            background-position: center;
        }
    </style>
    
    

</body>
</html>
