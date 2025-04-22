<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="MovieDetailsPackage.Movie" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Hardcoded Movie object for testing purposes
    
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    String title = request.getParameter("title");
    String release_date = request.getParameter("release_date");
    String description = request.getParameter("description");
    double rating = Double.parseDouble(request.getParameter("rating"));
    int duration = Integer.parseInt(request.getParameter("duration"));
    
    
    
    
    
    Movie movie = new Movie();
    movie.setMovieId(movieId);
    movie.setTitle(title);
    movie.setReleaseDate(release_date);
    movie.setDescription(description);
    movie.setRating(rating);
    movie.setDuration(duration);
    
    
    
    
   // HttpSession session = request.getSession(false);

    // Check if session exists and the "admin_id" attribute is present
    if (session == null || session.getAttribute("user_id") == null) {
        // Redirect to login page if session is invalid or expired
        response.sendRedirect("login.jsp");
        return;  // Exit the method to prevent further processing
    }
	
	
    int userId = (int) session.getAttribute("user_id");
     
    		
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Movie Details</title>
    <link rel="stylesheet" href="styles/movieDetails.css"> <!-- Link to external CSS -->
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
            <h1>Cinemafy.</h1>
            <nav class="main-nav">
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="watchlater.jsp" class="nav-link">Watch Later</a>
                
               
            </nav>
            <div class="auth-buttons"></div>
        </div>
    </header>

    <main>
        <div class="container">
            <h2>Movie/Series Details</h2>
            <h1><%= movie.getTitle() %></h1>
          
            <p><strong>Release Date:</strong> <%= movie.getReleaseDate() %></p>
            <p><strong>Description:</strong> <%= movie.getDescription() %></p>
            <p><strong>Rating:</strong> <%= movie.getRating() %></p>
            <p><strong>Duration:</strong> <%= movie.getDuration() %> minutes</p>

            <form action="AddWatchLaterServlet" method="post">
                <input type="hidden" name="movie_id" value="<%= movie.getMovieId() %>">
                <input type="hidden" name="userId" value="<%= userId %>">
                <button type="submit" class="action-button">Add to Watch Later</button>
            </form>

            <!-- Buttons to Write and View Reviews -->
            <div class="button-container">
                <form action="review.jsp" method="get">
                    <input type="hidden" name="movieTitle" value="<%= movie.getTitle() %>"> <!-- Use correct movieId -->
                    <button type="submit" class="action-button">Write a Review</button>
                </form>

                <form action="viewReviews.jsp" method="get">
                    <input type="hidden" name="movieTitle" value="<%= movie.getTitle() %>"> <!-- Use correct movieId -->
                    <button type="submit" class="action-button">View All Reviews</button>
                </form>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Cinemafy. All rights reserved.</p>
    </footer>
</body>
</html>
