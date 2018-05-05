package persistence;

import model.Pais;

import java.sql.SQLException;
import java.util.List;

public interface IPaisDAO {
	
	List<Pais> prepararDropdown() throws SQLException;
}