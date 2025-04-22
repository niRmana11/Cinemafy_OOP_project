<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- make sure to link GetAdminInfoServlet.java in admin login when login is correct -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Cinemafy</title>
    <link rel="stylesheet" href="css/dashboard.css">
    
     <!-- Background Image -->
    <style>
        body {
            background-image: url("${pageContext.request.contextPath}/images/dashboard-bg.jpg");
            background-size: cover;
            background-position: center;
        }

        /* Style for Logout Button */
        .logout-btn {
            background-color: #ff4b5c;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .logout-btn:hover {
            background-color: #ff2e44;
        }
    </style>
    
    
    <script>
        // Check if user is logged in
        const isLoggedIn = <%= (session.getAttribute("isLoggedIn") != null && (boolean)session.getAttribute("isLoggedIn")) ? "true" : "false" %>;

        function updateHeader() {
            const authButtons = document.querySelector('.auth-buttons');
            authButtons.innerHTML = ''; // Clear existing buttons

            if (isLoggedIn) {
                
            	 // Create and append login and signup links
                const loginLink = document.createElement('a');
                loginLink.href = 'login.jsp';
                loginLink.className = 'auth-link';
                loginLink.textContent = 'User Login';
                authButtons.appendChild(loginLink);
               
            } else {
                // Create and append login and signup links
                const loginLink = document.createElement('a');
                loginLink.href = 'login.jsp';
                loginLink.className = 'auth-link';
                loginLink.textContent = 'Login';
                authButtons.appendChild(loginLink);
                
                const signupLink = document.createElement('a');
                signupLink.href = 'insert.jsp';
                signupLink.className = 'auth-link signup-button';
                signupLink.textContent = 'Sign Up';
                authButtons.appendChild(signupLink);
            }
        }

        // Call the function when the page loads
        window.onload = updateHeader;
    </script>
</head>
<body>

<!-- Header Section -->
    <header>
        <div class="header-container">
            <h1>cinemafy.</h1>
            <nav class="main-nav">
                <a href="index.html" class="nav-link">Home</a>
                <a href="movies.html" class="nav-link">Movies</a>
                <a href="tvseries.html" class="nav-link">TV Series</a>
                <a href="about.html" class="nav-link">About Us</a>
                <a href="contact.html" class="nav-link">Contact Us</a>
            </nav>
            <div class="auth-buttons">
                
            </div>
        </div>
    </header>
    
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
            <div class="admin-info">
                <h1>Welcome, ${adminName}</h1>
                <p>Manage Cinemafy efficiently with your tools to the left.</p>
                <div class="admin-details">
                    <p><strong>Admin Name: </strong> ${adminName}</p> <!-- Replace with dynamic admin name -->
                    
                    <!-- Logout Button -->
                    <form action="AdminLogoutServlet" method="get">
                        <button type="submit" class="logout-btn">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

   
    
    
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
