package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Atleta;

public interface IAtletaDAO
{
	public void insert(Atleta a) throws SQLException;
	public List<Atleta> searchAll(String where) throws SQLException;
}