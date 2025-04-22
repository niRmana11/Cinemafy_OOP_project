package reviewManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReviewController {

	
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		
		
		public static List<ReviewModel> getById(String id){
			
			
			ArrayList <ReviewModel> review = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from reviews where review_id '"+id+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int review_id = rs.getInt(1); //first column
					String userName = rs.getString(2);
					String movie_tvshowName = rs.getString(3);
					String review_text = rs.getString(4);
					String rating = rs.getString(5);
					String review_date = rs.getString(6);
					
					
					
					ReviewModel bk = new ReviewModel(review_id, userName, movie_tvshowName, review_text, rating, review_date);
					review.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return review;
		}
		
		
		
		
		//GetAll Data
		
		public static List<ReviewModel> getAllReview(){
			
			ArrayList <ReviewModel> review = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from reviews";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int review_id = rs.getInt(1); //first column
					String userName = rs.getString(2);
					String movie_tvshowName = rs.getString(3);
					String review_text = rs.getString(4);
					String rating = rs.getString(5);
					String review_date = rs.getString(6);
					
					
					ReviewModel bk = new ReviewModel(review_id, userName, movie_tvshowName, review_text, rating, review_date);
					review.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return review;
		}
		
		
		
		//Update Data
		
		public static boolean updatedata(String review_id  ,String userName , String movie_tvshowName , String review_text , String rating ) {
			
			try {
				
				//DB connection
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "update reviews set  userName = '"+userName+"', movie_tvshowName = '"+movie_tvshowName+"', review_text = '"+review_text+"', rating ='"+rating+"' where review_id = '"+review_id+"' ";
				
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
			
			
			
			try {
				//DB connection
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "delete from reviews where review_id = '"+id+"'" ;
				
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
