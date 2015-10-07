<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Company Jobs</title>
<jsp:include page="adminHeader.jsp"></jsp:include>
<script src="js/page.js"></script>
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

.modal-content {
	background-clip: padding-box;
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 4px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
	outline: 0 none;
	position: relative;
}

.modal-dialog {
	z-index: 1200;
}

.modal-body {
	padding: 20px 30px 30px 30px;
	background-color: #FFFFFF;
}

.inmodal .modal-body {
	background: #f8fafb;
}

.inmodal .modal-header {
	padding: 30px 15px;
	text-align: center;
}

.animated.modal.fade .modal-dialog {
	-webkit-transform: none;
	-ms-transform: none;
	-o-transform: none;
	transform: none;
}

.inmodal .modal-title {
	font-size: 26px;
}

.inmodal .modal-icon {
	font-size: 84px;
	color: #e2e3e3;
}

.modal-footer {
	margin-top: 0;
	background-color: #FFFFFF;
}
</style>
<style type="text/css">
#content p {
	text-indent: 20px;
	text-align: justify;
}

#pagingControls ul {
	display: inline;
	padding-left: 0.5em
}

#pagingControls li {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #1B242F;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}
</style>
</head>


<body class="top-navigation gray-bg">
	<div class="ibox-content">
		<div class="wrapper wrapper-content">
			<div class="container">
				<div class="row">

					<div class="ibox-content">



						<div class="timeline-item" id='contents'>
							<div class="row">



								<div class="row">
									<div class="col-lg-12">
										<div class="ibox float-e-margins">
											<div class="ibox-content"> <h5>${employersList.size()} Employers Found</h5> </div>
										</div>
									</div>
									<div class="col-lg-12">

										<div class="ibox-content">
						<c:if test="${employersList.size() gt 0}">
											<table class="table table-hover" width="100%">
												<thead>
													<tr>
														<th>Sl.No</th>
														<th>Name</th> 
														<th width="15%">Today<br>
															<font size="1">Job posted</font> <font size="1">Resume accessed</font>
														 </th>
														<th width="15%">Total<br>
															<font size="1">Job posted</font> <font size="1">Resume accessed</font>
														 </th>
														<th width="15%">Last<br>
															<font size="1">Job posted</font> <font size="1">Resume accessed</font>
														</th>
														<th>Status</th>
														<th>Creates</th>
														<th>Last Updated</th> 
														<th>Contact Details</th>
														
														<!-- <th>Action</th> -->
														
													</tr>
												</thead>
												<tbody>
													<c:set var="slno" value="1"/>
													<c:forEach items="${employersList}" var="emp">
														<tr style="font-size:12px;font-weight:600">
															<td>${slno}</td>
															<td>${emp.name}
															<td>${emp.todayPostedJobs} ${emp.todayAccessedResumes}</td>
															<td>${emp.totalPostedJobs} ${emp.totalAccessedResumes}</td>
															<td>${emp.lastjobPosted} ${emp.lastResumeAccessed}</td>
															<td>${emp.status}</td>
															<td>${emp.createtsDate}</td>
															<td>${emp.modifytsDate}</td>
															<td>${emp.address},<br/>
																${emp.city},${emp.state}-${emp.pin},<br/>
																${emp.country}<br/>
																Contact no : ${emp.phoneNo}<br/>
																Email : ${emp.email} 
															</td>
															<%-- <td><a href="updateJob.do?jobId=${job.jKey}"
																class="btn btn-primary"> <i
																	class="fa fa-pencil-square-o"> Edit</i>
															</a> <a onclick="deletecompany(${job.jKey})"
																class="btn btn-danger"><i class="fa fa-trash-o">Delete</i></a>
															</td> --%>
														</tr>
														<c:set var="slno" value="${slno+1}"/>
													</c:forEach>
												</tbody> 
											</table></c:if>
											<c:if test="${employersList.size() le 0}">
											<div class="alert alert-danger">Sorry no job Posted</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>
	</div>


</body>
<script src="js/bootstrap.min.js"></script>

<script src="js/bootbox.js"></script>
<script type="text/javascript">

function deletecompany(val){
	
	 bootbox.confirm("Are you sure you want to Delete Job  ?", function(result) { 
			if(result == true){
				var dataString='jobId='+val;
				$.ajax({
					type: "POST",
					url: "jobDeleted.do",
					data: dataString,
					cache: false,
					success: function(){
						alert(val);
						window.location = "getCompanyJobs.do";
						
						}
				
				
			});
			}
			
			
		});
	} 

</script>


</html>
