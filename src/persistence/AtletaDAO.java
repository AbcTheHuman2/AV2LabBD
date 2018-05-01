package persistence;

import java.util.List;

import model.Atleta;

public interface AtletaDAO {
	
	void adicionar(Atleta a);
	List<Atleta> pesquisarTodos();
}