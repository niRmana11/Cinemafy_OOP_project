package SeriesPackage;

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

@WebServlet("/SeriesDetailsServlet")
public class SeriesDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int seriesId = Integer.parseInt(request.getParameter("series_id"));
        SeriesModel series = getSeriesDetails(seriesId);
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id");

        request.setAttribute("series_id", series);
        request.setAttribute("user_id", userId);
        request.getRequestDispatcher("tvseriesdetails.jsp").forward(request, response);
    }

    private SeriesModel getSeriesDetails(int seriesId) {
        SeriesModel series = new SeriesModel();
        try (Connection conn = DBconnection.getConnection()) {
            String sql = "SELECT * FROM Series WHERE series_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, seriesId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                series.setSeriesId(rs.getInt("series_id"));
                series.setTitle(rs.getString("title"));
                series.setReleaseDate(rs.getString("release_date"));
                series.setDescription(rs.getString("description"));
                series.setRating(rs.getDouble("rating"));
                series.setDuration(rs.getInt("duration"));
                series.setLanguage(rs.getString("language"));
                series.setPosterImageUrl(rs.getString("poster_image_url"));
                series.setTrailerUrl(rs.getString("trailer_url"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return series;
    }
}
