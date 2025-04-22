package reviewPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Get the parameters from the request
        String name = request.getParameter("name");
        String movieTitle = request.getParameter("movieTitle");
        String reviewText = request.getParameter("reviewText");
        String rating = request.getParameter("rating");

        // Check if the rating parameter is valid (not null and not empty)
       

        // Call the delete method with all parameters
        boolean isDeleted = ReviewDBUtil.DeleteReview(name, movieTitle, reviewText, rating);

        if (isDeleted) {
            // Redirect to success page or display success message
            request.setAttribute("message", "Review deleted successfully!");
        } else {
            // If delete failed, set failure message
            request.setAttribute("message", "Failed to delete the review.");
        }

        // Forward back to review.jsp with message
        RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
        dispatcher.forward(request, response);
	}
}






