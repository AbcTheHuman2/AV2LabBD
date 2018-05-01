package persistence;

import model.Pais;

import java.sql.SQLException;
import java.util.List;

public interface PaisDAO {
	
	List<Pais> prepararDropdown() throws SQLException;
}