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
<link href="maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="https://www.datatables.net/release-datatables/extensions/TableTools/css/dataTables.tableTools.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://www.datatables.net/release-datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
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
								
			<table id="example" 
							class="table table-striped table-bordered">

										
										<thead>
            <tr>
                <th>Name</th>
                <th>Today Posted </th>
                  <th> Today Accessed</th>
                <th>Total Posted</th>
                <th>Total Accessed</th>
                <th>Status</th>
                <th>Create date</th>
                <th>Modified date</th>
                 <th>address</th>
            </tr>
        </thead>
 
      
 
        <tbody>
            <tr>
            	
<c:forEach items="${employersList}" var="emp">
              
                <td>${emp.name}</td>
                <td>${emp.todayPostedJobs} </td>
                <td>${emp.todayAccessedResumes} </td>
               
                <td>${emp.totalPostedJobs} </td>
               <td> ${emp.totalAccessedResumes}</td>
                <td>${emp.status}</td>
                <td>${emp.createtsDate}</td>
                 <td>${emp.modifytsDate}</td>
                 <td>${emp.address}<br/>
				${emp.city} ${emp.state}${emp.pin}<br/>
				${emp.country}<br/>
				Contact no : ${emp.phoneNo}<br/>
				Email : ${emp.email} 
		</td>
            </tr>
            </c:forEach>
            </tbody>
										</table>
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


<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable({
      
    	 dom: 'T<"clear">lfrtip',
         tableTools: {
             "sSwfPath": "css/copy_csv_xls_pdf.swf"
         }
        
    });
} );

</script>


</html>
