package RegistrationPackages;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RegController {
	
	//connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;

		//Insert Data Function
		
		public static boolean insertdata(String name, String username , String email ,String password){
			
			boolean isSuccess = false;
			
			try {
				//DB Connection call
				
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//SQL Query
				
				String sql = "insert into users (user_id,name,username,email,password) values(0, '"+name+"', '"+username+"', '"+email+"', '"+password+"')";

				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
			} catch (SQLException e) {
				
				 e.printStackTrace();
			}
			return isSuccess;
			
		}
		
		//Get by Id
		
		public static List<RegModel> getByID (String ID){
			
			int convertedID = Integer.parseInt(ID);
			
			ArrayList <RegModel> users = new ArrayList<>();
			
			try {
				
				//DBConnection
				
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				
				String sql = "select * from users where user_id '"+convertedID+"' ";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int user_id = rs.getInt(1);
					String name = rs.getString(2);
					String username = rs.getString(3);
					String email = rs.getString(4);
					String password = rs.getString(5);
					
					RegModel rk = new RegModel(user_id,name,username,email,password);
					users.add(rk);
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			return users;
		}
		
		//Get ALL Data
		
		public static List<RegModel> getAllUsers (){
			
			ArrayList <RegModel> user = new ArrayList<>();
			
try {
				
				//DBConnection
				
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				
				String sql = "select * from users ";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int user_id = rs.getInt(1);
					String name = rs.getString(2);
					String username = rs.getString(3);
					String email = rs.getString(4);
					String password = rs.getString(5);
					
					RegModel rk = new RegModel(user_id,name,username,email,password);
					user.add(rk);
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			return user;
			
		}
		
		//update data
		
		public static boolean updatedata(String user_id,String name,String username,String email,String password ) {
			
			try {
				

				//DBConnection
				
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				
				//SQL Quary
				
				String sql = "update users set name='"+name+"',username='"+username+"',email='"+email+"',password='"+password+"' "+"where user_id ='"+ user_id +"'" ;
						
				
				int rs = stmt.executeUpdate(sql);	
				

				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
			return isSuccess;
		}
		
		//Delete Data
		
		public static boolean deletedata(String user_id) {
			
			int convID = Integer.parseInt(user_id);
			
			try {
				
				//DBConnection
				
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				String sq1 = "delete from users where user_id = '"+convID+"'";
				
				int rs = stmt.executeUpdate(sq1);
				
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		
		//Login Validate
		
		public static List<RegModel> LoginValidate (String username,String password) {
			
			ArrayList<RegModel> users = new ArrayList<>();
			
			try {
				
				//DB CONNECTION
				
				con=DBconnection.getConnection();
				stmt=con.createStatement();
				
				String sql = "select * from users where "+"username= '"+username+"' and password='"+password+"'";
				 rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					
					int user_id =rs.getInt(1);
					String name =rs.getString(2);
					String user =rs.getString(3);
					String email =rs.getString(4);
					String pass =rs.getString(5);
					
					RegModel u =new RegModel(user_id,name,user,email,pass);
					
					users.add(u);
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
			return users;
		}
		

}
