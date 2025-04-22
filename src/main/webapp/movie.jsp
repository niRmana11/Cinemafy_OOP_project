<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Page</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-image:url("${pageContext.request.contextPath}/img/movie.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
    color: #e0e0e0;

}

a {
    text-decoration: none;
    color: inherit;
}

h1 {
    color: #007bff; /* Bright color for the site name */
    margin: 0;
    font-size: 32px;
}

.main-nav {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
}

.nav-link {
    margin: 0 15px;
    font-size: 18px;
    color: #e0e0e0; /* Light text color */
    position: relative;
}

.nav-link::after {
    content: '';
    display: block;
    width: 0%;
    height: 2px;
    background: #007bff;
    transition: width 0.3s;
    position: absolute;
    bottom: -5px;
    left: 0;
}

.nav-link:hover::after {
    width: 100%;
}

.auth-buttons {
    display: flex;
    align-items: center;
}


.auth-link {
    margin-left: 15px;
    font-size: 18px;
    padding: 8px 15px;
    border-radius: 5px;
    border: 1px solid #007bff;
    color: #007bff;
     text-decoration: none;
}

.auth-link:hover {
    background-color: #007bff;
    color: #fff;
}


        
.signout-button {
    background-color: #ff6b6b; /* Light red background */
    color: #ffffff; /* White text */
    border: none; /* Remove default button border */
    padding: 8px 15px; /* Add some padding */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Change cursor to pointer on hover */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

.signout-button:hover {
    background-color: #c82333; 
}

.signup-button {
    background-color: #007bff;
    color: #fff;
    border: none;
}

.signup-button:hover {
    background-color: #0056b3;
}


/* Header Styles */
header {
	background-color: #1a1a1a;
	padding: 20px;
	border-bottom: 1px solid #333;
}

.header-container {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
}

.search-container {
	margin: 100px auto 20px;
	text-align: center;
	width: 100%;
}

#search-bar {
	width: 50%;
	padding: 10px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.movie {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	margin-top: 20px;
	width: 90%;
	text-align: center;
	color: white;
}

.movie-list {
	margin-top: 20px;
	width: 90%;
	text-align: center;
	color: black;
}

.movie-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 20px;
	width: 100%;
	padding: 20px;
}

.movie-card {
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 8px;
	padding: 15px;
	text-align: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s;
	opacity: 0.9;
}

.movie-card:hover {
	transform: scale(1.05);
}

.movie-card img {
	max-width: 100%;
	border-radius: 8px;
	margin-bottom: 10px;
}

.movie-card button {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
}

.movie-card button:hover {
	background-color: #0056b3;
}

/* Footer Styles */
footer {
	background-color: #1a1a1a;
	padding: 20px;
	border-top: 1px solid #333;
	text-align: center;
}

.footer-nav {
	margin-bottom: 15px;
}

.footer-link {
	margin: 0 10px;
	font-size: 16px;
	color: #e0e0e0;
}

.footer-link:hover {
	color: #007bff;
}

footer p {
	font-size: 14px;
	color: #e0e0e0;
}
</style>



<script>
        // Check if user is logged in
        const isLoggedIn = <%= (session.getAttribute("isLoggedIn") != null && (boolean)session.getAttribute("isLoggedIn")) ? "true" : "false" %>;

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


<script>
        function searchMovie() {
            let input = document.getElementById('search-bar').value.toLowerCase();
            let movieCards = document.getElementsByClassName('movie-card');
            
            for (let i = 0; i < movieCards.length; i++) {
                let title = movieCards[i].getElementsByTagName('h3')[0].textContent.toLowerCase();
                if (title.includes(input)) {
                    movieCards[i].style.display = '';
                } else {
                    movieCards[i].style.display = 'none';
                }
            }
        }
    </script>
