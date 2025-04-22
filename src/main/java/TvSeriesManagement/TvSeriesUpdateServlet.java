package TvSeriesManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TvSeriesUpdateServlet")
public class TvSeriesUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String series_id = request.getParameter("series_id");
		String title = request.getParameter("title");
		String release_date = request.getParameter("release_date");
		String rating = request.getParameter("rating");
		String total_seasons = request.getParameter("total_seasons");
		String poster_image_url = request.getParameter("poster_image_url");
		String trailer_url = request.getParameter("trailer_url");
		String description = request.getParameter("description");
		
		
		boolean isTrue;
		
		isTrue = TvSeriesController.updatedata(series_id, title, release_date, description, rating, total_seasons, poster_image_url, trailer_url);
		
		if(isTrue ==true) {
			
			
			List<TvSeriesModel> TvSeriesdetails = TvSeriesController.getById(series_id);
			request.setAttribute("TvSeriesdetails", TvSeriesdetails);
			
			String alertMessage = "Tv Series Update Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllTvSeriesServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}


}
