package daily_write;

public class Config {
	private final String dbUrl = "jdbc:mysql://localhost:3306/daily_writer?serverTimezone=UTC";
	private final String id = "root";
	private final String password = "mn196860";
	private final String driverName = "com.mysql.cj.jdbc.Driver";
	
	public Config() {
		
	}
	
	public String getDBUrl() {
		return this.dbUrl;
	}
	
	public String getId() {
		return this.id;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getDriverName() {
		return this.driverName;
	}
}
