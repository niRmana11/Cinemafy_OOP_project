<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Management - Cinemafy</title>
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
            <div class="review-management">
                <h2>Review Management</h2>

               

                <!-- Search Bar -->
                <input type="text" id="searchInput" placeholder="Search movies...">

                <!-- Movie Table -->
                <table>
                    <tr>
                        <th>Review ID</th>
                        <th>User Name</th>
                        <th>Movie / Tv Show Name</th>
                        <th>Review</th>
                        <th>Rating</th>
                        <th>Date and Time</th>
                        <th>Action </th>
                        
                    </tr>
                    <c:forEach var="count" items="${allReview}">
                        <tr>
                            <td>${count.review_id}</td>
                            <td>${count.userName}</td>
                            <td>${count.movie_tvshowName}</td>
                            <td>${count.review_text}</td>
                            <td>${count.rating}</td>
                            <td>${count.review_date}</td>
                            
                            <td>
							    <div class="action-buttons">
							        <a href="adminReviewUpdate.jsp?review_id=${count.review_id}&userName=${count.userName}&movie_tvshowName=${count.movie_tvshowName}&review_text=${count.review_text}&rating=${count.rating}">
							            <button class="update-button">Update</button>
							        </a>
							        <form action="reviewDeleteServlet" method="post" style="display:inline;">
							            <input type="hidden" name="review_id" value="${count.review_id}">
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

</body>
</html>
