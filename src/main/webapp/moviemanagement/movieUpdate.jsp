<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie - Cinemafy</title>
    <link rel="stylesheet" href="css/movieInsert.css">
</head>
<body>

    <%
        String movie_id = request.getParameter("movie_id");
        String title = request.getParameter("title");
        String release_date = request.getParameter("release_date");
        String description = request.getParameter("description");
        String rating = request.getParameter("rating");
        String duration = request.getParameter("duration");
        String language = request.getParameter("language");
        String poster_image_url = request.getParameter("poster_image_url");
        String trailer_url = request.getParameter("trailer_url");
    %>

    <div class="form-container">
        <h2>Update Movie Details</h2>
        <form action="../MovieUpdateServlet" method="post">
            <table>
                <tr>
                    <td>Movie ID:</td>
                    <td><input type="text" name="movie_id" value="<%=movie_id%>" readonly></td>
                </tr>
                <tr>
                    <td>Title:</td>
                    <td><input type="text" name="title" value="<%=title%>" required></td>
                </tr>
                <tr>
                    <td>Release Date:</td>
                    <td><input type="date" name="release_date" value="<%=release_date%>" required></td>
                </tr>
                <tr>
                    <td>Rating:</td>
                    <td><input type="text" step="0.1" name="rating" value="<%=rating%>" required></td>
                </tr>
                <tr>
                    <td>Duration (mins):</td>
                    <td><input type="text" name="duration" value="<%=duration%>" required></td>
                </tr>
                <tr>
                    <td>Language:</td>
                    <td><input type="text" name="language" value="<%=language%>" required></td>
                </tr>
                <tr>
                    <td>Poster Image URL:</td>
                    <td><input type="text" name="poster_image_url" value="<%=poster_image_url%>" required></td>
                </tr>
                <tr>
                    <td>Trailer URL:</td>
                    <td><input type="text" name="trailer_url" value="<%=trailer_url%>" required></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><textarea name="description" required><%=description%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Update Movie" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    
    <style>
        body {
            /* background-image: url('images/dashboard-bg.jpg'); */
			background-image: url("../images/dashboard-bg2.jpg");
            background-size: cover;
            background-position: center;
        }
    </style>

</body>
</html>
