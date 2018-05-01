<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*, java.text.SimpleDateFormat, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>Cadastro de Atleta</title>
		<link rel="stylesheet" href="./resources/bootstrap.min.css"/>
		<script src="./resources/jquery-3.2.1.slim.min.js"></script>
		<script src="./resources/popper.min.js" ></script>
		<script src="./resources/bootstrap.min.js"></script>
	</head>
	<body>
		<%
			String msg = (String)session.getAttribute("MESSAGE");
			Atleta atletaAtual = (Atleta)session.getAttribute("ATLETA_ATUAL");
			List<Atleta> lista = (List<Atleta>)session.getAttribute("LISTA");
			List paises = (List)session.getAttribute("PAISES");
			session.setAttribute("LISTA", null);
			session.setAttribute("ATLETA_ATUAL", null);
			if (atletaAtual == null) {
				atletaAtual = new Atleta();
			}
		%>
		<h1>Cadastrar Atleta</h1>
		<hr/>
		<%if (msg != null) { %>
			<div class="alert alert-danger" role="alert">
  				<%=msg%>
			</div>
		<% 	session.setAttribute("MESSAGE", null);
			} %>
		<hr/>
		<p>Nome: <input style="width: 283px; "/></p>
		<p>Sexo: <select style="width: 109px; ">
		<option value="masc">Masculino</option>
		<option value="femi">Feminino</option>
		</select></p>
		<p>País: <select style="width: 150px; ">
		
		</select></p>
		<form>
			<input type="submit" value="Cadastrar Atleta"/><input type="submit"
			value="Lista de Atletas"/>
	</form>
	</body>
</html>