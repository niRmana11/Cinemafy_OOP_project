package cinemafypackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GetAdminInfoServlet")
public class GetAdminInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the session, but don't create a new one if it doesn't exist
        HttpSession session = request.getSession(false);

        // Check if session exists and the "admin_id" attribute is present
        if (session == null || session.getAttribute("admin_id") == null) {
            // Redirect to login page if session is invalid or expired
            response.sendRedirect("adminmanagement/adminLogin.jsp");
            return;  // Exit the method to prevent further processing
        }

        // Get admin_id from session
        int adminId = (int) session.getAttribute("admin_id");

        // Fetch admin info using AdminController
        AdminController adminController = new AdminController();
        Admin admin = adminController.getAdminInfo(adminId);

        if (admin != null) {
            request.setAttribute("adminName", admin.getUsername());
        }

        // Forward to admin dashboard
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
