<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<title>Jobseeker Register</title>
  <jsp:include page="header.jsp" />

  
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

	<div class="ibox-content">
		<c:if test="${not empty success}">
						<div class="alert alert-success" role="alert" id="alert">
							${success}</div>
					</c:if>
					<c:if test="${not empty fail}">
						<div class=" alert alert-error">
							<strong>Fail!</strong>${fail}</div>
					</c:if>
		<div class="wrapper wrapper-content">
			<div class="container">
				<div class="row">

					<div class="ibox-content">



						<form:form  id="myform" commandName="jobseekerRegisterDTO" class="form-horizontal" action="createRegister.do" enctype="multipart/form-data" method="POST" >

							<h3>
								<b>Create Your Profile Details:</b>
							</h3>
							<br />
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Full Name<font color="red">*</font></label>

									<div class="col-md-4">
										<form:input path="name" name="name" id="name" class="form-control" />
								
									
									
								</div>
										<!-- </div>
							</div>
							
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Email Id<font color="red">*</font></label>

									<div class="col-md-4">
										<form:input path="email"  name="email" id="email" class="form-control" onblur="isEmailRegistered(this)" />
									
									<%-- 
									<span class="error"><form:errors
											path="email" /></span>
									<div id="missing_email_div_msg" style="display: none">
										<font color="red"> Please enter Email Id</font>
									</div>
									<div id="pmissing_email_div_msg" style="display: none">
										<font color="red"> Please enter valid Email Id</font>
									</div> --%>
									
									<div id='email-error' style="color:red;"></div>
								</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Password<font color="red">*</font></label>

									<div class="col-md-4">
										<form:password path="password" name="password" id="inputpassword"
											class="form-control" />
									</div>
								<!-- </div>
							</div>
							
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Confirm Password<font color="red">*</font></label>

									<div class="col-md-4">
										<input type="password" name="confirmPassword" id="confirmPassword"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								 <div class="form-group">
									<label class="col-sm-2 control-label">Location</label>

									<!-- <div class="input-group">  -->
									 <!--  <div class="input-group"> -->
                			<div class=" col-md-4">
									 <form:select id="location" path="location" data-placeholder="Choose a Country..." class="form-control chosen-select" style="width:303px;" tabindex="1" required="true" >
									<c:forEach items="${location}" var="loc">
											<form:option value="${loc.id}">${loc.lname}</form:option>
										
											</c:forEach>
											
										</form:select>
									</div>
								
									<label class="col-sm-2 control-label">Pref
										Location<font color="red">*</font></label>

									<div class="col-md-4">
									
											<form:select path="jobIntrestLocations" name="jobIntrestLocations" id="jobIntrestLocations"
											class="chosen-select" style="width:300px;" multiple="true" tabindex="1"  required="true">
											 <optgroup label="Select Locations"/>
											
											<c:forEach items="${location}" var="loc">
											<form:option value="${loc.id}">${loc.lname}</form:option>
										
											</c:forEach>
										</form:select>
										<label for="jobIntrestLocations" class="error" id="jobIntrestLocations-error"></label>
									</div>
										
								</div>
						
							</div>
								
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Mobile No<font color="red">*</font></label>

									<div class="col-md-4">
										<form:input path="contactNo" name="contactNo" id="contactNo"
											class="form-control" />
											
									
									</div>
								<!-- </div>
							</div>
							
								<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Total Expirence</label>
									<div class="col-md-4">
										<form:input path="totalExp" name="totalExp" id="totalExp"  class="form-control" tabindex="4" />
									</div>
								</div>
							</div>
							
						
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Designation
										<font color="red">*</font></label>

									<div class="col-md-4">
									
											
										<form:input path="designation" name="designation" id="designation" class="form-control" />
										<label for="designation" class="error" id="designation-error"></label>
									</div>
										
								<!-- </div>
						
							</div><br />
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">Key Skills <font color="red">*</font></label>
									  <div class="input-group">
									<div class="col-md-4">
										<form:select path="keySkills" name="keySkills" id="keySkills"
											class="chosen-select" style="width:300px;" multiple="true" tabindex="4" required="true">
											<optgroup label="Select KeySkills">
											<c:forEach items="${skillsList}" var="skil">
											<form:option value="${skil.name}">${skil.name}</form:option>
										
											</c:forEach>
										</form:select>
										<label for="keySkills" class="error" id="keySkills-error"></label>
									</div>
									
									</div>
									
								</div>
							</div>
						
														<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label" >Gender<font color="red">*</font></label>
									<div class="col-md-4">
										<form:radiobutton path="gender"  value="Male"/>Male 
										<form:radiobutton path="gender"  value="Female"/>Female
										<form:radiobutton path="gender"  value="Others"/>Others



									</div>
								<!-- </div> -->
							<!-- </div>
							
							
							<div class="row">
								<div class="form-group"> -->
									<label for="datepicker1" class="col-sm-2 control-label">Date Of birth
										</label>
									<div class="col-md-4">
										<form:input  path="dob" name="dob" placeholder="Date Of Birth"
											id="datepicker1" data-date-format="dd-mm-yyyy"
											class="form-control" />
									</div>
								</div>
							</div>
							
							
							
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Profile pic</label>
									<div class="col-md-4">
										<input type="file" name="profilePicPath" id="profilePicPath" class="filestyle" data-buttonName="btn-primary" />
									</div>
								<!-- </div>
							</div>
							<div class="row">
								<div class="form-group"> -->
									<label class="col-sm-2 control-label">ResumeTitle</label>
									<div class="col-md-4">
										<form:input path="resumeTitle" name="resumeTitle" id="resumeTitle" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-2 control-label">Resume <font color="red">*</font></label>
									<div class="col-md-4">
										<input type="file" name="resumePath" id="resumePath" class="filestyle"  data-buttonName="btn-primary" />
									</div>
									<label class="col-sm-2 control-label"><a id="check" >I  have text  Resume </a></label>
								</div>
								<label  for="resumePath" class="error" id="resumePath-error"></label>
								
								
							</div>
							<!-- <input type="checkbox" id="check"   onchange="valueChanged()"/> -->
							
							
								<div id="textresumebox" style="display: none;">
								<div class="row" >
								<div class="form-group">
									<label class="col-sm-2 control-label">Resume <font color="red">*</font></label>
									<div class="col-md-4">
									
										<form:textarea path="textResume" name="textResume" id="textResume" cols="100" rows="10"></form:textarea>
									</div>
									
									
								</div>
								<input type="text" id="count" name="count" readonly="readonly" style="width:3%">
								<label  for="textResume" class="error" id="textResume-error"></label>
							</div>
							
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="submit" class="btn btn-primary"
										value="create Your Profile" />
									<button class="btn btn-white" id="clear" type="reset">Reset</button>

								</div>
							</div>


						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>



  
    
   

 

