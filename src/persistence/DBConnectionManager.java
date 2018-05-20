package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionManager
{
	private static DBConnectionManager instance;
	private Connection connection;
	//TODO: Is it possible to improve this?
	String dbURL = "jdbc:jtds:sqlserver://localhost:1433;";
	String database = "databaseName=Olimpiadas;";
	String user = "user=Gabriel;";
	String pwd = "password=sqldbpass;";
	
	private DBConnectionManager() throws SQLException
	{
		try
		{
			Class.forName("net.sourceforge.jtds.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL + database + user + pwd);
		} catch (ClassNotFoundException e)
		{
			System.out.println("Database connection creation failed: ");
		}
	}
	
	public Connection getConnection()
	{
		return connection;
	}
	
	public static DBConnectionManager getInstance() throws SQLException
	{
		if (instance == null || instance.getConnection().isClosed())
			instance = new DBConnectionManager();
		
		return instance;
	}
}