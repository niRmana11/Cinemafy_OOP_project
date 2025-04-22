<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User Profile - Cinemafy</title>
    <link rel="stylesheet" href="styles/editProfile.css"> <!-- External CSS -->
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="header-container">
            <h1 class="logo">Cinemafy</h1>
            <nav class="main-nav">
                <a href="homePage.jsp" class="nav-link">Home</a>
                <a href="movie.jsp" class="nav-link">Movies</a>
                <a href="Tvseries.jsp" class="nav-link">TV Series</a>
                <a href="aboutUs.jsp" class="nav-link">About Us</a>
                <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
            </nav>
            
        </div>
    </header>

    <main>
        <div class="edit-profile-container">
            <h1>Edit Your Profile</h1>
            <form method="post" action="ProfileServlet">
                <input type="hidden" name="action" value="updateProfile"> <!-- Action parameter for updating -->
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" required>
                    <img src="https://cdn-icons-png.flaticon.com/512/709/709612.png" 
                         class="show-hide-icon" id="togglePassword" alt="Show/Hide" width="24" height="24">
                </div>

                <button type="submit">Save Changes</button>
            </form>
            <a href="profile" class="back-link">Go back to User Profile</a>
        </div>
    </main>

    <script src="editProfile.js"></script> <!-- External JavaScript -->
    
    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <nav class="footer-nav">
                <a href="homePage.jsp" class="footer-link">Home</a>
                <a href="movie.jsp" class="footer-link">Movies</a>
                <a href="Tvseries.jsp" class="footer-link">TV Series</a>
                <a href="aboutUs.jsp" class="footer-link">About Us</a>
                <a href="ContactUs.jsp" class="footer-link">Contact Us</a>
            
            </nav>
            <p>&copy; 2024 Cinemafy. All rights reserved.</p>
        </div>
    </footer>
    
    <script>
    const togglePassword = document.getElementById('togglePassword');
const passwordField = document.getElementById('password');

togglePassword.addEventListener('click', () => {
    const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordField.setAttribute('type', type);


    togglePassword.src = 
        type === 'password' 
        ? 'https://cdn-icons-png.flaticon.com/512/709/709612.png' // Closed eye
        : 'https://cdn-icons-png.flaticon.com/512/159/159604.png'; // Open eye
});
</script>
    
</body>
</html>
