<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs By City</title>
<jsp:include page="header.jsp" />

</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JOBS By City</title>
</head>
<body class="top-navigation gray-bg">
	<div class="ibox-content" style="line-height: 25px;">
		<div class="wrapper wrapper-content">
			<div class="container">
				<div class="row">

					<div class="ibox-content">
						<style>
.ibox-content h3 {
	line-height: 25px;
}
</style>
						<h3>Jobs By Location</h3>


							<a href="GetJobsByCity.do?city=1"><h3>Bangalore</h3></a>
							<a href="GetJobsByCity.do?city=4"><h3>Kolkotta</h3></a>
							<a href="GetJobsByCity.do?city=3"><h3>Delhi</h3></a>
							<a href="GetJobsByCity.do?city=8"><h3>Hyderabad</h3></a>
							<a href="GetJobsByCity.do?city=6"><h3>Mumbai</h3></a>
							<a href="GetJobsByCity.do?city=7"><h3>Noida</h3></a>
							<a href="GetJobsByCity.do?city=5"><h3>Chennai
</h3></a>


					</div>


				</div>


			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>