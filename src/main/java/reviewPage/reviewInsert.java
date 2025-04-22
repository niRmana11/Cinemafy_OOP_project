package reviewPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/reviewInsert")
public class reviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession(false);
		
		if (session == null || session.getAttribute("user_id") == null) {
            // Redirect to login page if session is invalid or expired
            response.sendRedirect("login.jsp");
            return;  // Exit the method to prevent further processing
        }
		
		
		
		
		String name = request.getParameter("name");
		String movieTitle = request.getParameter("movieTitle");
		String reviewText = request.getParameter("reviewText");
		String ratingStr = request.getParameter("rating");
		int rating = Integer.parseInt(ratingStr);
		
		
		boolean isTrue;
		isTrue = ReviewDBUtil.insertReview(name, movieTitle, reviewText, rating);
		
		if(isTrue == true) {
			request.setAttribute("message", "Review inserted successfully!");
		}else {
			request.setAttribute("message", "Review insertion failed. Please try again.");
		}
		
		request.setAttribute("name", name);
        request.setAttribute("movieTitle", movieTitle);
        request.setAttribute("reviewText", reviewText);
        request.setAttribute("rating", rating);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateReview.jsp");
        dispatcher.forward(request, response);
		
		
	}

}


