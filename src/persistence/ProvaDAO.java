package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Prova;

public class ProvaDAO
{
	DBConnectionManager dbManager;
	
	public ProvaDAO()
	{
		try
		{
			dbManager = DBConnectionManager.getInstance();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Prova> selectAll() throws SQLException
	{
		List<Prova> provas = new ArrayList<Prova>();
		Connection connection = dbManager.getConnection();
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM Prova");
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next())
		{
			Prova p = new Prova();
			p.setId(resultSet.getInt("id"));
			p.setNome(resultSet.getString("nome"));
			p.setSexo(resultSet.getBoolean("sexo"));
			provas.add(p);
		}
		resultSet.close();
		statement.close();
		return provas;
	}
}