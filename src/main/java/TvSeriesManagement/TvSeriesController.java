package TvSeriesManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import MovieManagement.DBConnection;

public class TvSeriesController {
	
	
	//Connect DB
			private static boolean isSuccess;
			private static Connection con = null;
			private static Statement stmt = null;
			private static ResultSet rs = null;
			
			//Insert Data Function
			
			public static boolean insertdata ( String title , String release_date , String description , String rating , String total_seasons, String poster_image_url, String trailer_url) {
				
				
				try {
					
					//DB Connect call
					con=DBConnection.getConnection();
					stmt=con.createStatement();
					
					//SQL query
					
					String sql = "insert into tvseries values (0 , '"+title+"' , '"+release_date+"' ,'"+description+"' ,'"+rating+"' ,'"+total_seasons+"' ,'"+poster_image_url+"','"+trailer_url+"' )";
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
			
			
			
			public static List<TvSeriesModel> getById(String Id){
				int convertedID = Integer.parseInt(Id);
				
				ArrayList <TvSeriesModel> tvseries = new ArrayList<> ();
				
				try {
					//DB connection
					con=DBConnection.getConnection();
					stmt=con.createStatement();
					
					//query
					
					String sql = "select * from tvseries where id '"+convertedID+"'";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int series_id = rs.getInt(1); //first column
						String title = rs.getString(2);
						String release_date = rs.getString(3);
						String description = rs.getString(4);
						String rating = rs.getString(5);
						String total_seasons = rs.getString(6);
						String poster_image_url = rs.getString(7);
						String trailer_url = rs.getString(8);
						
						
						
						TvSeriesModel bk = new TvSeriesModel(series_id, title, release_date, description, rating, total_seasons, poster_image_url, trailer_url);
						tvseries.add(bk);  //so those values will be saved with the constructor huh
						
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				return tvseries;
			}
			
			
			
			
			
			//GetAll Data
			
			public static List<TvSeriesModel> getAllTvSeries(){
				
				ArrayList <TvSeriesModel> tvseries = new ArrayList<> ();
				
				try {
					//DB connection
					con=DBConnection.getConnection();
					stmt=con.createStatement();
					
					//query
					
					String sql = "select * from tvseries";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int series_id = rs.getInt(1); //first column
						String title = rs.getString(2);
						String release_date = rs.getString(3);
						String description = rs.getString(4);
						String rating = rs.getString(5);
						String total_seasons = rs.getString(6);
						String poster_image_url = rs.getString(7);
						String trailer_url = rs.getString(8);
						
						
						
						TvSeriesModel bk = new TvSeriesModel(series_id, title, release_date, description, rating, total_seasons, poster_image_url, trailer_url);
						tvseries.add(bk);  //so those values will be saved with the constructor huh
						
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				return tvseries;
			}
			
			
						
			
			//Update Data
			
			public static boolean updatedata(String series_id  ,String title , String release_date , String description , String rating , String total_seasons, String poster_image_url, String trailer_url) {
				
				try {
					
					//DB connection
					con=DBConnection.getConnection();
					stmt=con.createStatement();
					
					//SQL query
					
					String sql = "update tvseries set title = '"+title+"' ,release_date = '"+release_date+"',description = '"+description+"',rating = '"+rating+"',total_seasons ='"+total_seasons+"' ,poster_image_url ='"+poster_image_url+"',trailer_url ='"+trailer_url+"'"
							+ "where series_id = '"+series_id+"' ";
					
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
					
					String sql = "delete from tvseries where series_id = '"+conID+"'" ;
					
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
