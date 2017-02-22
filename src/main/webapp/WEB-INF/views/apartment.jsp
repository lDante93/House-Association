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


			<br>


			<form:form method="post" action="addApartment.html"
				commandName="apartment">

				<table>
					<tr>
						<td><form:label path="number">Numer Mieszkania</form:label></td>
						<td><form:input path="number" /></td>

						<td><form:label path="building">Budynek</form:label></td>
						<td><form:select path="building">

								<c:forEach items="${buildingList}" var="building">
									<option value="${building.id}"
										${building.id == selectedBuilding ? 'selected="selected"' : ''}>${building.number}</option>
								</c:forEach>
							</form:select></td>
						<td><form:errors path="building" /></td>
					</tr>

					<tr>
						<td colspan="2"><c:if test="${apartment.id==0}">
								<input type="submit" value="Dodaj Mieszkanie"
									class="btn btn-success" />
							</c:if> <c:if test="${apartment.id!=0}">
								<input type="submit" value="Edytuj" class="btn btn-success" />
							</c:if></td>




						<td height="1"><form:hidden path="id" />
					</tr>
				</table>

			</form:form>
			<c:if test="${!empty apartmentList}">
				<table class="data">
					<tr>
						<br>
						<h2>Lista mieszkań</h2>
						<hr>
						<th><h3>
								<b>Numer Mieszkania</b>
							</h3></th>

						<th><h3>
								<b>Numer Budynku</b>
							</h3></th>

						<th>&nbsp;</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${apartmentList}" var="apartment">
						<tr>
							<td><h4>${apartment.number}</h4></td>
							<td><h4>${apartment.building.number}</h4></td>
							<td><a href="delete/apartment/${apartment.id}.html"
								class="btn btn-danger">Usuń</a></td>
							<td><a href="apartment.html?apartmentId=${apartment.id}"
								class="btn btn-warning">Edytuj</a></td>

						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>