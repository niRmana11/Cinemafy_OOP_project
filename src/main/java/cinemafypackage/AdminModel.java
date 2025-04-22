package cinemafypackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminModel {
    
    public Admin getAdminById(int adminId) {
        Admin admin = null;
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM Admins WHERE admin_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, adminId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setCreatedAt(rs.getTimestamp("created_at"));
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}
