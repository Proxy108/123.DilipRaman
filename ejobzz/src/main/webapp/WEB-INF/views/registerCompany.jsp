
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Register Employer</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="css/datepicker.css" rel="stylesheet" type="text/css" />
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

.mySelect {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>

</head>
<jsp:include page="header.jsp"></jsp:include>

<body class="top-navigation gray-bg">
<div id="modal-form" class="modal fade" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<div class="row">
										<div class="col-sm-6 b-r">
											<h3 class="m-t-none m-b">Sign in</h3>

											<p>Sign in today for more expirience.</p>

											<form role="form">
												<div class="form-group">
													<label>Email</label> <input type="email"
														placeholder="Enter email" class="form-control">
												</div>
												<div class="form-group">
													<label>Password</label> <input type="password"
														placeholder="Password" class="form-control">
												</div>
											</form>
										</div>
										<div class="col-sm-6">
											<h4>Not a member?</h4>
											<p>You can create an account:</p>
											<p class="text-center">
												<a href=""><i class="fa fa-sign-in big-icon"></i></a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> 
	<form:form id="createCompanyform" commandName="companyCommand"
		action="createCompany.do" method="post" enctype="multipart/form-data">
		<div class="ibox-content">
			<div class="wrapper wrapper-content">
				<div class="container">
					<div class="row">

						<div class="ibox-content">
							<h3>
								<b>Register Your Company:</b>
							</h3>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Company Name</label>
									<div class="col-md-4">
										<form:input path="name" id="name" name="name"
											class="form-control" />
									</div>
								<!-- </div>
							
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Email(Login)</label>

									<div class="col-md-4">
										<form:input path="email" id="email" name="email"
											class="form-control" onblur="isEmailRegisteredOrnot(this)" />
									</div>
									<div id='email-error' style="color:red;"></div>
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Password(Login)</label>

									<div class="col-md-4">
										<form:password path="password" id="password"
											class="form-control" />
									</div>
								<!-- </div>
							</div>
							
							<br />
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Phone No.</label>

									<div class="col-md-4">
										<form:input path="phoneNo" id="phoneNo" class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Industry Type</label>

									<div class="col-md-4">
										<form:select path="type" id="type"
											data-placeholder="Select Industry type" class="form-control">

											<form:option value="">Select Industry</form:option>
											<c:forEach items="${industryList}" var="ind">
	      										<form:option value="${ind.id}" >${ind.iname}</form:option> 
											</c:forEach>
										</form:select>
									</div>
								<!-- </div>
							</div>
							<br />
							<div class="row">
								<div class="form-group"> -->

									<label class="col-sm-2 control-label">Address </label>
									<div class="col-md-4">
										<form:textarea path="address" id="address" rows="3"
											class="form-control"></form:textarea>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Country </label>
									
									<div class="col-md-4">
										<form:select path="country" name="country" id="country"
											placeholder="country" class="form-control">
											<form:option value="india" selected="selected">India</form:option>
										</form:select>
									</div>
								<!-- </div>
							</div>
							<br />
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">State </label>
															
									
									<div class="col-md-4">
										<form:select path="state" name="state" id="state"
											placeholder="state" class="form-control"
											onchange="getDistricts(this.value)">
											<form:option value="" selected="selected">Select</form:option>
											<c:forEach items="${stateList}" var="state1">
	      										<form:option value="${state1.name}" >${state1.name}</form:option> 
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">City</label>
									<div class="col-md-4">
										<form:select path="city" name="city" id="city"
											placeholder="city" class="form-control">
											<form:option value="" selected="selected">Select</form:option>
										</form:select>
									</div>
								<!-- </div>
							</div>
							<br />
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Pin code</label>

									<div class="col-md-4">
										<form:input path="pin" id="pin" name="pin"
											class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Contact Person </label>

									<div class="col-md-4">
										<form:input path="contactPersionName" id="contactPersionName"
											name="contactPersionName" class="form-control" />
									</div>
								<!-- </div>
							</div>
							<br />
														
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Upload Company
										Logo</label>
									<div class="col-md-4">
										<input type="file" name="file" id="file" class="filestyle"
											data-buttonName="btn-primary" />
									</div>

									
								</div>
							</div>

						</div>
						<br />
						<br />
						<br />
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<form:button class="btn btn-primary" type="submit">Submit</form:button>
								<form:button class="btn btn-white" type="reset">Reset</form:button>

							</div>
						</div>
						</div>
					<div class="col-lg-4">
				<!-- <div class="ibox float-e-margins">



					
				</div> -->
			</div>
		</div>	
	</div>
	</div>
	</form:form>

	<br />
	<br />
	<br />


<script src="js/ajax.js" type="text/javascript"></script> 
	<!-- JSKnob -->
	<script type="text/javascript">
$(document).ready(function(){
	
	

$('#datepicker1').datepicker().on('changeDate', function(ev){
		$(this).datepicker('hide');

	});


	
	$(":file").filestyle({buttonName: "btn btn-primary"});
});
	
	
function isEmailRegisteredOrnot(email){
		emailid=email.value.trim();
		if(emailid!=''){
		   $.ajax({
		  type: "POST",
		  url: "CheckUserEmailExist.do",
		  data:'email='+emailid,
		  cache: false,
		  success: function(response){
			  	if(response == 'A' || response == 65){
			  	
			  		document.getElementById('email-error').innerHTML="Email already registered!";
			  		email.focus();
			  	}
			  	else{
			  		$('#email-error').empty();
			  	}
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
		 }); 
		}
	}
</script>


<script type="text/javascript">

 $.validator.addMethod("emailpattern", function(value, element) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(value);
}, "please enter valid Email Id");

$(document).ready(function(){

 	
$("#createCompanyform").validate({
	
    rules: {
    	
    	name:{
    		 required: true,
    		 minlength: 4
    		
    	},
    	  email: {
            required: true,
            emailpattern: true
        }, 

        password: { 
          required: true,
             minlength: 6,
             maxlength: 15

        } , 

        phoneNo: { 
            required: true,
            number: true,
             minlength: 10,
             maxlength: 15
       },
      
       type: {
    	   required: true,       
       },
       
       address:{
  		 required: true,
  		 minlength: 10
  		
  		},
  		
  		/* country:{
   		 required: true,
   		},
   		 */
   		state:{
   		 required: true,
   		},
   		
   		city:{
      		 required: true,
      		},
      		
      	pin: {
    	   required: true ,
    	   number: true,
    	   minlength: 6,
           maxlength: 6
       },
       contactPersionName:{
  		 required: true,
  		 minlength: 4
  	},
       
  	file: {
 	      required: false,
 	     extension: "jpg|jpeg|png|gif"
 	    }
         
     },
   
messages:{
	
	 name:{
		 required:"Please enter your name",
		 lettersonly:"Please enter letters only"
	 },
	 contactPersionName:{
		 required:"Please enter your contact Person name",
		 lettersonly:"Please enter letters only "
	 },
	email:{
		
		 required: "Please enter  Email Id",
			email:"Please enter valid Email Id"
				
		},  
	password: { 
          required:"Please enter the password",
          maxlength:"Please  enter less than 15 characters"

        },
       
    phoneNo: { 
    		required:"Please enter the Mobile No",
    		number:"Please enter Numbers only",
    		minlength:"please enter atleast 10 digits ",
    		maxlength:"please enter atmost 15 digits "
    },
   
  type:{
	  
	  	  required:"Please select Industry type",
  },
  
  state:{
	  
  	  required:"Please select state",
	},
	 city:{
		  
	  	  required:"Please select city",
	},
  
 pin:{
	  
	  	  required:"Please enter pin Code",
	  	  number:"Please enter Number only",
		  minlength:"Please enter correct pin code",
		  maxlength:"Please enter correct pin code"
  },
  file: {
	  extension: "Please select only jpg,jpeg,png,gif format file"
	    }
}

});


});	

</script>

<jsp:include page="footer.jsp"></jsp:include>
</body>





</html>
