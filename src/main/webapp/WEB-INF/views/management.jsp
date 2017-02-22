<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>




	<div class="thumbnail">

		<div class="caption">



			<table class="data">
				<tr>
					<h2>Lista mieszkań i budynków</h2>

					<th><h3>
							<b>Numer Mieszkania</b>
						</h3></th>
					<th><h3>
							<b>Numer Budynku</b>
						</h3></th>
					<th><h3>
							<b>Adres Budynku</b>
						</h3></th>

					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach items="${apartmentList}" var="apartment">
					<tr>
						<td><h4>${apartment.number}</h4></td>
						<td><h4>${apartment.building.number}</h4></td>
						<td><h4>${apartment.building.street}</h4></td>

						<td><a href="apartment.html?apartmentId=${apartment.id}"
							class="btn btn-warning">Edytuj</a></td>
					</tr>


				</c:forEach>
			</table>
			<br> <br>
			<table class="data">
				<tr>
					<h2>Lista Użytkowników</h2>
					<hr>
					<th><h3>
							<b>Imię</b>
						</h3></th>
					<th><h3>
							<b>Nazwisko</b>
						</h3></th>
					<th><h3>
							<b>Login</b>
						</h3></th>
					<th><h3>
							<b>Email</b>
						</h3></th>

					<th><h3>
							<b>Numer telefonu</b>
						</h3></th>
					<th><h3>
							<b>Numer Budynku</b>
						</h3></th>
					<th><h3>
							<b>Numer Mieszkania</b>
						</h3></th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach items="${userList}" var="user" varStatus="status">

						<c:if test="${status.first}"></c:if>
						<c:if test="${!status.first}"><tr>
					<tr>
						<td><h4>${user.firstname}</h4></td>
						<td><h4>${user.lastname}</h4></td>
						<td><h4>${user.login}</h4></td>
						<td><h4>${user.email}</h4></td>
						<td><h4>${user.telephone}</h4></td>
						<td><h4>${user.apartment.building.number}</h4></td>
						<td><h4>${user.apartment.number}</h4></td>

						<td><a href="user.html?userId=${user.id}"
							class="btn btn-warning">Edytuj</a></td>


</tr>
</c:if>

					
				</c:forEach>
			</table>
		</div>
	</div>






</body>
</html>