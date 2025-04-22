package AdminManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		 int admin_id = AdminController.verifyAdminLogin(email, password);
		 
		 HttpSession session = request.getSession();
         session.setAttribute("admin_id", admin_id);
		
		
		try {
			List<AdminModel> adminlogin = AdminController.loginValidate(email, password);
			
			if(adminlogin != null && !adminlogin.isEmpty()) {
				
				String alertMessage = "Login Successful";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='GetAdminInfoServlet'</script>");
				
			}
			else {
				
				String alertMessage = "Login Unsuccessful";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='adminmanagement/adminLogin.jsp'</script>");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
