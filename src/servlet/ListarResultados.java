package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Resultado;
import model.Prova;
import persistence.*;

@WebServlet("/resultados")
public class ListarResultados extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private ProvaDAO provaDAO;
	private ResultadoDAO resultadoDAO;
	
	public void init()
	{
		provaDAO = new ProvaDAO();
		resultadoDAO = new ResultadoDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession sessao = request.getSession();
		
		try {
			List<Prova> provas = provaDAO.selectAll();
			sessao.setAttribute("provas", provas);
			
			response.sendRedirect("http://localhost:8080/AV2LabBD/Resultados.jsp");
		} catch (SQLException e) {
			throw new ServletException("Itens não puderam ser obtidos do banco de dados", e);
		}
	}
	
	//TODO: Os resultados são mostrados ao selecionar a prova
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession sessao = request.getSession();
		
		try {
			List<Resultado> resultados = resultadoDAO.selectAll((String) sessao.getAttribute("provaSelecionada"));
			sessao.setAttribute("resultados", resultados);
			
			response.sendRedirect("http://localhost:8080/AV2LabBD/Resultados.jsp");
		} catch (SQLException e) {
			throw new ServletException("Itens não puderam ser obtidos do banco de dados", e);
		}
	}
}