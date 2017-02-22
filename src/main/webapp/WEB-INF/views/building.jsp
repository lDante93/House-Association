<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>



	<div class="thumbnail">

		<div class="caption">


			<br>


			<form:form method="post" action="addBuilding.html"
				commandName="building">

				<table>
					<tr>
						<td><form:label path="number">Numer budynku</form:label></td>
						<td><form:input path="number" /></td>
					</tr>
					<tr>
						<td><form:label path="street">Ulica</form:label></td>
						<td><form:input path="street" /></td>
					</tr>
					<tr>
						<td height="1"><form:hidden path="id" />
					</tr>

					<tr>
						<td colspan="2"><c:if test="${building.id==0}">
								<input type="submit" value="Dodaj Budynek"
									class="btn btn-success" />
							</c:if> <c:if test="${building.id!=0}">
								<input type="submit" value="Edytuj" class="btn btn-success" />
							</c:if></td>
					</tr>
				</table>

			</form:form>


			<c:if test="${!empty buildingList}">
				<table class="data">
					<tr>
						<br>

						<h2>Lista budynków</h2>
						<hr>
						<th><h3>
								<b>Numer Budynku</b>
							</h3></th>
						<th><h3>
								<b>Ulica</b>
							</h3></th>

						<th>&nbsp;</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${buildingList}" var="building">
						<tr>
							<td><h4>${building.number}</h4></td>
							<td><h4>${building.street}</h4></td>
							<td><a href="delete/building/${building.id}.html"
								class="btn btn-danger">Usuń</a></td>
							<td><a href="building.html?buildingId=${building.id}"
								class="btn btn-warning">Edytuj</a></td>

						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>