package reviewPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve updated data
		// Retrieve parameters from the request
		
		String name = request.getParameter("name");
		String movieTitle = request.getParameter("movieTitle");
		String reviewText = request.getParameter("reviewText");
		String ratingStr = request.getParameter("rating");

		// Parse the id
		  // Convert the id to an integer
		int rating = Integer.parseInt(ratingStr);

		// Update the review in the database using the reviewId (ReviewDBUtil is your utility class)
		boolean isUpdated = ReviewDBUtil.updateReview(name, movieTitle, reviewText, rating);


        // Set the message based on success or failure
        if (isUpdated) {
            request.setAttribute("message", "Review updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update the review.");
        }

        // Pass updated data to the next JSP
        request.setAttribute("name", name);
        request.setAttribute("movieTitle", movieTitle);
        request.setAttribute("reviewText", reviewText);
        request.setAttribute("rating", rating);

        // Forward the request to the JSP to display the message and updated review
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateReview.jsp");
        dispatcher.forward(request, response);
	}
}



