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
	<c:url var="addAction" value="/userdetails"></c:url>
	<form:form action="${addAction}" commandName="userdetails">
		<c:if test="${!empty person.name}">
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
			<label for="find">Do you want to edit the user?</label>
		</c:if>
		<table>
			<c:if test="${empty person.name}">
				<label for="error">${message} Do you want to find another
					user?</label>
			</c:if>
			<c:if test="${empty person.name}">
				<tr>
					<td><a href="<c:url value='/viewuser' />">Find User</a></td>
				</tr>
			</c:if>
			<c:if test="${!empty person.name}">
				<tr>
					<td>ID:</td>
					<td><input type="text" id="id" placeholder="ID" name="id"
						readonly="true" min="0" max="2147483647" value=${ person.id}></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" id="name" placeholder="name"
						maxlength="100" name="name" value=${ person.name}></td>
				</tr>
				<tr>
					<td>Country:</td>
					<td><input type="text" id="country" placeholder="country"
						maxlength="100" name="country" value=${ person.country}></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><c:if test="${!empty person.name}">
						<input type="submit" value="<spring:message text="Edit Person"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
</body>
</html>