<script type="text/javascript">

$(document).ready(function(){
	

	$('#datepicker1').datepicker().on('changeDate', function(ev){
			$(this).datepicker('hide');

		});
});

 $(document).ready(
	    function(){
	        $("#check").click(function () {
	        	 $("#textresumebox").show();
	        });

	    }); 
	    
	    
 function isEmailRegistered(email){
	var emailid=email.value.trim();
	
		if(emailid != '' ){
			   $.ajax({
			  type: "POST",
			  url: "CheckUserEmail.do",
			  data:'email='+emailid,
			  cache: false,
			  success: function(response){
				  	if(response == 'A' || response == 65){
				  	
				  		document.getElementById('email-error').innerHTML="Email already registered!";
				  		email.focus();
				  	}
				  	else
				  		$('#email-error').empty();
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

 $.validator.addMethod("numberdec", function(value, element) {
		var re = /^\d+(\.\d{0,2})?$/; 
		
	    return re.test(value);
	}, "please enter valid Expirience ");
 $.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg != value;
	 }, "Value must not equal arg.");
 jQuery.validator.addMethod( 'passwordMatch', function(value, element) {
	    
	    // The two password inputs
	    var password = $("#inputpassword").val();
	    var confirmPassword = $("#confirmPassword").val();
	    if (password != confirmPassword ) {
	        return false;
	    } else {
	        return true;
	    }

	}, "Password and confirm password Must match");
 
 $.validator.addMethod("birth", function (value, element) {
     var year = value.split('-');
     var d = new Date();
     var n = d.getFullYear();
     if ( value.match(/^\d\d?\-\d\d?\-\d\d\d\d$/) && parseInt(year[2]) <= (n-10) )
         return true;
     else
         return false;
 });
$(document).ready(function(){
	
 	
$("#myform").validate({
	
	 
	
    rules: {
    
    	
    	name:{
    		 required: true,
    		 minlength: 4,
    		 lettersonly:true
    		
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

         confirmPassword: { 
        	 passwordMatch:true
        	
             
        }, 
        gender:{
        	 required: true
        }
        ,
        contactNo: { 
            required: true,
            number: true,
             minlength: 10,
             maxlength: 15
       },
      
       location: {
    	   required: true,
    	   loc: true
           
       },
       jobIntrestLocations:{
    	   valueNotEquals: "default",
    	   minlength: 2
       },
       designation:{
    	   required: true
    	 
       },
       totalExp:{
    	   
       	numberdec:true
       },
       keySkills:{
    	   required: true
    	 
       },
       pin: {
    	   required: false ,
    	   number: true,
    	   minlength: 6,
           maxlength: 6
           
       },
       dob:{
    	   required : false,
    	   birth:true
       },
       profilePicPath: {
 	     	     accept: "jpg|jpeg|png|gif"
 	    },
       resumePath: {
    	   required: function(element) {
               return $("#textResume").val()=='';
           },
    	      extension: "doc|docx|pdf"
    	    },
    	    textResume: {
    	    	   required: function(element) {
    	               return $("#resumePath").val()=='';
    	           },
    	           minlength:150,
    	           maxlength:8000
    	    	    }
    	    
    	    },
   
messages:{
	
	 name:{
		 required:"Please enter your name",
		 lettersonly:"Please enter letters only"
	 },
	email:{
		
		 required: "Please enter  Email Id",
			email:"Please enter valid Email Id"
			
				
	},  
	password: { 
          required:"Please enter the password",
          maxlength:"Please  enter less than 15 characters"

        },
        
        passwordMatch :" Enter Confirm Password Same as Password",
    contactNo: { 
    	required:"Please enter the Mobile No",
    		number:"Please enter Numbers only",
    		minlength:"please enter atleast 10 digits ",
    		maxlength:"please enter atmost 15 digits "
    },
    gender:{
    	required:"Please select gender"
   }
   ,
  location:{
	  
	  required:"Please select location",
		  minlength: "Please select location"
  },
  jobIntrestLocations:{
	  
	  valueNotEquals:"Please select job intrested locations",
		  minlength: "Please select job intrested locations"
  },
  
 pin:{
	  
	  required:"Please enter pin Code",
		  minlength:"Please enter correct pin code",
		  maxlength:"Please enter correct pin code"
  },
  designation:{
	  required:"Please Enter Designation"
  },
  keySkills:{
	   required:"Please select KeySkills"
	 
 },
 totalExp:{
    	numberdec:"Please enter Expirience "
    },
    dob :{
    	 birth:"Please enter Correct Date Of birth "
    },
 profilePicPath: {
	  
	  accept: "Please select only jpg,jpeg,png,gif format file"
	    },
    resumePath: { 
    	required:"Please select the resume file Or text Resume",
        	extension:"Please select only  docx,doc,pdf file"
      },
      textResume: { 
    		 required:"Please input the resume file Or text Resume",
    		 minlength:"minimum 150 characters is required",
    		 maxlength:"maxmum 8000 characters is required"
    		 
     	
   }
 
    
}

});


});	

</script>

<script type="text/javascript">
$('#textResume').on('keyup',function(){
	   $("#count").val($(this).val().length);
	});

</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>




</html>

