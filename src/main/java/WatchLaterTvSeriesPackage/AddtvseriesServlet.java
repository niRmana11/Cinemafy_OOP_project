package WatchLaterTvSeriesPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddtvseriesServlet")
public class AddtvseriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int seriesId = Integer.parseInt(request.getParameter("series_Id"));
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO watchlater (user_id, series_Id) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, seriesId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ProfileServlet");
    }
}