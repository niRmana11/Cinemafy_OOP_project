package cinemafypackage;

public class AdminController {
    
    AdminModel adminModel = new AdminModel();

    public Admin getAdminInfo(int adminId) {
        return adminModel.getAdminById(adminId);
    }
}
