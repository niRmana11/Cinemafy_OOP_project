package AdminManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminController {
	
	
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert Data Function
		
		public static boolean insertdata (String username , String email , String password  ) {
			
			boolean isSuccess = false;
			try {
				
				//DB Connect call
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "insert into admins (admin_id ,username ,email ,password) values (0 , '"+username+"' , '"+email+"' ,'"+password+"'   )";
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
		
		
		
		public static List<AdminModel> getById(String Id){
			int convertedID = Integer.parseInt(Id);
			
			ArrayList <AdminModel> admin = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from book where admin_id '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int admin_id = rs.getInt(1); //first column
					String username = rs.getString(2);
					String email = rs.getString(3);
					String password = rs.getString(4);
					String created_at = rs.getString(5);
					
					
					
					AdminModel bk = new AdminModel(admin_id, username, email, password, created_at);
					admin.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return admin;
		}
		
		
		//GetAll Data
		
		public static List<AdminModel> getAllAdmin(){
			
			ArrayList <AdminModel> admin = new ArrayList<> ();
			
			try {
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//query
				
				String sql = "select * from admins";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int admin_id = rs.getInt(1); //first column
					String username = rs.getString(2);
					String email = rs.getString(3);
					String password = rs.getString(4);
					String created_at = rs.getString(5);
					
					
					
					AdminModel bk = new AdminModel(admin_id, username, email, password, created_at);
					admin.add(bk);  //so those values will be saved with the constructor huh
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return admin;
			
		}
		
		//Update Data
		
		public static boolean updatedata(String admin_id , String username , String email , String password , String created_at) {
			
			try {
				
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "update admins set username = '"+username+"' ,email = '"+email+"',password = '"+password+"'"
						+ "where admin_id = '"+admin_id+"' ";
				
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
				
				String sql = "delete from admins where admin_id = '"+conID+"'" ;
				
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
		
		//login validate
		
		public static List<AdminModel> loginValidate (String email , String password){
			
			ArrayList<AdminModel> admin = new ArrayList<>();
			
			
			try {
				
				//DB connection
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//SQL query
				
				String sql = "select * from admins where email='"+email+"' and password='"+password+"'";
				
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					
					int admin_id = rs.getInt(1);
					String  username = rs.getString(2);
					String emails = rs.getString(3);
					String passwords = rs.getString(4);
					String created_at = rs.getString(5);
					
					AdminModel u = new AdminModel(admin_id, username, emails, passwords, created_at);
					
					admin.add(u);
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			return admin;
		}
		
		
		// Verify Admin Login Function
		public static int verifyAdminLogin(String email, String password) {
		    int admin_id = -1;  // Initialize to -1 to indicate failed login
		    try {
		        // DB connection
		        con = DBConnection.getConnection();
		        stmt = con.createStatement();

		        // SQL query to check for matching username and password
		        String sql = "SELECT admin_id FROM admins WHERE email = '" + email + "' AND password = '" + password + "'";
		        rs = stmt.executeQuery(sql);

		        if (rs.next()) {
		            admin_id = rs.getInt("admin_id");  // Fetch the admin_id
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return admin_id;  // Return the admin_id if found, otherwise -1
		}

		
		
		

}
