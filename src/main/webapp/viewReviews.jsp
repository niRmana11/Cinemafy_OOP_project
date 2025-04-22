<%@ page import="java.util.List" %>
<%@ page import="reviewPage.Review" %>
<%@ page import="reviewPage.ReviewDBUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reviews</title>
    <link rel="stylesheet" type="text/css" href="styles/viewReviewsStyles.css"> 
    <script>
	// Check if user is logged in
	const isLoggedIn =
<%=(session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn"))
		? "true"
		: "false"%>
	;

	function updateHeader() {
		const authButtons = document.querySelector('.auth-buttons');
		authButtons.innerHTML = ''; // Clear existing buttons

		if (isLoggedIn) {
			// Create and append profile link
			const profileLink = document.createElement('a');
			profileLink.href = 'profile.html';
			profileLink.className = 'auth-link';
			profileLink.textContent = 'Profile';
			authButtons.appendChild(profileLink);

			// Create and append sign out form
			const signOutForm = document.createElement('form');
			signOutForm.action = 'LogoutServlet'; // Set your logout URL
			signOutForm.method = 'get';
			signOutForm.style.display = 'inline'; // Inline display

			const signOutButton = document.createElement('button');
			signOutButton.type = 'submit'; // Submit type for form button
			signOutButton.className = 'auth-link signout-button'; // Add styling
			signOutButton.textContent = 'Log Out'; // Button text

			signOutForm.appendChild(signOutButton); // Add button to form
			authButtons.appendChild(signOutForm); // Add form to auth buttons
		} else {
			// Create and append login and signup links
			const loginLink = document.createElement('a');
			loginLink.href = 'login.jsp';
			loginLink.className = 'auth-link';
			loginLink.textContent = 'Login';
			authButtons.appendChild(loginLink);

			const signupLink = document.createElement('a');
			signupLink.href = 'signup.html';
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
    <!-- Header section -->
    <header>
        <div class="header-container">
            <h1>cinemafy.</h1>
            <nav class="main-nav">
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="movie.jsp" class="nav-link">Movies</a>
                <a href="Tvseries.jsp" class="nav-link">TV Series</a>
                <a href="aboutUs.jsp" class="nav-link">About Us</a>
                <a href="contact.jsp" class="nav-link">Contact Us</a>
            </nav>
            <div class="auth-buttons">
                
            </div>
        </div>
    </header>

    <!-- Main content section -->
    <main>
        <h1>Reviews for <%= request.getParameter("movieTitle") %></h1>

        <div class="review-container">
            <%
                String movieTitle = request.getParameter("movieTitle");
                List<Review> reviews = ReviewDBUtil.getReviewsByMovieTitle(movieTitle);

                for (Review review : reviews) {
            %>
            <div class="review-card">
                <h3><%= review.getName() %></h3>
                <p><strong>Review:</strong> <%= review.getReviewText() %></p>
                <p><strong>Rating:</strong> <%= review.getRating() %> Star(s)</p>
            </div>
            <%
                }
            %>
        </div>

        <a class="back-link" href="movie.jsp">Back to Movie List</a>
    </main>

    <!-- Footer section -->
    <footer>
        <nav class="footer-nav">
            <a href="homePage.jsp" class="footer-link">Home</a>
            <a href="movie.jsp" class="footer-link">Movies</a>
            <a href="Tvseries.jsp" class="footer-link">TV Series</a>
            <a href="aboutUs.jsp" class="footer-link">About Us</a>
            <a href="contact.jsp" class="footer-link">Contact Us</a>
        </nav>
        <p>&copy; 2024 cinemafy. All rights reserved.</p>
    </footer>
</body>
</html>
