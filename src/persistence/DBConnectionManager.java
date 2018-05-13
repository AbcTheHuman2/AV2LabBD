package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionManager
{
	private Connection connection;
	
	public DBConnectionManager(String dbURL, String database, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		
		String url = dbURL + database + user + pwd;
		
		connection = DriverManager.getConnection(url);
	}
	
	public Connection getConnection()
	{
		return connection;
	}
	
	public void closeConnection()
	{
		try
		{
			if (connection != null)
			{
				connection.close();
				connection = null;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}