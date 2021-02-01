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
<title>User Details</title>
</head>
<body>
	<h4>Edit Successful!</h4>
	<c:url var="addAction" value="/userdetails"></c:url>
	<form:form action="${addAction}" commandName="userdetails">
		<fieldset>
			<legend>User Details:</legend>
			<table>
				<tr>
					<td>ID:</td>
					<td>${ person.id}</td>
				</tr>
				<tr>
					<td>Name:</td>
					<td>${ person.name}</td>
				</tr>
				<tr>
					<td>Country:</td>
					<td>${ person.country}</td>
				</tr>
			</table>
		</fieldset>
		<label for="find">Do you want to find another user?</label>
		<table>
			<tr>
				<td>&nbsp;</td>
				<td><a href="<c:url value='/viewuser' />">Find User?</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>