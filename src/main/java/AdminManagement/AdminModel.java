package AdminManagement;

public class AdminModel {

	
	private int admin_id ;
	private String username ;
	private String email ;
	private String password ;
	private String created_at ;
	
	
	public AdminModel(int admin_id, String username, String email, String password, String created_at) {
		super();
		this.admin_id = admin_id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.created_at = created_at;
	}


	public int getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCreated_at() {
		return created_at;
	}


	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
}
