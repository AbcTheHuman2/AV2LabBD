<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultados das Provas</title>
</head>
<body>
	<h1>Selecione a prova</h1>
	
	<select name="provaSelecionada"> 
		<c:forEach items="${provas}" var="prova"> 
			<option value="${prova.getId()}">${prova.getNome()}</option> 
		</c:forEach>
	</select>
	
	<table border="1">
	<c:forEach items="${resultados}" var="resultado">
	    <tr>
	        <td>${resultado.getNome()}</td>
	    </tr>
	</c:forEach>
	</table>
	
</body>
</html>