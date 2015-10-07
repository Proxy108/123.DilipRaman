<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Subscriprtion</title>


		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
			<script src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
			<script src="http://static.scripting.com/bootstrap/1.4.0/js/bootstrap-modal.js"></script>
			
			<script src="http://static.scripting.com/bootstrap/1.4.0/js/bootstrap-tabs.js"></script>
			<script src="http://static.scripting.com/bootstrap/1.4.0/js/bootstrap-buttons.js"></script>
		 <link href="css/bootstrap1.css" rel="stylesheet"/>
		 <link rel="stylesheet" type="text/css" href="css/style3.css" />
		
</head>
<script>
function writeSidAndAmount(sidAndAmount)
	{
		/* alert(sidAndAmount.value); */
		var arr=sidAndAmount.value.split(",");
		
		document.getElementById("sid").value=arr[0];
		document.getElementById("amount").value=arr[1];
	}
</script>
<style>
.jpbottom_slide 
.pslideiteminnr {
    display: table-cell;
    height: 130px;
    width: 120px;
    font-size: 16px;
    font-weight: 600;
    text-align: center;
    vertical-align: middle;
    color: #FF6C00;
    text-transform: uppercase;
    padding: 0px 5px;
    }
.jpbottom_slide {
    height: 140px;
    padding: 0px 20px;
    border-top: 1px solid #D7D7D7;
    margin-top: 20px;
    position: relative;
    font-family: "Open Sans",sans-serif;
}
.jpbottom_slide .jpslideitem.scnd {
    z-index: 4;
}
.jpbottom_slide .jpslideitem.frth {
    z-index: 2;
}
</style>
		<script>
			$(document).ready(function() {
				$('#tabsDemoDialog').bind('show', function () {
					});
				});
			function closeDialog () {
				$('#tabsDemoDialog').modal('hide');
				};
			function okClicked () {
				document.title = document.getElementById ("xlInput").value;
				closeDialog ();
				};
			</script>
<body>
<h2>Job Posting</h2>
<div class="container1">

<div class="cmp_tblwrap e_lt">
                <div class="cmp_tbl tbl1">
                	<div class="cmp_tblrow th">
                        <div class="cmp_tblcell cell1">Features</div>
						<div class="cmp_tblcell">Quick</div><div class="cmp_tblcell">Premium</div>
                        <div class="cmp_tblcell">Power</div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Job Posting Validity</div>
                        <div class="cmp_tblcell">30 Days</div><div class="cmp_tblcell">60 Days</div>
                        <div class="cmp_tblcell">60 Days</div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Response Management Software (MOHQ)</div>
                        <div class="cmp_tblcell"><div class="cross"></div></div><div class="cmp_tblcell"><div class="tick"></div></div>
                        <div class="cmp_tblcell"><div class="tick"></div></div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Automated Segregation on Relevance</div>
                        <div class="cmp_tblcell"><div class="cross"></div></div><div class="cmp_tblcell"><div class="tick"></div></div>
                        <div class="cmp_tblcell"><div class="tick"></div></div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Company Profile</div>
                        <div class="cmp_tblcell"><div class="cross"></div></div><div class="cmp_tblcell"><div class="tick"></div></div>
                        <div class="cmp_tblcell"><div class="tick"></div></div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Job Bolding</div>
                        <div class="cmp_tblcell"><div class="cross"></div></div><div class="cmp_tblcell"><div class="cross"></div></div>
                        <div class="cmp_tblcell"><div class="tick"></div></div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">JD Character Limit</div>
                        <div class="cmp_tblcell">Unlimited</div><div class="cmp_tblcell">Unlimited</div>
                        <div class="cmp_tblcell">Unlimited</div></div>
                    <div class="cmp_tblrow">
						<div class="cmp_tblcell cell1">Function(s) / Location(s) per inventory</div>
                        <div class="cmp_tblcell">2 X 2</div><div class="cmp_tblcell">2 X 2</div>
                        <div class="cmp_tblcell">2 X 2</div></div>
                    <div class="cmp_tblrow">
                        <div class="cmp_tblcell cell1">Visibility on Monster's Alliances</div>
                        <div class="cmp_tblcell"><div class="cross"></div></div><div class="cmp_tblcell"><div class="cross"></div></div>
                        <div class="cmp_tblcell"><div class="tick"></div></div></div>
                </div>
            </div>
            
            <form action="getsubscription.do" method="post">
            
            <div class="cmp_tblwrap1 e_rt">
            	 <div class="cmp_tbl tbl1">
                	<div class="cmp_tblrow th">
                        <div class="cmp_tblcell">Quantity</div>
                       <div class="cmp_tblcell colr1">Quick Posting</div><div class="cmp_tblcell">Premium Posting</div><div class="cmp_tblcell colr1">Power Posting</div></div>
					<!-- loop start -->
					<c:set var="refreshSent" value="true"/>
					<c:forEach begin="0" end="${quickSubDtoList.size()-1}" var="i">
					
					<c:if test="${refreshSent}">
					
					
					<div class="cmp_tblrow ">
                        <div class="cmp_tblcell">${quickSubDtoList[i].quantity}</div>
						<div class="cmp_tblcell">
							<div class="check_wrap">
                                <div class="e_lt checkbox rad1"><input  type="radio" onclick="writeSidAndAmount(this);" name="posttingType" class="rad" data-class="rad1" value="${quickSubDtoList[i].sid},${quickSubDtoList[i].amount}" checked="checked"></div>
                                <div class="e_lt rupee_symbol other">&#x20B9;</div>
                                <div class="e_lt rupee_txt">${quickSubDtoList[i].amount}</div>
                                <div class="e_clr"></div>
                            </div>
						</div>
						
						
						<div class="cmp_tblcell">
							<div class="check_wrap">
                                <div class="e_lt checkbox rad1"><input type="radio" onclick="writeSidAndAmount(this);" name="posttingType" class="rad" data-class="rad1" value="${premiumSubDtoList[i].sid},${premiumSubDtoList[i].amount}"></div>
                                <div class="e_lt rupee_symbol other">&#x20B9;</div>
                                <div class="e_lt rupee_txt">${premiumSubDtoList[i].amount}</div>
                                <div class="e_clr"></div>
                            </div>
						</div>
						<div class="cmp_tblcell">
							<div class="check_wrap">
                                <div class="e_lt checkbox rad1"><input type="radio" onclick="writeSidAndAmount(this);" name="posttingType" class="rad" data-class="rad1" value="${powerSubDtoList[i].sid},${powerSubDtoList[i].amount}"></div>
                                <div class="e_lt rupee_symbol other">&#x20B9;</div>
                                <div class="e_lt rupee_txt">${powerSubDtoList[i].amount}</div>
                                <div class="e_clr"></div>
                            </div>
						</div>
						
						</div>
						<c:set var="refreshSent" value="true"/>
						</c:if>
						<input type="hidden" name="sid" id="sid" value="8"/> 
					</form>	
					
						</c:forEach>
						</div>
						
	                   
 					 <div class="cmp_tbl tbl2">
                	<div class="cmp_tblrow btnw">
                        <div class="cmp_tblcell">&nbsp;</div>
						<div class="cmp_tblcell">
                        	<!-- <input type="submit" class="buy_btn" value="Buy Now"/> -->
							<!-- <a href="#" class="view_lnk jp_pop" data-id="quick" id="other">View Example</a> -->
                        </div>
						<div class="cmp_tblcell">
                        	<input type="submit" class="buy_btn" value="Buy Now"/>
							<!-- <a  class="view_lnk jp_pop" data-controls-modal="tabsDemoDialog" data-backdrop="true" data-keyboard="true" class="btn danger" onmouseover="sandwich='pastrami';">View Example</a> -->
                        <button data-controls-modal="tabsDemoDialog" data-backdrop="true" data-keyboard="true"  onmouseover="sandwich='pastrami';">View Example</button>
                        </div>
						<div class="cmp_tblcell colr1">
                        	<!-- <input type="submit" class="buy_btn" value="Buy Now"/> -->
						<!-- 	<a  class="view_lnk jp_pop" data-id="power">View Example</a> -->
                        </div>
						</div>
                    </div>
                          </div>
				</form>
				 
	<div class="container1" style="float:left !important;">
	<table border="2">
		<tr><th>Product Name</th><th> Duration </th><th>Rate card</th><th>Action</th></tr>
		<c:forEach items="${packSubDtoList}" var="packSubDto">
		<tr><td>${packSubDto.name}</td><td>${packSubDto.validityDays}</td><td>${packSubDto.amount}</td><td><a href="getsubscription.do?sid=${packSubDto.sid}"> <input type="button" class="buy_btn" value="Buy Now" /></a></td></tr>
		</c:forEach>
	</table>
	</div>
	

		
