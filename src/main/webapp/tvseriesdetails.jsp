<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="SeriesPackage.SeriesModel" %>

<%@ page import="javax.servlet.http.HttpSession" %>
<%
int seriesId = Integer.parseInt(request.getParameter("series_id"));
String title = request.getParameter("title");
String release_date = request.getParameter("release_date");
String description = request.getParameter("description");
double rating = Double.parseDouble(request.getParameter("rating"));
int duration = Integer.parseInt(request.getParameter("duration"));


SeriesModel series = new SeriesModel();
series.setSeriesId(seriesId);
series.setTitle(title);
series.setReleaseDate(release_date);
series.setDescription(description);
series.setRating(rating);
series.setDuration(duration);

//HttpSession session = request.getSession(false);

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TV Series Details - Cinemafy</title>
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
            <h1>Cinemafy</h1>
            <nav class="main-nav">
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="movieDetails.jsp" class="nav-link">Watch Later</a>
                <a href="profile.jsp" class="nav-link">Profile</a>
                
            </nav>
            <div class="auth-buttons"></div>
        </div>
    </header>

    <main>
        <div class="container">
            <h2>TV Series Details</h2>

            <h1><%= series.getTitle() %></h1>
       

            <p><strong>Release Date:</strong> <%= series.getReleaseDate() %></p>
            <p><strong>Description:</strong> <%= series.getDescription() %></p>
            <p><strong>Rating:</strong> <%= series.getRating() %></p>
            <p><strong>Average Episode Duration:</strong> <%= series.getDuration() %> minutes</p>

            <form action="AddtvseriesServlet" method="post" class="action-form">
                <input type="hidden" name="series_Id" value="<%= series.getSeriesId() %>">
                <input type="hidden" name="user_id" value="<%= userId %>">
                <button type="submit" class="action-button">Add to Watch Later</button>
            </form>

            <div class="button-container">
                <form action="review.jsp" method="get">
                    <input type="hidden" name="movieTitle" value="<%= series.getTitle() %>"> <!-- Use correct movieId -->
                    <button type="submit" class="action-button">Write a Review</button>
                </form>

                <form action="viewReviews.jsp" method="get">
                    <input type="hidden" name="movieTitle" value="<%= series.getTitle() %>"> <!-- Use correct movieId -->
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
