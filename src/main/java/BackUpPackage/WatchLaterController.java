package BackUpPackage;

import java.sql.*;

public class WatchLaterController {
	private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    // Add to WatchLater
    public static boolean insertdata(String userId, String movieId) {
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            
            
            String sql = "insert into watchlater(user_id,movie_id)values( '"+userId+ "','"+movieId + "')";
            
            int rs = stmt.executeUpdate(sql);
         
            if(rs> 0) {
            	isSuccess= true;
            }
            else {
            	isSuccess = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
        return isSuccess;
    }
}
    
  