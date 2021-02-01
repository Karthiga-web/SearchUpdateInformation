<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Admin Portal</title>
</head>
<body>
	<h1>Do you want the details of User?</h1>
	<c:url var="addAction" value="/viewuser"></c:url>
	<form:form action="${addAction}" commandName="viewuser">
		<table>
			<tr>
				<td>Enter ID:</td>
				<td><input type="text" id="id" placeholder="ID"
					value=${ person.id} name="id" required></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button type="submit" class="btn btn-primary">View
						User</button></td>
			</tr>
		</table>
	</form:form>
	<br>
</body>
</html>