package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Resultado;

public class ResultadoDAO {
	
	DBConnectionManager dbManager;
	
	public ResultadoDAO(DBConnectionManager dbManager) {
		this.dbManager = dbManager;
	}

	public List<Resultado> selectAll() throws SQLException 
	{
		List<Resultado> resultados = new ArrayList<Resultado>();
		
		try 
		(
				Connection con = dbManager.getConnection();
				PreparedStatement pstm = con.prepareStatement(""
						+ "SELECT atleta_nome, pais_nome, desempenho FROM @prova_resultados");
				ResultSet rs = pstm.executeQuery();
		) {
			while(rs.next())
			{
				Resultado r = new Resultado();
				r.setAtletaNome(rs.getString("atleta_nome"));
				r.setPaisNome(rs.getString("pais_nome"));
				r.setDesempenho(rs.getFloat("desempenho"));
				resultados.add(r);
			}
			rs.close();
			pstm.close();
		}
		return resultados;
	}

}
