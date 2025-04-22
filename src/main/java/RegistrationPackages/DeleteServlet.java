package RegistrationPackages;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("id");
		
		boolean isTrue;
		isTrue = RegController.deletedata(user_id);
		
		if(isTrue == true ) {
			
			String alertmessage = "Data Delete Successful ";
			response.getWriter().println("<script>alert('"+alertmessage+"'); window.location.href='getAllServlrt'</script>");
			
		}
		else {
			
			List<RegModel> userDetails = RegController.getByID(user_id);
			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dispacher =  request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
		} 
		
	}

}
