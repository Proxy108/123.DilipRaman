<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>Jobseeker Details</title>

<jsp:include page="header.jsp" />
<style type="text/css">
.table {
	width: 100%;
	float: none !important;
}

.form-control {
	float: left;
	margin: 10px;
}
</style>
</head>


<body class="top-navigation gray-bg">

	<div class="ibox-content">
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



						<form:form commandName="jobseekerRegisterDTO" id="EmpandEDu"
							class="form-horizontal" action="EditupdateEduandExpdetails.do"
							onsubmit="return jobseekerExpvalidation()" method="POST">
							<input type="hidden" id="expval"
								value="${jobseekerRegisterDTO.totalExp }">
							<div id="ExperienceId">
								<h3>
									<b>Create Current Employer Details </b>
								</h3>
								<br />


								<div class="row">
									<div class="form-group">
										<label class="col-sm-2 control-label">Company Name</label>

										<div class="col-md-4">


											<form:hidden path="jsid" value="${id}"></form:hidden>
											<form:hidden path="edto.employeeType" value="C"></form:hidden>
											<form:input path="edto.companyName" id="companyName"
												class="form-control"></form:input>
											<label for="companyName" class="error" id="companyName_error"></label>
										</div>


										<label class="col-sm-2 control-label">Industry Type</label>

										<div class="col-md-4">
											<form:select path="edto.industryType" id="industryType"
												data-placeholder="Select Industry type"
												class="chosen-select" style="width:300px;">
												<form:option value="">-- Select Industry --</form:option>
												<c:forEach items="${industryList}" var="ind">
													<form:option value="${ind.id}">${ind.iname}</form:option>
												</c:forEach>
											</form:select>
											<label for="industryType" class="error"
												id="industryType_error"></label>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label class="col-sm-2 control-label">Designation</label>

										<div class="col-md-4">
											<form:input path="edto.designation" name="designation"
												id="designation"
												value="${jobseekerRegisterDTO.designation }"
												class="form-control"></form:input>
											<label for="designation" class="error" id="designation_error"></label>
										</div>

									</div>

								</div>

								<div class="row">
									<div class="form-group">
										<label class="col-sm-2 control-label">CTC</label>

										<div class="col-md-2">
											<form:select path="edto.currentsalLackh"
												name="currentsalLackh" id="currentsalLackh"
												placeholder="Lackhs" class="form-control">
												<form:option value="0"> Salary In Lackhs</form:option>
												<form:options items="${lac}" />
											</form:select>
											<label for="designation" class="error"
												id="currentsalLackh_error"></label>
										</div>

										<div class="col-md-2">
											<form:select path="edto.currentsalThousand"
												name="currentsalThousand" id="currentsalThousand"
												placeholder="Thousands" class="form-control">
												<form:option value="0"> Salary In Thousands</form:option>
												<form:options items="${thousand}" />
											</form:select>
										</div>
										<div class="col-md-4">
											<form:radiobutton path="edto.currencyType" id="currencyType"
												value="INR" />
											INR
											<form:radiobutton path="edto.currencyType" id="currencyType"
												value="USD" />
											USD



										</div>
									</div>

								</div>


								<div class="row">
									<div class="form-group">

										<label class="col-sm-2 control-label">Experience From
										</label>

										<div class="col-md-2">
											<%-- <c:forEach var="code" items="${years}"> --%>
											<form:select path="edto.joinedyear" name="joinedyear"
												id="joinedyear" class="form-control" placeholder="Years">
												<form:option value="0"> Select Year</form:option>
												<form:options items="${years}" />
											</form:select>
											<label for="joinedyear" class="error" id="joinedyear_error"></label>
										</div>
										<div class="col-md-2">
											<form:select path="edto.joinedmonth" name="joinedmonth"
												id="joinedmonth" placeholder="Months" class="form-control">
												<form:option value="0">Select Month</form:option>
												<c:forEach var="month" items="${months}">
													<form:option value="${month.key}">${month.value}</form:option>

												</c:forEach>
											</form:select>
										</div>
									</div>

								</div>
								<br />
								<div class="row">
									<div class="form-group">
										<label class="col-sm-2 control-label">Experience To</label>

										<div class="col-md-2">
											<form:select path="edto.endingyear" name="endingyear"
												id="endingyear" placeholder="Years" class="form-control">
												<form:option value="0"> Select Year</form:option>
												<form:option value="1">Present</form:option>
												<form:options items="${years}" />
											</form:select>
											<label for="endingyear" class="error" id="endingyear_error"></label>
										</div>
										<div class="col-md-2">
											<form:select path="edto.endingmonth" name="endingmonth"
												id="endingmonth" placeholder="Months" class="form-control">
												<form:option value="0">Select Month</form:option>
												<form:option value="1">Present</form:option>
												<c:forEach var="month" items="${months}">
													<form:option value="${month.key}">${month.value}</form:option>

												</c:forEach>

											</form:select>
										</div>
									</div>

								</div>
								<br /> <br />
								<div class="row">
									<div class="form-group">
										<label class="col-sm-2 control-label">Job Profile Desc</label>
										<div class="col-md-4">
											<form:textarea path="edto.jobProfileDesc"
												name="jobProfileDesc" id="jobProfileDesc"
												class="form-control" value=""></form:textarea>
											<label for="jobProfileDesc" class="error"
												id="jobProfileDesc_error"></label>
										</div>

									</div>

								</div>
							</div>

							<br />
							<h3>
								<b>Create Basic Educational Details: </b>
							</h3>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Education Type</label>
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
										<label for="etype" class="error" id="etype_error"></label>
									</div>

									<label class="col-sm-2 control-label">Education Name</label>

									<div class="col-md-4">
										<form:input path="dto.ename" name="ename" id="ename"
											class="form-control"></form:input>
										<label for="ename" class="error" id="ename_error"></label>
									</div>

								</div>
							</div>

							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Specialization</label>

									<div class="col-md-4">
										<form:input path="dto.specialization" name="specialization"
											id="specialization" class="form-control"></form:input>
										<label for="specialization" class="error"
											id="specialization_error"></label>
									</div>

									<label class="col-sm-2 control-label">Board/University</label>


									<div class="col-md-4">
										<form:select path="dto.university" name="university"
											class="form-control" required="true">
											<c:forEach items="${university}" var="uns">
												<form:option value="${uns.id}">${uns.uname}</form:option>

											</c:forEach>
										</form:select>
										<label for="university" class="error" id="university_error"></label>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Completion Year</label>

									<div class="col-md-4">
										<form:select path="dto.graduateYear" name="graduateYear"
											class="form-control">

											<form:option value=""> Select Year</form:option>
											<form:options items="${years}" />

										</form:select>

									</div>
									<label for="graduateYear" class="error" id="graduateYear_error"></label>

								</div>
							</div>
							<br />


							<div id="TextBoxesGroup"></div>
							<label for="AddSkills" class="error" id="addskills_error"></label>
							<input type="button" id="AddSkills" class="btn btn-primary "
								value="Add Skills" />

							<input type="hidden" id="countVariable" value="1" />
							<input type="hidden" id="countrow" value="0" />

							<script type="text/javascript">
								$('#AddSkills').click(function(event) {
													event.preventDefault();
													xLoc = window.pageXOffset;
													yLoc = window.pageYOffset;
													window.scrollTo(150, 150);
													var fileIndexs = $('#TextBoxesGroup tr').length - 1;

													var val = $('#countVariable').val();

													var pNo = val;

													var newTextBoxDiv = $(document.createElement('div')).attr("id",'TextBoxDiv'+ val);
													newTextBoxDiv.html('<table id="ta'+ val+ '" width="100%" border=0><tr>'
																	+'<td width="8%"><form:hidden  path="skills.skillId"  class="form-control" placeholder="skills"></form:hidden></td>'
																	+ '<td width="8%"><form:input  path="skills.skillName" value=" " class="form-control" placeholder="skill Name" ></form:input></td>'
																	+ '<td width="8%"><form:input  path="skills.version" value=" " class="form-control" placeholder="Version" ></form:input></td>'
																	+ '<td width="8%"><form:select path="skills.lastused" value=" " name="lastused" placeholder="lastused" class="form-control"> <form:option value="0" label="--- Last Used ---"/><form:options items="${years}" /></form:select></td>'
																	+ '<td width="8%"><form:select path="skills.expyears" value=" " name="expyears" placeholder="Years" class="form-control"><form:option value="0" label="--- Expirience in Years ---"/><form:options items="${expyears}" /></form:select></td>'
																	+'<td width="8%"><form:select  path="skills.expmonths" value=" " class="form-control" placeholder="Experience in Months" ><form:option value="0" label="--- Expirience in Month ---"/><form:options items="${skillmonth}" /></form:select></td></tr>'
																	+'</table>');
													newTextBoxDiv.appendTo("#TextBoxesGroup");
												$("#countrow").val(pNo);
													event.preventDefault();

												});
							</script>
							<c:set var="count" value="${id + 1}" scope="page" />





							<div class="hr-line-dashed"></div>

							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="submit" class="btn btn-primary"
										value="create Your Profile" />
									<button class="btn btn-white" type="reset">Reset</button>

								</div>
							</div>


						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		
	</script>


	<script type="text/javascript">
		$(document).ready(function() {

			$('#datepicker1').datepicker().on('changeDate', function(ev) {
				$(this).datepicker('hide');

			});

			$(":file").filestyle({
				buttonName : "btn btn-primary"
			});

		});

		function jobseekerExpvalidation() {
			var exp = $('#expval').val();
			if (exp > 0) {
				var company = $("#companyName").val();
				if (company == '') {
					$("#companyName_error").html("Enter Company Name ");
					return false;
				} else {
					$("#companyName_error").html("");
				}
				var industry = $("#industryType").val();

				if (industry == '' || industry == 0) {

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

			}else {
				
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
					$("#addskills_error").html("please Add atleast one skill");
					return false;
				}else{
					$("#addskills_error").html("");
				}
			}

		}
	</script>



</body>





</html>

