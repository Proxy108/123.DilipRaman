<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.techNarayana.ejobzz.dto.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Jobseeker Education</title>
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
					<form:form id="experience" commandName="jobseekerRegisterDTO"
						class="form-horizontal" action="addEmployerPost.do" method="POST" onsubmit="return jobseekerCompanyvalidation()">
						<h3>
							Update Your Employment Details:
						</h3>
						<br />
						<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Company Name</label>

									<div class="col-md-4">


										<form:hidden path="jsid" value="${lUser.jsid}" ></form:hidden>
										<form:input path="edto.companyName" id="companyName" class="form-control" ></form:input>
										<label for="companyName" class="error" id="companyName_error"></label>
										
									</div>
									
								
									<label class="col-sm-2 control-label">Designation</label>

									<div class="col-md-4">
										<form:input path="edto.designation" name="designation" id="designation"
											class="form-control" ></form:input>
												<label for="designation" class="error" id="designation_error"></label>
									</div>
									
								</div>
							</div>
							<br />
							

							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Select Employee Type</label>
									<div class="col-md-4">
	
 								<form:select path="edto.employeeType"
											name="employeeType" placeholder="employeeType" id="employeeType"
											class="form-control" >
											
											<form:option value="C">Current Employer</form:option>
											<form:option value="P">Previous Employer</form:option>
											<form:option value="O">Other Employer</form:option>
								</form:select>
								<label for="employeeType" class="error" id="employeeType_error"></label>
									</div>
										
								
									<label class="col-sm-2 control-label">Industry Type</label>

									<div class="col-md-4">
										<form:select path="edto.industryType" id="industryType"
											data-placeholder="Select Industry type" class="chosen-select"
											 style="width:300px;">
											<form:option value="" >-- Select Industry --</form:option>
											<c:forEach items="${industryList}" var="ind">
	      										<form:option value="${ind.id}" >${ind.iname}</form:option> 
											</c:forEach></form:select>
											<label for="industryType" class="error" id="industryType_error"></label>
									</div>
									
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">

									<label class="col-sm-2 control-label">Experience From </label>

									<div class="col-sm-2">
										<form:select path="edto.joinedyear" name="joinedyear" id="joinedyear"
											class="form-control" placeholder="Years">
											<form:option value=" ">  Year</form:option>
											<form:options items="${years}" />
										</form:select>
									</div>
									<div class="col-sm-2">
										<form:select path="edto.joinedmonth" name="joinedmonth" id="joinedmonth"
											placeholder="Months" class="form-control ">
											<form:option value=""> Month</form:option>
											<c:forEach var="month" items="${months}">
												<form:option value="${month.key}">${month.value}</form:option>

											</c:forEach>
										</form:select>
											<label for="joinedyear" class="error" id="joinedyear_error"></label>
									</div>
									</div>
							</div>
							
							<div class="row">
								<div class="form-group"> 
										<label class="col-sm-2 control-label "> To </label>

									<div class="col-sm-2">
										<form:select path="edto.endingyear" name="endingyear" id="endingyear"
											placeholder="Years" class="form-control">
											<form:option value=""> Year</form:option>
											<form:options items="${years}" />
										</form:select>
									</div>
									<div class="col-sm-2">
										<form:select path="edto.endingmonth" name="endingmonth" id="endingmonth"
											placeholder="Months" class="form-control">
											<form:option value=""> Month</form:option>
											
											<c:forEach var="month" items="${months}">
												<form:option value="${month.key}">${month.value}</form:option>

											</c:forEach>

										</form:select>
										<label for="endingyear" class="error" id="endingyear_error"></label>
									</div>
								
									
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Currency Type</label>
									<div class="col-md-4">
										<form:radiobutton path="edto.currencyType" value="INR" />
										Indian Rupees
										<form:radiobutton path="edto.currencyType" value="USD" />
										USD

									</div>

									 </div>
								</div>
							<div class="row">
								<div class="form-group"> 

									<label class="col-sm-2 control-label">CTC </label>

									<div class="col-sm-2">
										<form:select path="edto.currentsalLackh" name="currentsalLackh" id="currentsalLackh"
											class="form-control" placeholder="Lackhs">
											
											<form:option value="0"> Salary In Lackhs</form:option>
										<form:options items="${lac}" />
										<label for="currentsalLackh" class="error" id="currentsalLackh_error"></label>
										</form:select>
									
									</div>
									<div class="col-sm-2">
										<form:select path="edto.currentsalThousand" name="currentsalThousand" id="currentsalThousand"
											placeholder="Thousands" class="form-control ">
												
											<form:option value="0"> Salary In Thousands</form:option>
										<form:options items="${lac}" />
										</form:select>
									</div>
									
									</div></div>
									<br />
									
							



							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Job Profile Desc</label>
									<div class="col-md-4">
										<form:textarea path="edto.jobProfileDesc"
											name="jobProfileDesc" id="jobProfileDesc"
											class="form-control" value="" ></form:textarea>
									</div>

								</div>
							</div> 
						<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="submit" class="btn btn-primary"
										value="Create" />
									<button class="btn btn-white" type="reset">Reset</button>
									<a href="viewJobProfile.do"class="btn btn-info" >Cancel</a>
								</div>
							</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>




	
	<script type="text/javascript">
