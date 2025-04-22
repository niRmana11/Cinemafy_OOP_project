package reviewManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reviewUpdateServlet")
public class reviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_id = request.getParameter("review_id");
		String userName = request.getParameter("userName");
		String movie_tvshowName = request.getParameter("movie_tvshowName");
		String review_text = request.getParameter("review_text");
		String rating = request.getParameter("rating");
		
		
		
		boolean isTrue;
		
		isTrue = ReviewController.updatedata(review_id, userName, movie_tvshowName, review_text, rating);
		
		if(isTrue ==true) {
			
			
			List<ReviewModel> reviewdetails = ReviewController.getById(review_id);
			request.setAttribute("reviewdetails", reviewdetails);
			
			String alertMessage = "Movie Update Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllReviewsServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
