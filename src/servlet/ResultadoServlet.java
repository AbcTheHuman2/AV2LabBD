package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Resultado;
import persistence.DBConnectionManager;
import persistence.ResultadoDAO;

@WebServlet("/olimpiadas")
public class ResultadoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private DBConnectionManager dbManager;
	private ResultadoDAO resultadoDAO;
	
	public ResultadoServlet() {
		super();
	}
	
	@Override
	public void init()
	{
		try {
			//TODO: Move database creation and data to web.xml
			dbManager = new DBConnectionManager("jdbc:jtds:sqlserver://localhost:1433;", "databaseName=Atletismo;", "user=Gabriel;", "password=sqldbpass;");
			resultadoDAO = new ResultadoDAO(dbManager);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try {
			List<Resultado> resultados = resultadoDAO.selectAll();
			request.setAttribute("resultados", resultados);
			request.getRequestDispatcher("/olimpiadas.jsp").forward(request, response);
		} catch (SQLException e)
		{
			throw new ServletException("Itens não puderam ser obtidos do banco de dados", e);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
}
