<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Review - Cinemafy</title>
    <link rel="stylesheet" href="styles/adminUpdateReview.css">
</head>
<body>

    <%
    String review_id = request.getParameter("review_id");
	String userName = request.getParameter("userName");
	String movie_tvshowName = request.getParameter("movie_tvshowName");
	String review_text = request.getParameter("review_text");
	String rating = request.getParameter("rating");
    %>

    <div class="form-container">
        <h2>Update Review Details</h2>
        <form action="reviewUpdateServlet" method="post">
            <table>
                <tr>
                    <td>Review ID:</td>
                    <td><input type="text" name="review_id" value="<%=review_id%>" readonly></td>
                </tr>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="userName" value="<%=userName%>" required></td>
                </tr>
                <tr>
                    <td>Movie / Tv Show Name:</td>
                    <td><input type="text" name="movie_tvshowName" value="<%=movie_tvshowName%>" required></td>
                </tr>
                <tr>
                    <td>Review:</td>
                    <td><input type="text" name="review_text" value="<%=review_text%>" required></td>
                </tr>
                <tr>
                    <td>Rating:</td>
                    <td><input type="text" step="0.1" name="rating" value="<%=rating%>" required></td>
                </tr>
                
                    <td colspan="2">
                        <input type="submit" value="Update Review" class="submit-btn">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