</head>
<body>

	<!-- Header Section -->
	<header>
		<div class="header-container">
			<h1>cinemafy.</h1>
			<nav class="main-nav">
				<a href="homePage.jsp" class="nav-link">Home</a> <a href="movie.jsp"
					class="nav-link">Movies</a> <a href="Tvseries.jsp"
					class="nav-link">TV Series</a> <a href="aboutUs.jsp"
					class="nav-link">About Us</a> <a href="ContactUs.jsp"
					class="nav-link">Contact Us</a>
			</nav>
			<div class="auth-buttons"></div>
		</div>
	</header>

	<div class="search-container">
		<input type="text" id="search-bar" onkeyup="searchMovie()"
			placeholder="Search for movies...">
	</div>
	<section class="movie">
		<h1>Cinemafy Movies</h1>

	</section>

	<section class="movie-list">

		<div class="movie-grid">

			<div class="movie-card">
				<img src="${pageContext.request.contextPath}/img/Inception.jpg"
					alt="Inception Poster">
				<h3>Inception</h3>
				<p>Genre: Sci-Fi, Thriller</p>
				<p>Rating: 8.80/10</p>
				<p>Release Date: 2010-07-16</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="1"/>
				<input type="hidden" name = "title" value="Inception"/>
				<input type="hidden" name = "release_date" value="2010-07-16"/>
				<input type="hidden" name = "description" value="A mind-bending thriller."/>
				<input type="hidden" name = "rating" value="8.80"/>
				<input type="hidden" name = "duration" value="148"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img src="${pageContext.request.contextPath}/img/The Matrix.jpg"
					alt="The Matrix Poster">
				<h3>The Matrix</h3>
				<p>Genre: Action, Sci-Fi</p>
				<p>Rating: 8.70/10</p>
				<p>Release Date: 1999-03-31</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="2"/>
				<input type="hidden" name = "title" value="The Matrix"/>
				<input type="hidden" name = "release_date" value="1999-03-31"/>
				<input type="hidden" name = "description" value="A hacker uncovers a dystopian reality."/>
				<input type="hidden" name = "rating" value="8.70"/>
				<input type="hidden" name = "duration" value="136"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img
					src="${pageContext.request.contextPath}/img/Interstellar.jpg"
					alt="Interstellar Poster">
				<h3>Interstellar</h3>
				<p>Genre: Sci-Fi, Adventure</p>
				<p>Rating: 8.60/10</p>
				<p>Release Date: 2014-11-07</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="3"/>
				<input type="hidden" name = "title" value="Interstellar"/>
				<input type="hidden" name = "release_date" value="2014-11-07"/>
				<input type="hidden" name = "description" value="A space exploration epic."/>
				<input type="hidden" name = "rating" value="8.60"/>
				<input type="hidden" name = "duration" value="169"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img
					src="${pageContext.request.contextPath}/img/The Dark Knight.jpg"
					alt="The Dark Knight Poster">
				<h3>The Dark Knight</h3>
				<p>Genre: Action, Crime</p>
				<p>Rating: 9.00/10</p>
				<p>Release Date: 2008-07-18</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="4"/>
				<input type="hidden" name = "title" value="The Dark Knight"/>
				<input type="hidden" name = "release_date" value="2008-07-18"/>
				<input type="hidden" name = "description" value="Batman faces the Joker."/>
				<input type="hidden" name = "rating" value="9.00"/>
				<input type="hidden" name = "duration" value="152"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img
					src="${pageContext.request.contextPath}/img/Pulp Fiction.jpg"
					alt="Pulp Fiction Poster">
				<h3>Pulp Fiction</h3>
				<p>Genre: Crime, Drama</p>
				<p>Rating: 8.90/10</p>
				<p>Release Date: 1994-10-14</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="5"/>
				<input type="hidden" name = "title" value="Pulp Fiction"/>
				<input type="hidden" name = "release_date" value="1994-10-14"/>
				<input type="hidden" name = "description" value="A series of interconnected crime stories."/>
				<input type="hidden" name = "rating" value="8.90"/>
				<input type="hidden" name = "duration" value="154"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img src="${pageContext.request.contextPath}/img/Endgame.jpg"
					alt="Avengers: Endgame Poster">
				<h3>Avengers: Endgame</h3>
				<p>Genre: Action, Sci-Fi</p>
				<p>Rating: 8.40/10</p>
				<p>Release Date: 2019-04-26</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="6"/>
				<input type="hidden" name = "title" value="Avengers: Endgame"/>
				<input type="hidden" name = "release_date" value="2019-04-26"/>
				<input type="hidden" name = "description" value="The Avengers fight Thanos."/>
				<input type="hidden" name = "rating" value="8.40"/>
				<input type="hidden" name = "duration" value="181"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img src="${pageContext.request.contextPath}/img/Titanic.jpg"
					alt="Titanic Poster">
				<h3>Titanic</h3>
				<p>Genre: Romance, Drama</p>
				<p>Rating: 7.80/10</p>
				<p>Release Date: 1997-12-19</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="7"/>
				<input type="hidden" name = "title" value="Titanic"/>
				<input type="hidden" name = "release_date" value="1997-12-19"/>
				<input type="hidden" name = "description" value="A romance aboard the doomed ship."/>
				<input type="hidden" name = "rating" value="7.80"/>
				<input type="hidden" name = "duration" value="195"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img
					src="${pageContext.request.contextPath}/img/The Lion King.jpg"
					alt="The Lion King Poster">
				<h3>The Lion King</h3>
				<p>Genre: Animation, Family</p>
				<p>Rating: 8.50/10</p>
				<p>Release Date: 1994-06-15</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="8"/>
				<input type="hidden" name = "title" value="The Lion King"/>
				<input type="hidden" name = "release_date" value="1994-06-15"/>
				<input type="hidden" name = "description" value="A young lion prince flees his kingdom."/>
				<input type="hidden" name = "rating" value="8.50"/>
				<input type="hidden" name = "duration" value="88"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img src="${pageContext.request.contextPath}/img/Gladiator.jpg"
					alt="Gladiator Poster">
				<h3>Gladiator</h3>
				<p>Genre: Action, Drama</p>
				<p>Rating: 8.50/10</p>
				<p>Release Date: 2000-05-05</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="9"/>
				<input type="hidden" name = "title" value="Gladiator"/>
				<input type="hidden" name = "release_date" value="2000-05-05"/>
				<input type="hidden" name = "description" value="A general turned gladiator seeks revenge."/>
				<input type="hidden" name = "rating" value="8.50"/>
				<input type="hidden" name = "duration" value="155"/>
				<button type="submit">View Details</button>
				</form>
			</div>


			<div class="movie-card">
				<img
					src="${pageContext.request.contextPath}/img/The Godfather.jpg"
					alt="The Godfather Poster">
				<h3>The Godfather</h3>
				<p>Genre: Crime, Drama</p>
				<p>Rating: 9.20/10</p>
				<p>Release Date: 1972-03-24</p>
				<form action = "movieDetails.jsp" method = get>
				<input type="hidden" name = "movie_id" value="10"/>
				<input type="hidden" name = "title" value="The Godfather"/>
				<input type="hidden" name = "release_date" value="1972-03-24"/>
				<input type="hidden" name = "description" value="The rise of a mafia family."/>
				<input type="hidden" name = "rating" value="9.20"/>
				<input type="hidden" name = "duration" value="175"/>
				<button type="submit">View Details</button>
				</form>
			</div>
		</div>
	</section>

	
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
