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
import model.Pais;

public class AtletaDAO implements IAtletaDAO
{
	private Connection con;
	
	public AtletaDAO() throws ClassNotFoundException, SQLException
	{
		GenericDAO gDAO = new GenericDAO();
		con = gDAO.getConnection();
	}
	
	@Override
	public void insert(Atleta a) throws SQLException
	{
		String sql = "INSERT INTO Atleta (nome, masculino, pais_codigo) VALUES (?, ?, ?)";
		
		PreparedStatement ps;
		ps = con.prepareStatement(sql);
		
		ps.setString(1, a.getNome());
		ps.setBoolean(2, a.getSexo());
		ps.setString(3, a.getPais().getCodigo().toString());
		
		ps.execute();
		ps.close();
	}
	
	@Override
	public List<Atleta> searchAll(String where) throws SQLException
	{
		List<Atleta> listaAtletas = new ArrayList<Atleta>();
		
		String sql = "SELECT codigo, nome, masculino, pais_codigo FROM Atleta";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			//TODO Testar colocar fora do while
			Atleta a = new Atleta();
			a.setCod(rs.getInt("cod"));
			a.setNome(rs.getString("nome"));
			a.setSexo(rs.getBoolean("masculino"));
			
			/*p.setCodigo(codigo);
			p.setNome(nome);
			String paisSQL = "";
			
			a.setPais(rs.getString("pais_codigo"));*/
			listaAtletas.add(a);
		}
		rs.close();
		ps.close();
		return listaAtletas;
	}
}