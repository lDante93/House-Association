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
<link href="<c:url value="/resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />" rel="stylesheet">

</head>
<body>





	<div class="thumbnail">

		<div class="caption">
			<h2>Wprowadź aktualny stan liczników</h2>

			<form:form method="post" action="editChargesAmount.html"
				commandName="chargesAmount">
				<table>
					<br>
					<tr>
						<td><form:label path="electricityAmount"><font size="3"><i class="fa fa-bolt"
							aria-hidden="true">	</i></font>&nbsp;Prąd</form:label></td>
						<td><form:input path="electricityAmount" /></td>
						<td><form:errors path="electricityAmount" /></td>
					</tr>
					<tr>
						<td><form:label path="hotWaterAmount"><font size="3"><i class="fa fa-thermometer-full"
							aria-hidden="true">	</i></font>&nbsp;Ciepła Woda</form:label></td>
						<td><form:input path="hotWaterAmount" /></td>
						<td><form:errors path="hotWaterAmount" /></td>
					</tr>
					<tr>
						<td><form:label path="coldWaterAmount"><font size="3"><i class="fa fa-thermometer-empty"
							aria-hidden="true">	</i></font>&nbsp;Zimna Woda</form:label></td>
						<td><form:input path="coldWaterAmount" /></td>
						<td><form:errors path="coldWaterAmount" /></td>
					</tr>
					<tr>
						<td><form:label path="gasAmount"><font size="3"><i class="fa fa-fire"
							aria-hidden="true">	</i></font>&nbsp;Gaz</form:label></td>
						<td><form:input path="gasAmount" /></td>
						<td><form:errors path="gasAmount" /></td>

					</tr>
					<tr>
			






						<td height="1"><form:hidden path="id" />
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