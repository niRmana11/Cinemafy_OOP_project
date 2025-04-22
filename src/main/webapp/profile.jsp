<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="styles/profile.css"> <!-- Linked to your external CSS file -->
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="header-container">
            <h1>cinemafy.</h1>
            <nav class="main-nav">
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="movie.jsp" class="nav-link">Movies</a>
                <a href="Tvseries.jsp" class="nav-link">TV Series</a>
                <a href="aboutUs.jsp" class="nav-link">About Us</a>
                <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
            </nav>
            
        </div>
    </header>

    <main>
        <h1 class="main-heading">Welcome to Your Profile</h1>

        <div class="profile-info">
            <h2>Profile Details</h2>
            <p><strong>Name:</strong> ${name}</p>
            <p><strong>Username:</strong> ${username}</p>
            <p><strong>Email:</strong> ${email}</p>
            <p><strong>Registration Date:</strong> ${registration_date}</p>

            <!-- Edit Profile Button -->
            <div class="button-container">
                <a href="editProfile.jsp">
                    <button class="edit-button">Edit User Profile</button>
                </a>
            </div>
        </div>

        <div class="watchlist">
            <h2>Your Watchlist</h2>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet watchlist = (ResultSet) request.getAttribute("watchlist");
                        int index = 1;
                        while (watchlist.next()) {
                            int watchLaterId = watchlist.getInt("watch_later_id");
                            String movieTitle = watchlist.getString("movie_title");
                            String seriesTitle = watchlist.getString("series_title");

                            String title = (movieTitle != null) ? movieTitle : seriesTitle;
                            String type = (movieTitle != null) ? "Movie" : "Series";
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= title %></td>
                        <td><%= type %></td>
                        <td>
                            <form method="post" action="ProfileServlet">
                                <input type="hidden" name="watch_later_id" value="<%= watchLaterId %>">
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Footer Section -->
    <footer>
        <nav class="footer-nav">
            <a href="index.html" class="footer-link">Home</a>
            <a href="movies.html" class="footer-link">Movies</a>
            <a href="tvseries.html" class="footer-link">TV Series</a>
            <a href="about.html" class="footer-link">About Us</a>
            <a href="contact.html" class="footer-link">Contact Us</a>
            <a href="profile.html" class="footer-link">Profile</a>
        </nav>
        <p>&copy; 2024 cinemafy. All rights reserved.</p>
    </footer>
</body>
</html>