<div style="display: none;" id="tabsDemoDialog" class="modal hide fade">
				<div class="modal-header">
					<a href="#" class="close">×</a>
					
					</div>
				<div class="modal-body">
					<div class="divDialogElements">
						<ul class="tabs" data-tabs="tabs">
							<li class=""><a href="#home">Home</a></li>
							<li class=""><a href="#profile">Profile</a></li>
							<li class=""><a href="#messages">Messages</a></li>
							<li class="active"><a href="#settings">Settings</a></li>
							</ul>
						<div id="my-tab-content" class="tab-content">
							<div class="tab-pane" id="home">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>Email</span><br>
            			<span>Response</span>
            			</div>
								
								<!-- <div class="circledraw">
            			<span>Logo</span><br>
            			<span>Posting</span>
            			</div>
								
								<div class="circledraw">
            			<span>Logo</span><br>
            			<span>Days</span>
            			</div> -->
								
									</div>
								
							<div class="tab-pane" id="profile">
							
							<img src="images/logo5.jpg" style="float:right; width:95px; margin-right:150px;">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>60</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>Email</span><br>
            			<span>Response</span>
            			</div>
								
								<div class="circledraw">
            			<span>Logo</span><br>
            			<span>Posting</span>
            			</div>
								
								
								</div>
							<div class="tab-pane" id="messages">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								</div>
							<div class="tab-pane active" id="settings">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								</div>
							<div class="tab-pane" id="fat">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								</div>
							<!-- <div class="tab-pane" id="mdo">
								<p><b>WalkIn for Freshers with 60% in B.E/B.Tech</b></p>
								<p><b>Location:Banglore</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								<p><b>Candidate should have one of the skills like JAVA,C,.NET mandatory</b></p>
								
            			<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
							
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>30</span><br>
            			<span>Days</span>
            			</div>
								
								<div class="circledraw">
            			<span>Logo</span><br>
            			<span>Posting</span>
            			</div>
								</div> -->
							</div>
						</div>
					</div>
			 <div class="modal-footer">
					
					</div> 
				</div>
			 	
</body>
</html>
