<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Movie - Cinemafy</title>
    <link rel="stylesheet" href="../css/movieInsert.css">
</head>
<body>

    <div class="form-container">
        <h2>Insert Movie Details</h2>
        <form action="../MovieInsertServlet" method="post">
            <table>
                <tr>
                    <td>Title:</td>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <td>Release Date:</td>
                    <td><input type="date" name="release_date" required></td>
                </tr>
                <tr>
                    <td>Rating:</td>
                    <td><input type="number" step="0.1" name="rating" required></td>
                </tr>
                <tr>
                    <td>Duration (mins):</td>
                    <td><input type="number" name="duration" required></td>
                </tr>
                <tr>
                    <td>Language:</td>
                    <td><input type="text" name="language" required></td>
                </tr>
                <tr>
                    <td>Poster Image URL:</td>
                    <td><input type="url" name="poster_image_url" required></td>
                </tr>
                <tr>
                    <td>Trailer URL:</td>
                    <td><input type="url" name="trailer_url" required></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><textarea name="description" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Add Movie" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
	<style>
        body {
            /* background-image: url('../images/dashboard-bg.jpg'); */
            background-image: url("../images/dashboard-bg2.jpg");
            background-size: cover;
            background-position: center;
        }
    </style>
</body>
</html>
