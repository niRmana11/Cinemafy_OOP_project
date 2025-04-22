
package reviewPage;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDBUtil {
	
	private static Connection con = null;
	private static PreparedStatement ps = null;
	
	
	public static boolean insertReview(String name, String movieTitle, String reviewText, int rating) {
	    boolean isSuccess = false;

	    String sql = "INSERT INTO Reviews (userName, movie_tvshowName, review_text, rating) VALUES (?, ?, ?, ?)";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        
	        ps.setString(1, name);
	        ps.setString(2, movieTitle);
	        ps.setString(3, reviewText);
	        ps.setInt(4, rating);

	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	public static boolean updateReview(String oldName, String oldMovieName, String newReviewText, int newRating) {
	    boolean isSuccess = false;

	    try {
	        con = DBConnect.getConnection();

	        // Print debug info to verify correct oldName and oldMovieName
	        System.out.println("Updating review for name = '" + oldName + "' and movieName = '" + oldMovieName + "'");

	        // Only update the review and star columns
	        String sql = "UPDATE reviews SET review_text=?, rating=? WHERE userName=? AND movie_tvshowName=?";
	        ps = con.prepareStatement(sql);

	        // Set the parameters for the PreparedStatement
	        ps.setString(1, newReviewText);  // New review text
	        ps.setInt(2, newRating);  // New rating (star)
	        ps.setString(3, oldName);  // Use old name for WHERE clause
	        ps.setString(4, oldMovieName);  // Use old movie name for WHERE clause

	        // Execute the update and check if it was successful
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isSuccess = true;  // Rows were updated
	        } else {
	            System.out.println("No matching record found for update.");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Always close resources
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isSuccess;
	}

	
	public static boolean DeleteReview(String name, String movieTitle, String reviewText, String rating) {
	    boolean isSuccess = false;

	    try {
	        // Establish database connection
	    	con = DBConnect.getConnection();
	        
	        // SQL query to delete the review based on customer_name, game_title, content, and rating
	        String sql = "DELETE FROM reviews WHERE userName=? AND movie_tvshowName=? AND review_text=? AND rating=?";
	        ps = con.prepareStatement(sql);

	        // Set parameters for the query
	        ps.setString(1, name);
	        ps.setString(2, movieTitle);
	        ps.setString(3, reviewText);
	        ps.setString(4, rating);

	        // Execute delete query and check if it was successful
	        int rs = ps.executeUpdate();
	        if (rs > 0) {
	            isSuccess = true;  // Deletion was successful
	        }

	        // Close the connection when done
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	  

	    return isSuccess;
	}
	
	
	public static List<Review> getReviewsByMovieTitle(String movieTitle) {
        List<Review> reviews = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT userName, movie_tvshowName, review_text, rating FROM reviews WHERE movie_tvshowName = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, movieTitle);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("userName");
                String reviewText = rs.getString("review_text");
                int rating = rs.getInt("rating");
                Review review = new Review(name, movieTitle, reviewText, rating);
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return reviews;
    }
}




