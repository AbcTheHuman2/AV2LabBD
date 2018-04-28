package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Atleta;

public class AtletaDAOImpl implements AtletaDAO {

	private Connection getConnection() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/Atletismo");
			return ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void adicionar(Atleta a) {
		Connection con = getConnection();
	}

	@Override
	public List<Atleta> pesquisarTodos() {
		return pesquisarPorQuery("");
	}

	private List<Atleta> pesquisarPorQuery(String where) {
		List<Atleta> lista = new ArrayList<>();
		Connection con = getConnection();
		try {
			PreparedStatement pstm = con.prepareStatement(
					"SELECT * FROM Atleta " + where);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				Atleta a = new Atleta();
				a.setCod(rs.getInt("cod"));
				a.setNome(rs.getString("nome"));
				a.setSexo(rs.getBoolean("sexo"));
				lista.add(a);
			}
			con.close();
		} catch (SQLException e) {
				e.printStackTrace();
			} 
		return lista;
	}

}