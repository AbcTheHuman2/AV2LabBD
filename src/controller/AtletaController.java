package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Atleta;
import persistence.IAtletaDAO;
import persistence.AtletaDAO;

public class AtletaController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	public AtletaController()
	{
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("<html><body>Você deve acessar a página "
				+ "<a href=\"./atleta.jsp\">atleta.jsp</a></body></html>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String txtNome = request.getParameter("txtNome");
		String txtSexo = request.getParameter("txtSexo");
		String txtCmd = request.getParameter("cmd");
		System.out.println("O botão "+ txtCmd +" foi pressionado.");
		
		try {
			IAtletaDAO aDAO = new AtletaDAO();
			List<Atleta> lista = (List<Atleta>)getServletContext().getAttribute("LISTA");
			if (lista == null)
			{
				lista = new ArrayList<>();
				getServletContext().setAttribute("LISTA", lista);
			}
			String message = null;
			if ("adicionar".equals(txtCmd))
			{
				Atleta a = new Atleta();
				a.setNome(txtNome);
				aDAO.insert(a);
				message = String.format("Foi cadastrado o atleta %s\n", a.toString());
			}
			
			request.getSession().setAttribute("MESSAGE", message);
			
			System.out.print( message );
			System.out.printf("Existem %d elementos na lista\n", lista.size());
			response.sendRedirect("./atleta.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}