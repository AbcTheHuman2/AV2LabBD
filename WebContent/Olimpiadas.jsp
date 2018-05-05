<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Olimpiadas</title>
</head>
<body>
	<td align="right">Prova</td>
        <td>
            <select name="provaSelecionada"> 
            <c:forEach items="${prova}" var="provas"> 
            <option value="${prova.getNome}">${prova.getMasculino}></option> 
            </c:forEach> 
       </select>
	</td>
</body>
</html>