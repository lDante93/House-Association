<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
			<h2>Opłaty</h2>

			<form:form method="post" action="editChargesPrice.html"
				commandName="chargesPrice">
				<table>
					<br>
					<tr>
						<td><form:label path="electricityPrice">Prąd</form:label></td>
						<td><form:input path="electricityPrice" /></td>
						<td><form:errors path="electricityPrice" /></td>
					</tr>
					<tr>
						<td><form:label path="hotWaterPrice">Ciepła Woda</form:label></td>
						<td><form:input path="hotWaterPrice" /></td>
						<td><form:errors path="hotWaterPrice" /></td>
					</tr>
					<tr>
						<td><form:label path="coldWaterPrice">Zimna Woda</form:label></td>
						<td><form:input path="coldWaterPrice" /></td>
						<td><form:errors path="coldWaterPrice" /></td>
					</tr>
					<tr>
						<td><form:label path="gasPrice">Gaz</form:label></td>
						<td><form:input path="gasPrice" /></td>
						<td><form:errors path="gasPrice" /></td>
					</tr>
					<tr>
						<td><form:label path="heatingPrice">Ogrzewanie</form:label></td>
						<td><form:input path="heatingPrice" /></td>
						<td><form:errors path="heatingPrice" /></td>
					</tr>
					<tr>
						<td><form:label path="garbagePrice">Śmieci</form:label></td>
						<td><form:input path="garbagePrice" /></td>
						<td><form:errors path="garbagePrice" /></td>
					</tr>
					<tr>
						<td><form:label path="sewagePrice">Ścieki</form:label></td>
						<td><form:input path="sewagePrice" /></td>
						<td><form:errors path="sewagePrice" /></td>
					</tr>
					<tr>
						<td><form:label path="repairFundPrice">Fundusz Remontowy</form:label></td>
						<td><form:input path="repairFundPrice" /></td>
						<td><form:errors path="repairFundPrice" /></td>
					</tr>



					<tr>
						<td height="1"><form:hidden path="id" />
					</tr>


					<tr>
						<td><input type="submit" value="Wprowadź"
							class="btn btn-success" /></td>
					</tr>
				</table>
			</form:form>

		</div>
	</div>






</body>
</html>