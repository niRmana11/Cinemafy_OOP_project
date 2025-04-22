package AdminManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String admin_id = request.getParameter("admin_id");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String created_at = request.getParameter("created_at");
		
		
		boolean isTrue;
		
		isTrue = AdminController.updatedata(admin_id, username, email, password, created_at);
		
		if(isTrue ==true) {
			
			
			List<AdminModel> AdminDetails = AdminController.getById(admin_id);
			request.setAttribute("AdminDetails", AdminDetails);
			
			String alertMessage = "Admin details Update Successfully";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='GetAllAdminsServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
