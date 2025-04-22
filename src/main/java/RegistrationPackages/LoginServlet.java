package RegistrationPackages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Get connection to the database
            Connection conn = DBconnection.getConnection();

            // Prepare SQL query to validate the user
            String sql = "SELECT user_id, name, username FROM Users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Retrieve user details from the result set
                int user_id = rs.getInt("user_id");
                String name = rs.getString("name");
                String user_username = rs.getString("username");

                // Create a session and store user details
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user_id);
                session.setAttribute("name", name);
                session.setAttribute("username", user_username);
                session.setAttribute("isLoggedIn", true);
                session.setMaxInactiveInterval(30 * 60);

                // Redirect to a dashboard or homepage
                response.sendRedirect("homePage.jsp");  // Change this to the correct page
            } else {
            	String alertMessage = "Invalid Credentials , Please try again";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='login.jsp'</script>");
                //response.sendRedirect("login.jsp?error=Invalid username or password");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the error, redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
