<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs By Designation</title>
<jsp:include page="header.jsp"/>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JOBS By Designation</title>
</head>
<body class="top-navigation gray-bg">
		<div class="ibox-content" >
			<div class="wrapper wrapper-content" >
				<div class="container">
					
		
		<div class="row">
				<style>
				
				.ibox-content h3	{	line-height: 25px;
	float: left;
	width: 25%;
	font-size: 12px;
color: #666;}</style>
						<div class="ibox-content">
							
						<h3 style="width: 100%; font-size: 18px; ">Jobs By Designation</h3>
					
						
						<c:forEach items="${designation }" var="design">
						<a href="GetJobsByDesignation.do?design=${design.name }"><h3>${design.name }</h3></a>
						
						</c:forEach>
		
		</div>
		
		
		</div>
		</div>
		</div>
		</div>

		<jsp:include page="footer.jsp"/>
</body>
</html>