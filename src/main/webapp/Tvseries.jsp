<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tv Series Page</title>

	<style>
body {
	font-family: Arial, sans-serif;
	background-image:
		url("${pageContext.request.contextPath}/img/movie.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	

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
	width:100%;
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

.series-list {
	margin-top: 20px;
	width: 90%;
	text-align: center;
	color: black;
}

.movie-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 20px;
	width: 90%;
	padding: 70px;
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
	width:100%;
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


<script>
	function searchMovie() {
		let input = document.getElementById('search-bar').value.toLowerCase();
		let movieCards = document.getElementsByClassName('movie-card');

		for (let i = 0; i < movieCards.length; i++) {
			let title = movieCards[i].getElementsByTagName('h3')[0].textContent
					.toLowerCase();
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
	
	<header>
    <div class="header-container">
        <h1>cinemafy.</h1>
        <nav class="main-nav">
            <a href="homePage.jsp" class="nav-link">Home</a>
            <a href="movie.jsp" class="nav-link">Movies</a>
            <a href="Tvseries.jsp" class="nav-link">TV Series</a>
            <a href="aboutUs.jsp" class="nav-link">About Us</a>
            <a href="contact.html" class="nav-link">Contact Us</a>
        </nav>
        <div class="auth-buttons"></div>
    </div>
</header>


	<div class="search-container">
		<input type="text" id="search-bar" onkeyup="searchMovie()"
			placeholder="Search for Tv Series...">
	</div>
	<section class="movie">
		<h1>Cinemafy Tv Series</h1>

	</section>

	<section class="series-list">

		<div>
			<div class="movie-grid">

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/breakingbad.jpg"
						alt="Breaking Bad Poster">
					<h3>Breaking Bad</h3>
					<p>Genre: Drama, Thriller</p>
					<p>Rating: 9.50/10</p>
					<p>Release Date: 2008-01-20</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="1" /> <input
							type="hidden" name="title" value="Breaking Bad" /> <input
							type="hidden" name="release_date" value="2008-01-20" /> <input
							type="hidden" name="description"
							value="A chemistry teacher turned meth producer." /> <input
							type="hidden" name="rating" value="9.50" /> <input type="hidden"
							name="duration" value="5" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img
						src="${pageContext.request.contextPath}/img/strangerThings.jpg"
						alt="Stranger Things Poster">
					<h3>Stranger Things</h3>
					<p>Genre: Sci-Fi, Thriller</p>
					<p>Rating: 8.70/10</p>
					<p>Release Date: 2016-07-15</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="2" /> <input
							type="hidden" name="title" value="Stranger Things" /> <input
							type="hidden" name="release_date" value="2016-07-15" /> <input
							type="hidden" name="description"
							value="A group of kids face supernatural threats." /> <input
							type="hidden" name="rating" value="8.70" /> <input type="hidden"
							name="duration" value="4" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/got.jpg"
						alt="Game of Thrones Poster">
					<h3>Game of Thrones</h3>
					<p>Genre: Fantasy, Drama</p>
					<p>Rating: 9.30/10</p>
					<p>Release Date: 2011-04-17</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="3" /> <input
							type="hidden" name="title" value="Game of Thrones" /> <input
							type="hidden" name="release_date" value="2011-04-17" /> <input
							type="hidden" name="description"
							value="Noble families vie for control of Westeros." /> <input
							type="hidden" name="rating" value="9.30" /> <input type="hidden"
							name="duration" value="8" />
						<button type="submit">View Details</button>
					</form>

				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/mandalorian.jpg"
						alt="The Mandalorian Poster">
					<h3>The Mandalorian</h3>
					<p>Genre: Sci-Fi, Action</p>
					<p>Rating: 8.80/10</p>
					<p>Release Date: 2019-11-12</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="4" /> <input
							type="hidden" name="title" value="The Mandalorian" /> <input
							type="hidden" name="release_date" value="2019-11-12" /> <input
							type="hidden" name="description"
							value="A lone bounty hunter navigates the galaxy." /> <input
							type="hidden" name="rating" value="8.80" /> <input type="hidden"
							name="duration" value="3" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/witcher.jpg"
						alt="The Witcher Poster">
					<h3>The Witcher</h3>
					<p>Genre: Fantasy, Drama</p>
					<p>Rating: 8.20/10</p>
					<p>Release Date: 2019-12-20</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="5" /> <input
							type="hidden" name="title" value="The Witcher" /> <input
							type="hidden" name="release_date" value="2019-12-20" /> <input
							type="hidden" name="description"
							value="A monster hunter journeys through a fantasy world." /> <input
							type="hidden" name="rating" value="8.20" /> <input type="hidden"
							name="duration" value="3" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/friends.jpg"
						alt="Friends Poster">
					<h3>Friends</h3>
					<p>Genre: Comedy, Romance</p>
					<p>Rating: 8.90/10</p>
					<p>Release Date: 1994-09-22</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="6" /> <input
							type="hidden" name="title" value="Friends" /> <input
							type="hidden" name="release_date" value="1994-09-22" /> <input
							type="hidden" name="description"
							value="Six friends navigate life in New York." /> <input
							type="hidden" name="rating" value="8.90" /> <input type="hidden"
							name="duration" value="10" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/office.jpg"
						alt="The Office Poster">
					<h3>The Office</h3>
					<p>Genre: Comedy</p>
					<p>Rating: 8.90/10</p>
					<p>Release Date: 2005-03-24</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="7" /> <input
							type="hidden" name="title" value="The Office" /> <input
							type="hidden" name="release_date" value="2005-03-24" /> <input
							type="hidden" name="description"
							value="A mockumentary about office employees." /> <input
							type="hidden" name="rating" value="8.90" /> <input type="hidden"
							name="duration" value="9" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/sherlock.jpg"
						alt="Sherlock Poster">
					<h3>Sherlock</h3>
					<p>Genre: Mystery, Drama</p>
					<p>Rating: 9.10/10</p>
					<p>Release Date: 2010-07-25</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="8" /> <input
							type="hidden" name="title" value="Sherlock" /> <input
							type="hidden" name="release_date" value="2010-07-25" /> <input
							type="hidden" name="description"
							value="A modern adaptation of Sherlock Holmes." /> <input
							type="hidden" name="rating" value="9.10" /> <input type="hidden"
							name="duration" value="4" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/crown.jpg"
						alt="The Crown Poster">
					<h3>The Crown</h3>
					<p>Genre: Drama</p>
					<p>Rating: 8.70/10</p>
					<p>Release Date: 2016-11-04</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="9" /> <input
							type="hidden" name="title" value="The Crown" /> <input
							type="hidden" name="release_date" value="2016-11-04" /> <input
							type="hidden" name="description"
							value="The reign of Queen Elizabeth II." /> <input type="hidden"
							name="rating" value="8.70" /> <input type="hidden"
							name="duration" value="6" />
						<button type="submit">View Details</button>
					</form>
				</div>

				<div class="movie-card">
					<img src="${pageContext.request.contextPath}/img/peakyblinders.jpg"
						alt="Peaky Blinders Poster">
					<h3>Peaky Blinders</h3>
					<p>Genre: Crime, Drama</p>
					<p>Rating: 8.80/10</p>
					<p>Release Date: 2013-09-12</p>
					<form action="tvseriesdetails.jsp" method=post>
						<input type="hidden" name="series_id" value="10" /> <input
							type="hidden" name="title" value="Peaky Blinders" /> <input
							type="hidden" name="release_date" value="2013-09-12" /> <input
							type="hidden" name="description"
							value="A gang leader rises in post-WWI England." /> <input
							type="hidden" name="rating" value="8.80" /> <input type="hidden"
							name="duration" value="6" />
						<button type="submit">View Details</button>
					</form>
				</div>
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
        <a href="contact.html" class="footer-link">Contact Us</a>

    </nav>
    <p>&copy; 2024 cinemafy. All rights reserved.</p>
</footer>




</body>
</html>
