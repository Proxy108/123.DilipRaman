<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.techNarayana.ejobzz.dto.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add/Edit Education</title>
<jsp:include page="jobseekerLoginHeadder.jsp" />

   <link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
 <c:if test="${sessionScope.lUser == null || empty sessionScope.lUser}">
	<c:redirect url="/Login.do" />
</c:if> 
<body class="top-navigation gray-bg">

	<c:if test="${not empty success}">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${not empty fail}">
		<div class=" alert alert-error">
			<strong>Fail!</strong>${fail}</div>
	</c:if>
	<div class="wrapper wrapper-content">
		<div class="container">
			<div class="row">

				<div class="ibox-content">
					<form:form id="education" commandName="jobseekerRegisterDTO"
						class="form-horizontal" action="UpdateEducation.do" method="POST" onsubmit="return validateEducation()"
						>
						<h3>
							<b>Update Your Basic/Graduation Details:</b>
						</h3>
						<br />
						<div class="row">
								<div class="form-group">

									<label class="col-sm-2 control-label"></label>

									<div class="col-md-4">
										<form:select path="dto.etype" name="etype" id="etype"
											class="form-control" placeholder="etype">
											<form:option value="">Select</form:option>
										<form:option value="SSLC/class 10">SSLC/class 10</form:option>
										<form:option value="PUC/class 12">PUC/class 12</form:option>
										<form:option value="UG">Graduation</form:option>
										<form:option value="PG">Post Graduation</form:option>
										<form:option value="PHD">Phd/Doctarate</form:option>
										
										</form:select>
										<label for="etype" class="error" id="etype-error"></label>
									</div>
									
									
								<!-- </div>
							</div>
							<br />
						<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Education Name:</label>

									<div class="col-md-4">


										<form:hidden path="jsid" id="jsid" value="${lUser.jsid}" ></form:hidden>
										<form:hidden path="dto.eid" ></form:hidden>
										<form:input path="dto.ename" id="ename" class="form-control" ></form:input>
										<label for="ename" class="error" id="ename-error"></label>
									</div>
								</div>
							</div>
							
							<br />
								<div class="row">
								<div class="form-group">

									<label class="col-sm-2 control-label"> </label>

									<div class="col-sm-4">
							
										<form:select path="dto.courseType" name="courseType" id="courseType"
											class="form-control" placeholder="Years">
											<form:option value="F">Full Time</form:option>
											<form:option value="P">Part Time</form:option>
											<form:option value="C">Corresponding</form:option>
										</form:select>
										<label for="courseType" class="error" id="courseType-error"></label>
										
									</div>
									<!-- </div>
							</div>
								<br />
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Boadrd/University</label>

									<div class="col-md-4">
										<form:select path="dto.university" name="university" id="university"
											class="form-control" >
											<c:forEach items="${university}" var="uns">
											<form:option value="${uns.id}">${uns.uname}</form:option>
										
											</c:forEach>	
											</form:select>
											
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">
								<label class="col-sm-2 control-label">Specialization: </label>
									<div class="col-sm-4">
										<form:input path="dto.specialization" name="specialization" id="specialization"
											class="form-control" ></form:input>
											<label for="specialization" class="error" id="specialization-error"></label>
									</div>
								

									<label class="col-sm-2 control-label">Year: </label>

									<div class="col-sm-4">
							
										<form:select path="dto.graduateYear" name="graduateYear" id="graduateYear"
											class="form-control" placeholder="Years">
											<form:option value="">  Year</form:option>
											<form:options items="${years}" />
										</form:select>
										<label for="graduateYear" class="error" id="graduateYear-error"></label>
									</div>
									</div>
							</div>
							
						
						
						<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="submit" class="btn btn-primary" id="profile"
										value="Update Your Profile" />
									<button class="btn btn-white" type="reset">Reset</button>
									<a href="viewJobProfile.do"class="btn btn-info" >Cancel</a>
									<!-- <input type="submit" class="btn btn-primary" id="profile"
										value="Update Your Profile" /> -->
								</div>
							</div>
							
					</form:form>

				</div>
			</div>
		</div>
	</div>



	<!-- <script src="js/jquery-2.1.1.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	function validateEducation(){
	var edutype=$("#etype").val()
		if(edutype==null || edutype==''){
			$("#etype-error").html("Please select Education Type");
			return false;
		}else{
			$("#etype-error").html("");
		}
	
	var ename=$("#ename").val();
	if(ename==null || ename==''){
		$("#ename-error").html("Please Enter Education Name");
		return false;
	}else{
		$("#ename-error").html("");
	}
	
	var courseType=$("#courseType").val();
	if(courseType==null || courseType==''){
		$("#courseType-error").html("Please Enter Course Type");
		return false;
	}else{
		$("#courseType-error").html("");
	}
	
	var specialization=$("#specialization").val()
	if(specialization==null || specialization==''){
		$("#specialization-error").html("Please Enter Specialization ");
		return false;
	}else{
		$("#specialization-error").html("");
	}
	
	var graduateYear=$("#graduateYear").val();
	if(graduateYear==null || graduateYear=='' ||graduateYear==0){
		$("#graduateYear-error").html("Please Select Year of Completion ");
		return false;
	}else{
		$("#graduateYear-error").html("");
	}
	
	
	}
	</script>
	


</body>
</html>