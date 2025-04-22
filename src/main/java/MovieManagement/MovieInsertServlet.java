package MovieManagement;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MovieInsertServlet")
public class MovieInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String release_date = request.getParameter("release_date");
		String rating = request.getParameter("rating");
		String duration = request.getParameter("duration");
		String language = request.getParameter("language");
		String poster_image_url = request.getParameter("poster_image_url");
		String trailer_url = request.getParameter("trailer_url");
		String description = request.getParameter("description");
		
		boolean isTrue;
		
		isTrue = MovieController.insertdata(title, release_date, description, rating, duration, language, poster_image_url, trailer_url);
		
		if(isTrue ==true) {
			
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllMovieServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
