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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>

	<div class="thumbnail">

		<div class="caption">
			<form:form method="post" action="addUser.html" commandName="user">
				<table>
					<br>
					<tr>
						<td><form:label path="login">Login</form:label></td>
						<td><form:input path="login" /></td>
						<c:if test="${!empty apartment}">
							<td><form:errors path="login" /></td>
						</c:if>
					</tr>
					<tr>
						<td><form:label path="password">Hasło</form:label></td>
						<td><form:input path="password" /></td>
						<td><form:errors path="password" /></td>
					</tr>
					<tr>
						<td><form:label path="firstname">Imię</form:label></td>
						<td><form:input path="firstname" /></td>
						<td><form:errors path="firstname" /></td>
					</tr>
					<tr>
						<td><form:label path="lastname">Nazwisko</form:label></td>
						<td><form:input path="lastname" /></td>
						<td><form:errors path="lastname" /></td>
					</tr>
					<tr>
						<td><form:label path="email">E-mail</form:label></td>
						<td><form:input path="email" /></td>
						<td><form:errors path="email" /></td>
					</tr>
					<tr>
						<td><form:label path="telephone">Telefon</form:label></td>
						<td><form:input path="telephone" /></td>
						<td><form:errors path="telephone" /></td>
					</tr>
					<tr>
						<td><form:label path="amountOfLocators">Liczba Lokatorów</form:label></td>
						<td><form:input path="amountOfLocators" /></td>
						<td><form:errors path="amountOfLocators" /></td>
					</tr>
					<tr>
						<td><form:label path="enabled">Czy jest aktywny?</form:label></td>
						<td><form:checkbox path="enabled" checked="checked" /></td>
						<td><form:errors path="enabled" /></td>
					</tr>

					<tr>
						<td><form:label path="building">Budynek</form:label></td>
						<td><form:select path="building" onchange="submit()">

								<c:forEach items="${buildingList}" var="building">



									<option value="${building.id}"
										${building.id == selectedBuilding ? 'selected="selected"' : ''}>${building.number}</option>
								</c:forEach>
							</form:select></td>
						<td><form:errors path="building" /></td>
					</tr>
					<tr>
						<td><form:label path="apartment">Mieszkanie</form:label></td>
						<td><form:select path="apartment">

								<c:forEach items="${apartmentList}" var="apartment">
									<option value="${apartment.id}"
										${apartment.id == selectedApartment ? 'selected="selected"' : ''}>${apartment.number}</option>
								</c:forEach>
							</form:select></td>
						<td><form:errors path="apartment" /></td>
					</tr>


					<tr>
						<td height="1"><form:hidden path="id" />
					</tr>
					<%--  <tr>
        <td><form:hidden path="apartment.id"/>
    </tr>
     <tr>
        <td><form:hidden path="building.id"/>
    </tr> --%>

					<tr>
						<td colspan="2"><c:if test="${user.id==0}">
								<input type="submit" class="btn btn-success"
									value="Dodaj Użytkownika" />
							</c:if> <c:if test="${user.id!=0}">
								<input type="submit" value="Edytuj" class="btn btn-success" />
							</c:if></td>
					</tr>
				</table>
			</form:form>


			<br> <br>
			<h2>Lista użytkowników</h2>
			<c:if test="${!empty userList}">
				<table class="data">
					<tr>
						<th><h5>
								<b>Imię</b>
							</h5></th>
						<th><h5>
								<b>Nazwisko</b>
							</h5></th>
						<th><h5>
								<b>E-mail</b>
							</h5></th>
						<th><h5>
								<b>Numer telefonu</b>
							</h5></th>
						<th><h5>
								<b>Liczba domowników</b>
							</h5></th>
						<th><h5>
								<b>Ulica</b>
							</h5></th>
						<th><h5>
								<b>Numer Mieszkania</b>
							</h5></th>
						<th><h5>
								<b>Numer Budynku</b>
							</h5></th>
						<th><h5>
								<b>Aktywny?</b>
							</h5></th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>

					</tr>
					<hr>
					<c:forEach items="${userList}" var="user" varStatus="status">

						<c:if test="${status.first}"></c:if>
						<c:if test="${!status.first}"><tr>
						
						
							<td><h5>${user.firstname}</h5></td>
							<td><h5>${user.lastname}</h5></td>
							<td><h5>${user.email}</h5></td>
							<td><h5>${user.telephone}</h5></td>
							<td width="120"><h5>${user.amountOfLocators}</h5></td>
							<td width="100"><h5>${user.apartment.building.street}</h5></td>
							<td width="120"><h5>${user.apartment.number}</h5></td>
							<td width="100"><h5>${user.apartment.building.number}</h5></td>

							<td><c:if test="${user.enabled=='false'}">

									<h5>Nie</h5>
								</c:if> <c:if test="${user.enabled=='true'}">

									<h5>Tak</h5>
								</c:if></td>
							<td><div class="col-lg-offset-2 col-lg-10">
									<a href="delete/user/${user.id}.html" class="btn btn-danger">Usuń</a>
								</div></td>
							<td><a href="editUserPassword.html?userId=${user.id}"
								class="btn btn-warning">Edytuj</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>