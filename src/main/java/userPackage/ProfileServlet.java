package userPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

		/*
		 * HttpSession session = request.getSession(); session.setAttribute("user_id",
		 * 1);
		 */ // Temporary user ID for testing
		
		HttpSession session = request.getSession(false);

        // Check if session exists and the "admin_id" attribute is present
        if (session == null || session.getAttribute("user_id") == null) {
            // Redirect to login page if session is invalid or expired
            response.sendRedirect("login.jsp");
            return;  // Exit the method to prevent further processing
        }
		
		
        int userId = (int) session.getAttribute("user_id");
        Connection con = DBConnection.getConnection();

        try {
            // Fetch user details
            String userQuery = "SELECT name, username, email, registration_date FROM Users WHERE user_id = ?";
            PreparedStatement userStmt = con.prepareStatement(userQuery);
            userStmt.setInt(1, userId);
            ResultSet userRs = userStmt.executeQuery();

            if (userRs.next()) {
                request.setAttribute("name", userRs.getString("name"));
                request.setAttribute("username", userRs.getString("username"));
                request.setAttribute("email", userRs.getString("email"));
                request.setAttribute("registration_date", userRs.getTimestamp("registration_date"));
            }

            // Fetch watchlist
            String watchlistQuery =
                "SELECT W.watch_later_id, M.title AS movie_title, T.title AS series_title " +
                "FROM WatchLater W " +
                "LEFT JOIN Movies M ON W.movie_id = M.movie_id " +
                "LEFT JOIN TVSeries T ON W.series_id = T.series_id " +
                "WHERE W.user_id = ?";
            PreparedStatement watchlistStmt = con.prepareStatement(watchlistQuery);
            watchlistStmt.setInt(1, userId);
            ResultSet watchlistRs = watchlistStmt.executeQuery();

            request.setAttribute("watchlist", watchlistRs);
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check which action to perform based on the request parameter
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        } else {
            int watchLaterId = Integer.parseInt(request.getParameter("watch_later_id"));
            deleteWatchLater(request, response, watchLaterId);
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id");

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Make sure to hash the password before saving

        Connection con = DBConnection.getConnection();
        try {
            String updateQuery = "UPDATE Users SET name = ?, username = ?, password = ? WHERE user_id = ?";
            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
            updateStmt.setString(1, name);
            updateStmt.setString(2, username);
            updateStmt.setString(3, password); // Make sure to hash the password
            updateStmt.setInt(4, userId);

            int rowsUpdated = updateStmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("ProfileServlet");  // Reload profile after update
            } else {
                response.sendRedirect("error.jsp");  // Handle failure scenario
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void deleteWatchLater(HttpServletRequest request, HttpServletResponse response, int watchLaterId) 
            throws IOException {
        Connection con = DBConnection.getConnection();

        try {
            String deleteQuery = "DELETE FROM WatchLater WHERE watch_later_id = ?";
            PreparedStatement deleteStmt = con.prepareStatement(deleteQuery);
            deleteStmt.setInt(1, watchLaterId);

            int rowsDeleted = deleteStmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("ProfileServlet");  // Reload profile after deletion
            } else {
                response.sendRedirect("error.jsp");  // Handle failure scenario
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
