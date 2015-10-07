<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Send  Bulk Mail</title>
<jsp:include page="adminHeader.jsp"></jsp:include>
<style>
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

</head>

<body class="top-navigation gray-bg">

	<form:form name="form" commandName="mailCommand"
		action="bulkmailPreview.do" method="post">
		<div class="ibox-content">
			<div class="wrapper wrapper-content">
				<div class="container">
					<div class="row">

						<div class="ibox-content">
							<h4>
								<b>Contact Selected Candidate(s)</b>
							</h4>
							<br />
						<%-- <label class="col-sm-2 control-label"><font color="red">*</font>Candidates mail Id:</label>${emailID} --%>
						
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label"><font color="red">*</font>Subject / Job
										Title:</label>
									<div class="col-md-4">
										<form:input path="subject"  id="subject" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Email (Ejobzz Registered):</label>
									<div class="col-md-4">
										<form:input path="recruiterEmailId" id="recruiterEmailId" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Job Experience:</label>
									<div class="col-md-2">
										<form:input path="jobExpFrom" class="form-control"  placeholder="yy.mm"/>
									</div>
									<div class="col-md-1">
										to
										</div>
									<div class="col-md-2">
										<form:input path="jobExpTo" class="form-control" placeholder="yy.mm"/>
									</div>
									
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Job CTC:</label>
									<div class="col-md-2">
										<form:select path="ctcFromLac" name="state" class="form-control">
											
											<form:option value="0">0</form:option>	
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
											<form:option value="4">4</form:option>
											<form:option value="5">5</form:option>
						
										</form:select>
									</div>
										<div class="col-md-1">
										Lacs to
										</div>
										
									<div class="col-md-2">
										<form:select path="ctcToLac" name="state" class="form-control">
											
											<form:option value="0">0</form:option>	
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
											<form:option value="4">4</form:option>
											<form:option value="5">5</form:option>
						
										</form:select>
									</div>
								</div>	
							</div>
							<br/>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Other Salary
										Details:</label>
									<div class="col-md-4">
										<form:input path="otherSalaryDetails" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<label class="col-sm-6 control-label\">Specify salary details like incentives, reimbursements, breakup of salary, or "Best in the Industry" etc.</label>
								</div>
							</div><br/>	
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Job Location :</label>
									<div class="col-md-4">
										<form:select path="jobLoc"
											data-placeholder="Select Location" class="chosen-select" multiple="true"
											style="width:350px;">
											<c:forEach items="${location}" var="loc">
												<form:option value="${loc.id}">${loc.lname}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
							
							<br/>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label"><font color="red">*</font> Message:</label>
									<div class="col-md-5">
										<form:textarea path="message" class="form-control" style="width: 100%; height: 126px;"/>
									</div>
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Signature :</label>
									<div class="col-md-5">
										<form:textarea path="signature" class="form-control" style="width: 100%; height: 50px;"/>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-md-5">
									<font color="green" size="2" style="float:right;">Maximum characters 250</font>
									</div>
								</div>
							</div>
							<br />

						</div>

						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<form:button class="btn btn-primary" type="submit">Review & Send</form:button>
								<form:button class="btn btn-white" type="reset">Cancel</form:button>

							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="ibox float-e-margins"></div>
					</div>
				</div>
			</div>
		</div>
	</form:form>


	
	<script type="text/javascript">
		$(document).ready(function() {
			$(":file").filestyle({
				buttonName : "btn btn-primary"
			});
		});
	</script>
	
	<script type="text/javascript">
	
	function validateSendbulkmail(){
	var emailId=$("#emailId").val();
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	if(re.test(emailId)){
			$("#emailId-error").html("");
		
	}else{
		$("#emailId-error").html("Please Enter Email");
		return false;
	}
	
	
	var subject=$("#subject").val();
	if(subject==''){
		$("#subject-error").html("Please Enter Subject");
		return false;
	}
	else{
		$("#subject-error").html("");
	}
	
	var reemailId=$("#recruiterEmailId").val();
	 var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(filter.test(reemailId)){
		$("#recruiterEmailId-error").html("");
	}
	else{
		$("#recruiterEmailId-error").html("Please Enter email Id");
		return false;
	}
	
	
		 var ex=/^\d+(\.\d{0,2})?$/;
		var exp1 = $("#jobExpFrom").val();
		var exp2 = $("#jobExpTo").val();
		if(exp1=='' && exp2==''){
			$("#jobExpFrom-error").html("Please Enter Expirience");
			return false;
		}
		else if((ex.test(exp1) && (ex.test(exp2))) ){
			if(exp1<exp2){
				$("#jobExpFrom-error").html(" ");
				
			}else{
				$("#jobExpFrom-error").html("Please Enter Exp From is less Than Exp To Value");
				return false;
			}
			
		}else{
			$("#jobExpFrom-error").html("Please Enter Valid Expirience");
			return false;
		}
		
		
		 var jobLoc = $("#jobLoc").val();
				if(jobLoc=='' || jobLoc==null){
					$("#jobLoc-error").html("Please Select Job location");
					return false;
					
				}
				else{
					$("#jobLoc-error").html("");
				}
			
				 var message = $("#message").val();
				if(message=='' || message==null){
					
					$("#message-error").html("Please Enter Message");
					return false;
					
				}
				else{
					$("#message-error").html("");
				} 
				
				
	}
	
	$('#message').on('keyup',function(){
		   $("#count").val($(this).val().length);
		});
	$('#signature').on('keyup',function(){
		   $("#count1").val($(this).val().length);
		});
	
	</script>
</body>





</html>