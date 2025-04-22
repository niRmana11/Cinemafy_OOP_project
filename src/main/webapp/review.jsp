<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>



<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
<title>Review Form</title>
<link rel="stylesheet" type="text/css" href="styles/reviewStyles.css">
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
			profileLink.href = 'ProfileServlet';
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
	<header>
		<div class="header-container">
			<h1>cinemafy.</h1>
			<nav class="main-nav">
				<a href="homePage.jsp" class="nav-link">Home</a> <a href="movie.jsp"
					class="nav-link">Movies</a> <a href="Tvseries.jsp"
					class="nav-link">TV Series</a>  <a href="aboutUs.jsp" class="nav-link">About
					Us</a> <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
			</nav>
			<div class="auth-buttons">
				
			</div>
		</div>
	</header>

	<main>
		<h1>Submit Your Review</h1>

		<!-- Review Form -->
		<form id="reviewForm" action="insert" method="post">
			<label for="name">Your Name:</label> <input type="text" id="name"
				name="name"
				value="<%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "" %>"
				required> <label for="movieTitle">Movie/TV Series
				Title:</label> <input type="text" id="movieTitle" name="movieTitle"
				value="<%= request.getParameter("movieTitle") != null ? request.getParameter("movieTitle") : "" %>"
				readonly> <label for="reviewText">Review:</label>
			<textarea id="reviewText" name="reviewText" required></textarea>

			<label for="rating">Rating:</label> <select id="rating" name="rating">
				<option value="1">1 Star</option>
				<option value="2">2 Stars</option>
				<option value="3">3 Stars</option>
				<option value="4">4 Stars</option>
				<option value="5">5 Stars</option>
			</select> <input type="submit" name="submit" value="Submit Review">
		</form>
	</main>

	<!-- Footer Section -->
	<footer>
		<nav class="footer-nav">
			<a href="index.html" class="footer-link">Home</a> <a
				href="movies.html" class="footer-link">Movies</a> <a
				href="tvseries.html" class="footer-link">TV Series</a> <a
				href="reviews.html" class="footer-link">Reviews</a> <a
				href="about.html" class="footer-link">About Us</a> <a
				href="contact.html" class="footer-link">Contact Us</a> <a
				href="profile.html" class="footer-link">Profile</a>
		</nav>
		<p>&copy; 2024 cinemafy. All rights reserved.</p>
	</footer>
</body>
</html>
