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

			<br>
			<center></center>
			<br>
			<hr>
			<table>
				<tr>
					<td width="200"><font size="6">Stawki opłat</font></td>


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
			<h2>Stan licznika użytkownika</h2>

			<table class="data">
				<tr>



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




				</tr>

				<hr>
				<br>






				<c:if test="${!empty charges}">
					<tr>
						<td width="120"><h5>${charges.electricity}</h5></td>
						<td width="120"><h5>${charges.hotWater}</h5></td>
						<td width="120"><h5>${charges.coldWater}</h5></td>
						<td width="120"><h5>${charges.gas}</h5></td>
						<td width="120"><h5>${charges.garbage}</h5></td>
						<td width="120"><h5>${charges.heating}</h5></td>
						<td width="120"><h5>${charges.repairFund}</h5></td>
						<td width="120"><h5>${charges.sewage}</h5></td>

						<td><c:if test="${charges.paid=='false'}">

Nie
							</c:if> <c:if test="${charges.paid=='true'}">

Tak
</c:if>
						<td><a href="Payment.html" class="btn btn-warning">Opłać</a></td>
					</tr>

				</c:if>

			</table>







		</div>
	</div>






</body>
</html>