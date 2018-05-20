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

import model.Atleta;
import model.Prova;
import persistence.*;

@WebServlet("/olimpiadas")
public class NovoDesempenho extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private ProvaDAO provaDAO;
	private AtletaDAO atletaDAO;
	
	public void init()
	{
		provaDAO = new ProvaDAO();
		atletaDAO = new AtletaDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession sessao = request.getSession();
		
		try {
			List<Prova> provas = provaDAO.selectAll();
			sessao.setAttribute("provas", provas);
			
			List<Atleta> atletas = atletaDAO.selectAll();
			sessao.setAttribute("atletas", atletas);
			
			response.sendRedirect("http://localhost:8080/AV2LabBD/Olimpiadas.jsp");
		} catch (SQLException e) {
			throw new ServletException("Itens não puderam ser obtidos do banco de dados", e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
}