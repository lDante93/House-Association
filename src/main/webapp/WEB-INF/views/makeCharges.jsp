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

		
			<hr>
			<table>
				<tr>
					<td width="200"><font size="6">Ceny opłat</font></td>

					<td><a
						href="editChargesPrice.html?chargesPriceId=${chargesPrice.id}"
						class="btn btn-warning">Edytuj</a></td>
				</tr>
			</table>
			<table class="data">





				<tr>


					<td><h5>
							<b>Prąd [zł/kWh]</b>
						</h5></td>
					<td><h5>
							<b>Ciepła Woda [zł/m^3]</b>
						</h5></td>
					<td><h5>
							<b>Zimna Woda [zł/m^3]</b>
						</h5></td>
					<td><h5>
							<b>Gaz [zł/m^3]</b>
						</h5></td>
					<td><h5>
							<b>Śmieci [zł/osobę]</b>
						</h5></td>
					<td><h5>
							<b>Ogrzewanie [zł/osobę]</b>
						</h5></td>
					<td><h5>
							<b>Ścieki [zł/osobę]</b>
						</h5></td>
					<td><h5>
							<b>Fundusz Remontowy [zł/osobę]</b>
						</h5></td>

					<th>&nbsp;</th>
					<th>&nbsp;</th>

				</tr>
				<tr>

					<td width="140"><h4>${chargesPrice.electricityPrice}</h4></td>
					<td width="140"><h4>${chargesPrice.hotWaterPrice}</h4></td>
					<td width="140"><h4>${chargesPrice.coldWaterPrice}</h4></td>
					<td width="140"><h4>${chargesPrice.gasPrice}</h4></td>
					<td width="140"><h4>${chargesPrice.garbagePrice}</h4></td>
					<td width="140"><h4>${chargesPrice.heatingPrice}</h4></td>
					<td width="140"><h4>${chargesPrice.sewagePrice}</h4></td>
					<td width="140"><h4>${chargesPrice.repairFundPrice}</h4></td>
					
				</tr>
			</table>

			<br>
			<h2>Stan liczników użytkowników</h2>
		
				<table class="data">
					<tr>
						<td width="200"><h5>
								<b>Imię</b>
							</h5></td>
						<td width="200"><h5>
								<b>Nazwisko</b>
							</h5></td>

						<td width="200"><h5>
								<b>Prąd [kWh]</b>
							</h5></td>
						<td width="200"><h5>
								<b>Ciepła Woda [m^3]</b>
							</h5></td>
						<td width="200"><h5>
								<b>Zimna Woda [m^3]</b>
							</h5></td>
						<td width="200"><h5>
								<b>Gaz [m^3]</b>
							</h5></td>



					</tr>
				
					<hr>
<br>
	
					
					

<c:forEach items="${userList}" var="user" varStatus = "status">

<c:if test="${status.first}"></c:if>
 <c:if test="${!status.first}"><tr>
						<td width="200"><h5>${user.firstname}</h5></td>
						<td width="200"><h5>${user.lastname}</h5></td>
						<td width="200"><h5>${user.chargesAmount.electricityAmount}</h5></td>
						<td width="200"><h5>${user.chargesAmount.hotWaterAmount}</h5></td>
						<td width="200"><h5>${user.chargesAmount.coldWaterAmount}</h5></td>
						<td width="200"><h5>${user.chargesAmount.gasAmount}</h5></td>

						<td><a href="oneCharge.html?userId=${user.id}"
							class="btn btn-warning">Nalicz Opłaty</a></td></tr>
</c:if>
</c:forEach>

</table>

					

	
				


				<br>
				<h2>Lista opłat użytkowników</h2>
				<c:if test="${!empty userList}">
					<table class="data">
						<tr>
							<th><h5>
									<b>Imię [zł]</b>
								</h5></th>
							<th><h5>
									<b>Nazwisko [zł]</b>
								</h5></th>

							<th><h5>
									<b>Prąd [zł]</b>
								</h5></th>
							<th><h5>
									<b>Ciepła Woda [zł]</b>
								</h5></th>
							<th><h5>
									<b>Zimna Woda [zł]</b>
								</h5></th>
							<th><h5>
									<b>Gaz [zł]</b>
								</h5></th>
							<th><h5>
									<b>Śmieci [zł]</b>
								</h5></th>
							<th><h5>
									<b>Ogrzewanie [zł]</b>
								</h5></th>
							<th><h5>
									<b>Ścieki [zł]</b>
								</h5></th>
							<th><h5>
									<b>Fundusz Remontowy [zł]</b>
								</h5></th>
							<th><h5>
									<b>Opłacono?</b>
								</h5></th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>

						</tr>
						<hr>
						<c:forEach items="${userList}" var="user" varStatus = "status">
						
						<c:if test="${status.first}"></c:if>
 <c:if test="${!status.first}">
						
							<tr>
								<td width="100"><h5>${user.firstname}</h5></td>
								<td width="100"><h5>${user.lastname}</h5></td>
								<td width="100"><h5>${user.charges.electricity}</h5></td>
								<td width="100"><h5>${user.charges.hotWater}</h5></td>
								<td width="100"><h5>${user.charges.coldWater}</h5></td>
								<td width="100"><h5>${user.charges.gas}</h5></td>
								<td width="100"><h5>${user.charges.garbage}</h5></td>
								<td width="100"><h5>${user.charges.heating}</h5></td>
								<td width="100"><h5>${user.charges.sewage}</h5></td>
								<td width="100"><h5>${user.charges.repairFund}</h5></td>


								<td><c:if test="${user.charges.paid=='false'}">

Nie
							</c:if> <c:if test="${user.charges.paid=='true'}">

Tak
							</c:if></td>
							</c:if>
						</c:forEach>
					</table>
				</c:if>
		</div>
	</div>






</body>
</html>