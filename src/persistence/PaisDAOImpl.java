package persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Pais;

public class PaisDAOImpl implements PaisDAO {
	
	private Connection c;
	
	public PaisDAOImpl() {
		
		GenericDAO gDAO = new GenericDAO();
		
		try {
			c = gDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Pais> prepararDropdown() throws SQLException {
		
		List<Pais> paises = new ArrayList<Pais>();	
		Statement stmt = c.createStatement();
		ResultSet rs = stmt.executeQuery("");
		while (rs.next()) {
			Pais p = new Pais();
			p.setNome(rs.getString(2));
			paises.add(p);
		}
		return paises;
	}

}
