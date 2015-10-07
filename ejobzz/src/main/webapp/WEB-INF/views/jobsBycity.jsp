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
	float: left;
	width: 25%;
	font-size: 12px;
color: #666;
}
</style>
						<h3 style="width: 100%; font-size: 18px;">Jobs By Top Location</h3>




						
							<a href="GetJobsByCity.do?city=3"><h3>Banglore/Bengaluru Jobs</h3></a>
							<a href="GetJobsByCity.do?city=6"><h3>Delhi Jobs</h3></a>
							<a href="GetJobsByCity.do?city=9"><h3> Pune Jobs</h3></a>
							<a href="GetJobsByCity.do?city=2"><h3>Ahamedabad Jobs</h3></a>
							<a href="GetJobsByCity.do?city=5"><h3>Chennai Jobs</h3></a>
							<a href="GetJobsByCity.do?city=4"><h3>Kolkotta Jobs</h3></a>
							<a href="GetJobsByCity.do?city=7"><h3>Hyderabad Jobs</h3></a>
							<a href="GetJobsByCity.do?city=10"><h3>Chandigarh Jobs</h3></a>
							<a href="GetJobsByCity.do?city=60"><h3>Gurgaon Jobs</h3></a>
							<a href="GetJobsByCity.do?city=157"><h3>Noida Jobs</h3></a>

					</div>
<br/>
					<div class="ibox-content">
						<style>
.ibox-content h3 {
	line-height: 25px;
	float: left;
	width: 25%;
	font-size: 12px;
color: #666;
}
</style>
						<h3 style="width: 100%; font-size: 18px; ";>Jobs By Location</h3>




						<c:forEach items="${location}" var="loc">
							<a href="GetJobsByCity.do?city=${loc.id }"><h3>${loc.lname }
									Jobs</h3></a>
						</c:forEach>


					</div>


				</div>


			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>