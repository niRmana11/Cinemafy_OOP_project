package TvSeriesManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetAllTvSeriesServlet")
public class GetAllTvSeriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <TvSeriesModel> allTvSeries = TvSeriesController.getAllTvSeries();
		request.setAttribute("allTvSeries", allTvSeries);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("tvseriesmanagement/tvseriesmanagement.jsp");
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	
	}
	
}
