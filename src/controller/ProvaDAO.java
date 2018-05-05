package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Prova;
import persistence.GenericDAO;

public class ProvaDAO
{
	private Connection con;
	
	public ProvaDAO() throws ClassNotFoundException, SQLException
	{
		GenericDAO gDAO = new GenericDAO();
		con = gDAO.getConnection();
	}
	
	public ArrayList<Prova> selectAll() throws SQLException
	{
		ArrayList<Prova> provas = new ArrayList<Prova>();
		
		String sql = "SELECT nome, masculino FROM Prova";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			Prova p = new Prova();
			p.setNome(rs.getString("nome"));
			p.setMasculino(rs.getBoolean("masculino"));
			provas.add(p);
		}
		rs.close();
		ps.close();
		return provas;
	}
	
}