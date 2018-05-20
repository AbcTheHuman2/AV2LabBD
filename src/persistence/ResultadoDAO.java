package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Resultado;

public class ResultadoDAO
{
	DBConnectionManager dbManager;
	
	public ResultadoDAO()
	{
		try
		{
			dbManager = DBConnectionManager.getInstance();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Resultado> selectAll(String id) throws SQLException
	{
		List<Resultado> resultados = new ArrayList<Resultado>();
		Connection connection = dbManager.getConnection();
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM fn_resultadosProva(?)");
		statement.setString(1, id);
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next())
		{
			Resultado r = new Resultado();
			//r.setId(resultSet.getInt("id"));
			//r.setNome(resultSet.getString("nome"));
			//r.setSexo(resultSet.getBoolean("masculino"));
			resultados.add(r);
		}
		resultSet.close();
		statement.close();
		
		return resultados;
	}
}