<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cinemafy - About Us</title>
    <link rel="stylesheet" href="styles/aboutUsStyles.css">
    
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
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="movie.jsp" class="nav-link">Movies</a>
                <a href="Tvseries.jsp" class="nav-link">TV Series</a>
                <a href="aboutUs.jsp" class="nav-link">About Us</a>
                <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
            </nav>
            <div class="auth-buttons">
               
            </div>
        </div>
    </header>
    
    <!-- Main Content -->
    <main>
        <section class="about-section">
            <h2>About Us</h2>
            <p>Welcome to cinemafy, your ultimate destination for exploring and discovering the world of movies and TV series. We are passionate about cinema and strive to provide our users with an extensive library of films and shows, complete with reviews, ratings, and recommendations.</p>

            <p>Our team is dedicated to curating the best content for you. Whether you're a fan of action, drama, or comedy, we've got something for everyone. Our platform allows users to share their thoughts and opinions through reviews, making it a vibrant community of movie lovers.</p>


            <h3>Our Vision</h3>
            <p>To be the top platform for movie and TV series fans, offering an engaging experience that keeps you coming back.</p>

            <h3>Our Mission</h3>
            <p>To help viewers make informed choices and build a community of cinema lovers.</p>
        </section>

        
    </main>

    <!-- Footer Section -->
    <footer>
        <nav class="footer-nav">
            <a href="homePage.jsp" class="footer-link">Home</a>
            <a href="movie.jsp" class="footer-link">Movies</a>
            <a href="Tvseries.jsp" class="footer-link">TV Series</a>
            <a href="aboutUs.jsp" class="footer-link">About Us</a>
            <a href="ContactUs.jsp" class="footer-link">Contact Us</a>
        </nav>
        <p>&copy; 2024 cinemafy. All rights reserved.</p>
    </footer>
</body>
</html>
