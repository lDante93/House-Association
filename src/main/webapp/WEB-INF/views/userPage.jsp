<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<c:url value="/resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet">


</head>
<body>




	<div class="thumbnail">

		<div class="caption"></div>

		<h2>Dane użytkownika</h2>
		

		<table class="data">
			<tr>

		
				<td><font size="3"><i class="fa fa-user-circle"
							aria-hidden="true">	</i></font>&nbsp;<b>Imię</b></td>
				<td height="40"><h4>${userData.firstname}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-user-circle-o"
							aria-hidden="true">	</i></font>&nbsp;<b>Nazwisko</b></td>
				<td><h4>${userData.lastname}</h4></td>

			</tr>
			<tr>

					<td><font size="3"><i class="fa fa-envelope"
							aria-hidden="true">	</i></font>&nbsp;<b>E-mail</b></td>
				<td><h4>${userData.email}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-phone"
							aria-hidden="true">	</i></font>&nbsp;<b>Numer telefonu</b></td>
				<td><h4>${userData.telephone}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-users"
							aria-hidden="true">	</i></font>&nbsp;<b>Liczba Lokatorów</b></td>
				<td><h4>${userData.amountOfLocators}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-road"
							aria-hidden="true">	</i></font>&nbsp;<b>Ulica</b></td>
				<td><h4>${userData.apartment.building.street}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-home"
							aria-hidden="true">	</i></font>&nbsp;<b>Numer Budynku</b></td>
				<td><h4>${userData.apartment.building.number}</h4></td>

			</tr>

			<tr>

				<td><font size="3"><i class="fa fa-bed"
							aria-hidden="true">	</i></font>&nbsp;<b>Numer Mieszkania</b></td>
				<td><h4>${userData.apartment.number}</h4></td>

			</tr>
			<tr>

				<td><font size="3"><i class="fa fa-check-square-o"
							aria-hidden="true">	</i></font>&nbsp;<b>Konto aktywowane?</b></td>
				<td><c:if test="${userData.enabled=='false'}">

						<h4>Nie</h4>
					</c:if> <c:if test="${userData.enabled=='true'}">

						<h4>Tak</h4>
					</c:if></td>

			</tr>
			<th>&nbsp;</th>
			<th>&nbsp;</th>




			<hr>



		</table>



	</div>

</body>
</html>