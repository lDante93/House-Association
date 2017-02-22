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
				

				<table class="data">
					<tr>
						<td><h2>
								Aktualny Stan Liczników&nbsp;&nbsp;&nbsp; <a
									href="editChargesAmount.html?chargesAmountId=${chargesAmount.id}"
									class="btn btn-warning">Zgłoś dane z liczników</a>
							</h2></td>
					</tr>


					<tr>
						<th><h3>
								<font size="6"><i class="fa fa-bolt" aria-hidden="true"></i></font>&nbsp;&nbsp;<b>Prąd </b>
							</h3></th>
					</tr>
					<tr>
						<td height="40"><h4>${chargesAmount.electricityAmount}  [kWh]</h4></td>
					</tr>

				<tr>
						<th><h3>
								<font size="6"><i class="fa fa-thermometer-full" aria-hidden="true"></i></font>&nbsp;&nbsp;<b>Ciepła Woda</b>
							</h3></th>
					</tr>
					<tr>
						<td><h4>${chargesAmount.hotWaterAmount}  [m^3]</h4></td>
					</tr>

					<tr>
						<th><h3>
							<font size="6"><i class="fa fa-thermometer-empty" aria-hidden="true"></i></font>&nbsp;&nbsp;	<b>Zimna Woda</b>
							</h3></th>
					</tr>
					<tr>
						<td><h4>${chargesAmount.coldWaterAmount}  [m^3]</h4></td>
					</tr>

					<tr>
						<th><h3>
							<font size="6"><i class="fa fa-fire" aria-hidden="true"></i></font>&nbsp;&nbsp;	<b>Gaz</b>
							</h3></th>
					</tr>
					<tr>
						<td><h4>${chargesAmount.gasAmount}  [m^3]</h4></td>
					</tr>





				</table>

		
		
		</div>
	</div>







</body>
</html>