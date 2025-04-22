package reviewManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reviewDeleteServlet")
public class reviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("review_id");
		boolean isTrue;
		
		isTrue=ReviewController.deletedata(id);
		
		if(isTrue == true) {
			String alertMessage = "Movie Delete Successful";
			
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllReviewsServlet';</script>");
		}
		else {
			List<ReviewModel> MovieDetail = ReviewController.getById(id);
			request.setAttribute("MovieDetail", MovieDetail);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
			
		}
		
	}

}
