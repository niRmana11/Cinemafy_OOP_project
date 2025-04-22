<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Cinemafy</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
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

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0d0d0d;
            color: #f1f1f1;
        }

        /* Header Styles */
        header {
            background-color: #1f1f1f;
            padding: 20px;
            text-align: center;
        }

        .header-container h1 {
            margin: 0;
            color: #e50914;
        }

        .main-nav {
            margin: 10px 0;
        }

        .nav-link {
            margin: 0 15px;
            color: #e50914;
            text-decoration: none;
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

        /* Main Container Styles */
        .container {
            max-width: 900px;
            margin: 60px auto;
            padding: 30px;
            background-color: #1f1f1f;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.8);
            text-align: center;
        }

        h1 {
            color: #e50914;
            margin-bottom: 30px;
        }

        /* Card Styles */
        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            width: 250px;
            padding: 20px;
            background-color: #2c2c2c;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(255, 255, 255, 0.2);
        }

        .card h2 {
            color: #e50914;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            color: #d3d3d3;
        }

        /* Social Links Styles */
        .social-links {
            margin-top: 30px;
        }

        .social-links a {
            margin: 0 10px;
            font-size: 30px;
            color: #e50914;
            text-decoration: none;
            transition: color 0.3s;
        }

        .social-links a:hover {
            color: #f40612;
        }

        /* Footer Styles */
        footer {
            margin-top: 30px;
            color: #888;
            font-size: 14px;
            text-align: center;
        }

        .footer-nav {
            margin: 10px 0;
        }

        .footer-link {
            margin: 0 15px;
            color: #888;
            text-decoration: none;
        }

        @media (max-width: 600px) {
            .cards {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
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
    <div class="container">
        <h1>Contact Us</h1>

        <div class="cards">
            <div class="card">
                <h2><i class="fas fa-envelope"></i> Email Us</h2>
                <p>support@cinemafy.com</p>
            </div>

            <div class="card">
                <h2><i class="fas fa-phone-alt"></i> Call Us</h2>
                <p>+1-800-123-4567</p>
            </div>

            <div class="card">
                <h2><i class="fas fa-map-marker-alt"></i> Location</h2>
                <p>1234 Cinemafy Blvd, Los Angeles, CA</p>
            </div>
        </div>

        <div class="social-links">
            <a href="https://facebook.com/cinemafy" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://twitter.com/cinemafy" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://instagram.com/cinemafy" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>

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
