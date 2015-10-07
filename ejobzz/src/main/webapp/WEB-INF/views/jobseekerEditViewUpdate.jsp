<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.techNarayana.ejobzz.dto.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Jobseeker Profile</title>
<jsp:include page="jobseekerLoginHeadder.jsp" />

<link href="css/datepicker3.css" rel="stylesheet">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
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
					<form:form commandName="jobseekerRegisterDTO"
						class="form-horizontal" action="UpdateandviewJobProfile.do" onsubmit="return validateprofile()"
						method="POST">
						<h3>
							<b>Update Your Profile Details:</b>
						</h3>
						<br />
						<div class="row">
							<div class="form-group">
								<label class="col-sm-2 control-label">Resume Tittle</label>

								<div class="col-md-4">
									<form:input path="resumeTitle" name="resumeTitle" id="resumeTitle"
										class="form-control" />
										<label for="resumeTitle" class="error" id="resumeTitle_error"></label>
								</div>
								

							
								<label class="col-sm-2 control-label">Key Skills</label>

								<div class="col-md-4">
									<form:select path="keySkills" name="keySkills" id="keySkills"
											class="chosen-select" style="width:300px;" multiple="true" tabindex="4" >
											<optgroup label="Select KeySkills">
											<c:forEach items="${skillsList}" var="skil">
											<form:option value="${skil.name}">${skil.name}</form:option>
										
											</c:forEach>
										</form:select>
										<label for="keySkills" class="error" id="keySkills_error"></label>
								</div>
								

							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="col-sm-2 control-label">Full Name</label>

								<div class="col-md-4">
									<form:input path="name" name="name" class="form-control" />
									<label for="name" class="error" id="name_error"></label>
								</div>

								<label class="col-sm-2 control-label">Email Id</label>

								<div class="col-md-4">
									<form:input path="email" name="email" class="form-control" readonly="true" />
								</div>
								
							 </div>
						</div>

						<div class="row">
							<div class="form-group"> 
								<label class="col-sm-2 control-label">Location</label>
								<div class="col-md-4">
								<form:select id="location" path="location" 
									data-placeholder="Choose a Country..." class="chosen-select"
									style="width:300px;" tabindex="2" >
									<form:option value="0">Select Location</form:option>
									<c:forEach items="${location}" var="loc">
										<form:option value="${loc.id}">${loc.lname}</form:option>

									</c:forEach>
				
								</form:select>
								<label for="location" class="error" id="location_error"></label>
								</div>
									
						
								<label class="col-sm-2 control-label">Pref.Location</label>
								<div class="col-md-4">

									<form:select path="jobIntrestLocations"
										name="jobIntrestLocations" id="jobIntrestLocations" class="chosen-select" style="width:300px;"
										 multiple="true" >
											

										<c:forEach items="${location}" var="loc">
											<option value="${loc.id}">${loc.lname}</option>

										</c:forEach>
									</form:select>
								<label for="jobIntrestLocations" class="error" id="jobIntrestLocations_error"></label>
								</div></div></div>

						

						<div class="row">
							<div class="form-group">
								<label class="col-sm-2 control-label">Total Exp</label>

								<div class="col-md-4">
									<form:input path="totalExp" name="totalExp" id="totalExp"
										class="form-control" />
								</div>

								<label class="col-sm-2 control-label">Mobile No</label>

								<div class="col-md-4">
									<form:input path="contactNo" name="contactNo" id="contactNo"
										class="form-control" />
								</div></div></div>
							<div class="row">
							<div class="form-group">
								<label class="col-sm-2 control-label">City</label>

								<div class="col-md-4">
									<form:input path="city" name="city" id="city" class="form-control" />
								</div>

						
								<label class="col-sm-2 control-label">Dob</label>


								<div class="col-md-4">
									<form:input path="dob" name="dob"  placeholder="Date Of Birth"
										id="datepicker1" data-date-format="dd-mm-yyyy"
										class="form-control" />
										<label for="datepicker1" class="error" id="dob_error"></label>
								</div>
							
								<label class="col-sm-2 control-label">gender</label>

								<div class="col-md-4">
									<form:radiobutton path="gender" value="Male" />
									Male
									<form:radiobutton path="gender" value="Female" />
									Female
									<form:radiobutton path="gender" value="Others" />
									Others
								</div>
								
							</div>
							
						</div>
				<br/>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<input type="submit" class="btn btn-primary"
									value="Update Your Profile" />
								<button class="btn btn-white" type="reset">Reset</button>

							</div>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>


	<script src="js/chosen.jquery.js"></script>

	<script src="js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
	function validateprofile(){
		var resumeTitle = $("#resumeTitle").val();
		if (resumeTitle == '') {
			$("#resumeTitle_error").html("Please enter Resume Tittle ");
			return false;
		} else {
			$("#resumeTitle_error").html("");
		}
		var keySkills = $("#keySkills").val();

		if (keySkills == '' || keySkills == 0 || keySkills ==null) {

			$("#keySkills_error").html("Please Select Keyskills ");
			return false;
		} else {
			$("#keySkills_error").html("");
		}
		var name = $("#name").val();
		 var regex = /^[a-zA-Z][\sa-zA-Z]*$/;
		if (name == '' && regex.test(name)) {
			$("#name_error").html("Please Select Location");
			return false;
		} else {
			$("#name_error").html("");
		}
		var location = $("#location").val();
		if (location == '' || location==0 || location==null) {
			$("#location_error").html("Please Select Location");
			return false;
		} else {
			$("#location_error").html("");
		}
		
		var jobIntrestLocations = $("#jobIntrestLocations").val();
		if (jobIntrestLocations == '' || jobIntrestLocations==0 || jobIntrestLocations==null) {
			$("#jobIntrestLocations_error").html("Please Select interested Location");
			return false;
		} else {
			$("#jobIntrestLocations_error").html("");
		}
		
		var dob=$("#datepicker1").val();
		  var year = dob.split('-');
		     var d = new Date();
		     var n = d.getFullYear();
		     if ( dob.match(/^\d\d?\-\d\d?\-\d\d\d\d$/) && parseInt(year[2]) <= (n-10) ){
		    	 $("#dob_error").html("");
		    	
		     }else{
		    	 $("#dob_error").html("Please Select Correct Date of Birth");
		    		return false;
		    	 
		     }
	}
	
	
	</script>
	<script type="text/javascript">
	 $(document).ready(function(){
		    
		    $('#datepicker1').datepicker().on('changeDate', function(ev){
				$(this).datepicker('hide');

			});


			
		 
			

		});
var values="${jobseekerRegisterDTO.jobIntrestLocations}";
$.each(values.split(","), function(i,e){
    $("#jobIntrestLocations option[value='" + e + "']").prop("selected", true);
});
var values="${jobseekerRegisterDTO.keySkills}";
$.each(values.split(","), function(i,e){
    $("#keySkills option[value='" + e + "']").prop("selected", true);
});
</script>
</body>
</html>