$(document).ready(function(){

  $('#data_1 .input-group.date').datepicker().on('changeDate', function(ev){
		$(this).datepicker('hide');

	});

});
</script>

<script type="text/javascript">

function jobseekerCompanyvalidation() {
		var company = $("#companyName").val();
		if (company == '') {
			$("#companyName_error").html("Enter Company Name ");
			return false;
		} else {
			$("#companyName_error").html("");
		}
		var industry = $("#industryType").val();

		if (industry == '' && industry == 0) {

			$("#industryType_error").html("Select Industry Type");
			return false;
		} else {
			$("#industryType_error").html("");
		}
		var designation = $("#designation").val();
		if (designation == '') {
			$("#designation_error").html("Enter designation");
			return false;
		} else {
			$("#designation_error").html("");
		}
		var currentsalLackh = $("#currentsalLackh").val();
		var currentsalThousand = $("#currentsalThousand").val();
		if ((currentsalLackh == 0) && (currentsalThousand == 0)) {
			$("#currentsalLackh_error").html("Enter current salary ");
			return false;
		} else {
			$("#currentsalLackh_error").html("");
		}

		var joinedmonth = $("#joinedmonth").val();
		var joinedyear = $("#joinedyear").val();
		if ((joinedyear == 0) || (joinedmonth == 0)) {
			$("#joinedyear_error")
					.html("Select Joined year  and month");
			return false;
		} else {
			$("#joinedyear_error").html("");
		}
		
		var endingyear = $("#endingyear").val();
		var endingmonth = $("#endingmonth").val();
		if ((endingyear == 0 || endingmonth == 0)
				|| (joinedyear > endingyear)) {
			$("#endingyear_error").html(
					"please Select ending year  and month");
			return false;
		} else {
			$("#endingyear_error").html("");
		}

		var jobProfileDesc = $("#jobProfileDesc").val();
		if (jobProfileDesc == '') {
			$("#jobProfileDesc_error").html(
					"please write Job profile decriptions");
			return false;
		} else {
			$("#jobProfileDesc_error").html("");
		}

		var etype = $("#etype").val();
		if (etype == '') {
			$("#etype_error").html("please select Education Type");
			return false;
		} else {
			$("#etype_error").html("");
		}
		var ename = $("#ename").val();
		if (ename == '') {
			$("#ename_error").html("please select Education Name");
			return false;
		} else {
			$("#ename_error").html("");
		}

		var specialization = $("#specialization").val();
		if (specialization == '') {
			$("#specialization_error").html(
					"please select Graduation Year");
			return false;
		} else {
			$("#specialization_error").html("");
		}
		var graduateYear = $("#graduateYear").val();
		if (graduateYear == '') {
			$("#graduateYear_error").html("please select Graduation Year");
			return false;
		} else {
			$("#graduateYear_error").html("");
		}
		if($("#countrow").val()<=0){
			$("#addskills_error").html("please Add attleast one skill");
			return false;
		}else{
			$("#addskills_error").html("");
		}
	}
</script>

</body>
</html>