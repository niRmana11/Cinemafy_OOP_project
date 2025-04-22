<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>cinemafy - Home</title>
<link rel="stylesheet" href="styles/homePageStyles.css">

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
	<!-- Header Section -->
	<header>
		<div class="header-container">
			<h1>cinemafy.</h1>
			<nav class="main-nav">
				<a href="homePage.jsp" class="nav-link">Home</a> <a href="movie.jsp"
					class="nav-link">Movies</a> <a href="Tvseries.jsp" class="nav-link">TV
					Series</a> <a href="aboutUs.jsp" class="nav-link">About Us</a> <a
					href="ContactUs.jsp" class="nav-link">Contact Us</a>
			</nav>
			<div class="auth-buttons"></div>
		</div>
	</header>

	<!-- Main Content -->
	<main>
		<!-- Featured Movies Section -->
		<section class="featured-section">
			<h2>Featured Movies</h2>
			<div class="review-container">
				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass movie details -->
					<input type="hidden" name="movie_id" value="4" /> <input
						type="hidden" name="title" value="The Dark Knight" /> <input
						type="hidden" name="release_date" value="2008-07-18" /> <input
						type="hidden" name="description" value="Batman faces the Joker." />
					<input type="hidden" name="rating" value="9.00" /> <input
						type="hidden" name="duration" value="152" />

					<!-- Movie card display -->
					<div class="review-card">
						<img src="img/darkKnight.png" alt="The Dark Knight"
							class="cover-image">
						<h3>The Dark Knight</h3>
						<p>Release: 2008</p>
						<p>Rating: 9.0</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>


				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass movie details -->
					<input type="hidden" name="movie_id" value="8" /> <input
						type="hidden" name="title" value="The Lion King" /> <input
						type="hidden" name="release_date" value="1994-06-15" /> <input
						type="hidden" name="description"
						value="A young lion prince flees his kingdom." /> <input
						type="hidden" name="rating" value="8.5" /> <input type="hidden"
						name="duration" value="88" />

					<!-- Movie card display -->
					<div class="review-card">
						<img src="img/lionKing.jpg" alt="The Lion King"
							class="cover-image">
						<h3>The Lion King</h3>
						<p>Release: 1994</p>
						<p>Rating: 8.5</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>


				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass movie details -->
					<input type="hidden" name="movie_id" value="6" /> <input
						type="hidden" name="title" value="Avengers: Endgame" /> <input
						type="hidden" name="release_date" value="2019-04-26" /> <input
						type="hidden" name="description"
						value="The Avengers fight Thanos." /> <input type="hidden"
						name="rating" value="8.40" /> <input type="hidden"
						name="duration" value="181" />

					<!-- Movie card display -->
					<div class="review-card">
						<img src="img/avengers.jpg" alt="Avengers: Endgame"
							class="cover-image">
						<h3>Avengers: Endgame</h3>
						<p>Release: 2019</p>
						<p>Rating: 8.4</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>
			</div>
		</section>

		<!-- Featured TV Series Section -->
		<section class="featured-section">
			<h2>Featured TV Series</h2>
			<div class="review-container">
				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass TV series details -->
					<input type="hidden" name="series_id" value="3" /> <input
						type="hidden" name="title" value="Game of Thrones" /> <input
						type="hidden" name="release_date" value="2011-04-17" /> <input
						type="hidden" name="description"
						value="Noble families vie for control of Westeros." /> <input
						type="hidden" name="rating" value="9.30" /> <input type="hidden"
						name="seasons" value="8" />

					<!-- TV Series card display -->
					<div class="review-card">
						<img src="img/got.jpg" alt="Game of Thrones" class="cover-image">
						<h3>Game of Thrones</h3>
						<p>Release: 2011</p>
						<p>Rating: 9.3</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>


				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass TV series details -->
					<input type="hidden" name="series_id" value="2" /> <input
						type="hidden" name="title" value="Stranger Things" /> <input
						type="hidden" name="release_date" value="2016-07-15" /> <input
						type="hidden" name="description"
						value="A group of kids uncover supernatural forces and government secrets." />
					<input type="hidden" name="rating" value="8.7" /> <input
						type="hidden" name="seasons" value="4" />

					<!-- TV Series card display -->
					<div class="review-card">
						<img src="img/strangerThings.jpg" alt="Stranger Things"
							class="cover-image">
						<h3>Stranger Things</h3>
						<p>Release: 2016</p>
						<p>Rating: 8.7</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>


				<form action="movieDetails.jsp" method="get">
					<!-- Hidden inputs to pass TV series details -->
					<input type="hidden" name="series_id" value="3" /> <input
						type="hidden" name="title" value="The Witcher" /> <input
						type="hidden" name="release_date" value="2019-12-20" /> <input
						type="hidden" name="description"
						value="A mutated monster hunter struggles to find his place in a world where people often prove more wicked than beasts." />
					<input type="hidden" name="rating" value="8.2" /> <input
						type="hidden" name="seasons" value="3" />

					<!-- TV Series card display -->
					<div class="review-card">
						<img src="img/witcher.png" alt="The Witcher" class="cover-image">
						<h3>The Witcher</h3>
						<p>Release: 2019</p>
						<p>Rating: 8.2</p>
						<!-- Button to submit the form -->
						<button type="submit" class="button-blue">View Details</button>
					</div>
				</form>

			</div>
		</section>

		<a href="#" class="back-link">Back to Top</a>
	</main>

	<!-- Footer Section -->
	<footer>
		<nav class="footer-nav">
			<a href="homePage.jsp" class="footer-link">Home</a> <a
				href="movie.jsp" class="footer-link">Movies</a> <a
				href="Tvseries.jsp" class="footer-link">TV Series</a> <a
				href="aboutUs.jsp" class="footer-link">About Us</a> <a
				href="ContactUs.jsp" class="footer-link">Contact Us</a>
		</nav>
		<p>&copy; 2024 cinemafy. All rights reserved.</p>
	</footer>
</body>
</html>
