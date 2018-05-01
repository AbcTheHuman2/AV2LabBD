package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GenericDAO {

private Connection c;

public Connection getConnection() throws ClassNotFoundException, SQLException {
	
	Class.forName("net.sourceforge.jtds.jdbc.Driver");
	
	c = DriverManager.getConnection(
			"jdbc:jtds:sqlserver://127.0.0.1:1433;DatabaseName=Atletismo;",
			"trabalho", "123");
	
	return c;
}

public void fechaConexao() {
	try {
		if (c != null)
			c.close();
		c = null;
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
}
