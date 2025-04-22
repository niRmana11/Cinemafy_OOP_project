package MovieManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieController {

	
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert Data Function
		
		public static boolean insertdata ( String title , String release_date , String description , String rating , String duration, String language, String poster_image_url, String trailer_url) {
			
			
			try {
				
				//DB Connect call
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "insert into movies values (0 , '"+title+"' , '"+release_date+"' ,'"+description+"' ,'"+rating+"' ,'"+duration+"' ,'"+language+"','"+poster_image_url+"','"+trailer_url+"' )";
				int rs = stmt.executeUpdate(sql);
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		
		
		
		public static List<MovieModel> getById(String Id){
			int convertedID = Integer.parseInt(Id);
			
			ArrayList <MovieModel> movie = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from movies where id '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int movie_id = rs.getInt(1); //first column
					String title = rs.getString(2);
					String release_date = rs.getString(3);
					String description = rs.getString(4);
					String rating = rs.getString(5);
					String duration = rs.getString(6);
					String language = rs.getString(7);
					String poster_image_url = rs.getString(8);
					String trailer_url = rs.getString(9);
					
					
					MovieModel bk = new MovieModel(movie_id, title, release_date, description, rating, duration, language, poster_image_url, trailer_url);
					movie.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return movie;
		}
		
		
		
		
		//GetAll Data
		
		public static List<MovieModel> getAllMovie(){
			
			ArrayList <MovieModel> movie = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from movies";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int movie_id = rs.getInt(1); //first column
					String title = rs.getString(2);
					String release_date = rs.getString(3);
					String description = rs.getString(4);
					String rating = rs.getString(5);
					String duration = rs.getString(6);
					String language = rs.getString(7);
					String poster_image_url = rs.getString(8);
					String trailer_url = rs.getString(9);
					
					
					MovieModel bk = new MovieModel(movie_id, title, release_date, description, rating, duration, language, poster_image_url, trailer_url);
					movie.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return movie;
		}
		
		
		
		//Update Data
		
		public static boolean updatedata(String movie_id  ,String title , String release_date , String description , String rating , String duration, String language, String poster_image_url, String trailer_url) {
			
			try {
				
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "update movies set title = '"+title+"' ,release_date = '"+release_date+"',description = '"+description+"',rating = '"+rating+"',duration ='"+duration+"' ,language ='"+language+"',poster_image_url ='"+poster_image_url+"',trailer_url ='"+trailer_url+"'"
						+ "where movie_id = '"+movie_id+"' ";
				
				int rs = stmt.executeUpdate(sql);
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		
		//Delete data
		
		public static boolean deletedata(String id) {
			
			int conID = Integer.parseInt(id);
			
			try {
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "delete from movies where movie_id = '"+conID+"'" ;
				
				int rs = stmt.executeUpdate(sql);
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		
		
		
}
