<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<c:url value="/resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet">

</head>
<body>





	<div class="thumbnail">

		<div class="caption">
			<h2>Wprowadź nowe hasło</h2>

			<form:form method="post" action="userEditPassword.html"
				commandName="user">
				<table>
					<br>
					<tr>
						<td><form:label path="password">
								<font size="3"></font>&nbsp;Hasło</form:label></td>
						<td><form:input path="password" /></td>

					</tr>
					<tr>
						<td><form:hidden path="login" /></td>

					</tr>
					<tr>
						<td><form:hidden path="firstname" /></td>

					</tr>
					<tr>
						<td><form:hidden path="lastname" /></td>

					</tr>
					<tr>
						<td><form:hidden path="email" /></td>

					</tr>
					<tr>
						<td><form:hidden path="telephone" /></td>

					</tr>
					<tr>
						<td><form:hidden path="amountOfLocators" /></td>

					</tr>
					<tr>
						<td><form:hidden path="enabled" /></td>
					</tr>



					<tr>
						<td><form:hidden path="id" /></td>
					</tr>
					

					
					<tr>
						<td><input type="submit" value="Akceptuj"
							class="btn btn-success" /></td>
					</tr>
				</table>
			</form:form>

		</div>
	</div>








</body>
</html>