package AdminManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TvSeriesManagement.TvSeriesController;
import TvSeriesManagement.TvSeriesModel;


@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("admin_id");
		boolean isTrue;
		
		isTrue=AdminController.deletedata(id);
		
		if(isTrue == true) {
			String alertMessage = "Admin Delete Successful";
			
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllAdminsServlet';</script>");
		}
		else {
			List<TvSeriesModel> TvSeriesDetail = TvSeriesController.getById(id);
			request.setAttribute("TvSeriesDetail", TvSeriesDetail);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
			
		}
		
	}

}
