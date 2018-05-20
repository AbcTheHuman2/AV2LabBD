package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Atleta;

public class AtletaDAO
{
	DBConnectionManager dbManager;
	
	public AtletaDAO()
	{
		try
		{
			dbManager = DBConnectionManager.getInstance();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Atleta> selectAll() throws SQLException
	{
		List<Atleta> atletas = new ArrayList<Atleta>();
		Connection connection = dbManager.getConnection();
		
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM Atleta");
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next())
		{
			Atleta a = new Atleta();
			a.setCodigo(resultSet.getInt("codigo"));
			a.setNome(resultSet.getString("nome"));
			a.setSexo(resultSet.getBoolean("sexo"));
			//a.setPais(paisOrigem); //TODO: Arrumar na query, com innerjoin??
			atletas.add(a);
		}
		resultSet.close();
		statement.close();
		return atletas;
	}
}