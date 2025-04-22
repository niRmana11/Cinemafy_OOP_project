package MovieDetailsPackage;



import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/MovieDetailsServlet")
public class MovieDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        Movie movie = getMovieDetails(movieId);
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        request.setAttribute("movie", movie);
        request.setAttribute("userId", userId);
        request.getRequestDispatcher("movieDetails.jsp").forward(request, response);
    }

    private Movie getMovieDetails(int movieId) {
        Movie movie = new Movie();
        try (Connection conn = DBconnection.getConnection()) {
            String sql = "SELECT * FROM Movies WHERE movie_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setReleaseDate(rs.getString("release_date"));
                movie.setDescription(rs.getString("description"));
                movie.setRating(rs.getDouble("rating"));
                movie.setDuration(rs.getInt("duration"));
                movie.setLanguage(rs.getString("language"));
                movie.setPosterImageUrl(rs.getString("poster_image_url"));
                movie.setTrailerUrl(rs.getString("trailer_url"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
}
