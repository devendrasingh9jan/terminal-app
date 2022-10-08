<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Terminals</title>
<link rel="stylesheet" type="text/css" href="/css/toastr.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type="text/javascript" src="/js1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<script type="text/javascript" src="/js1/font.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />

</head>

<body onload="myFunction()">
<div class="preload"><img src="/css/ship-wheel.gif" alt="Loading..." border="0">
</div>
<div class="">

<div  class="darkmode-ignore">

<!-- <button type="button" id="button">Click</button> -->
	
<jsp:include page="header.jsp"></jsp:include>

			<div class="content">
			<div class="container">

							<input class="form-control mb-4" id="tableSearch" type="text"
								placeholder="Type something to search list items">

						</div>
			
			<div class="container" id="tasksDiv">
			<h3 style="color:green"><b>All Requests</b></h3>

				
				<div class="table-responsive">
					<table class="table  table-bordered">

			
							<tr>
								<th style="color:green" class="text-center">User Name</th>
								<th style="color:green" class="text-center">Status</th>
								<th style="color:green" class="text-center">Approve</th>
								<th style="color:green" class="text-center">Reject</th>
								<th style="color:green" class="text-center">Access Role</th>
								<th style="color:green" class="text-center">Mark as Admin</th>
								<th style="color:green" class="text-center">Mark as User</th>
								<th style="color:green" class="text-center">Delete</th>
							</tr>
					

						<tbody id="myTable">
						
							<c:forEach var="usr" items="${users}">
							
								<tr>
									<td style="color:green" class="text-center">${usr.username}</td>
									<td style="color:green" class="text-center">
									
						
										<c:set var="col" value="false" /> <c:if
											test="${col == usr.enabled}">
											<div style="color:black" class="bg-warning text-black">
												<c:out value="Pending" />
											</div>
										</c:if> <c:set var="col" value="true" /> <c:if
											test="${col == usr.enabled}">
											<div style="color:black" class="bg-success text-black">
												<c:out value="Approved" />
											</div>
										</c:if> 
										</td>
										
										<td style="color:green" class="text-center" >
										<a href="/approve-user?id=${usr.username}">
										<c:set var="col" value="true" /> <c:if
											test="${usr.enabled== col}">
											<div onclick="myFunction1();return false;">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
										
										<c:set var="col" value="false" /> <c:if
											test="${usr.enabled== col}">
											<div onclick="">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
										</a> </td>
										
										
										
										<td style="color:green" class="text-center" >
										<a href="/reject-user?id=${usr.username}">
										<c:set var="col" value="false" /> <c:if
											test="${usr.enabled== col}">
											<div onclick="myFunction2();return false;">
											<i class="fa fa-times-circle" aria-hidden="true"></i>
											</div>
										</c:if>
										
										<c:set var="col" value="true" /> <c:if
											test="${usr.enabled== col}">
											<div onclick="">
											<i class="fa fa-times-circle" aria-hidden="true"></i>
											</div>
										</c:if>
										</a> </td>
										
										<td style="color:green" class="text-center">
										 <c:forEach var="usra" items="${usr.authorities}">
										
										 
										 <c:set var="col" value="ROLE_USER" /> <c:if
											test="${col == usra.authority}">
											<div style="color:black" class="bg-warning text-black">
												<c:out value="USER" />
											</div>
										</c:if> <c:set var="col" value="ROLE_ADMIN" /> <c:if
											test="${col == usra.authority}">
											<div style="color:black" class="bg-success text-black">
												<c:out value="ADMIN" />
											</div>
										</c:if> 
										 
										 </c:forEach>
										</td>
											
									<td style="color:green" class="text-center" >
									<c:forEach var="usra" items="${usr.authorities}">
										<a href="/mark-admin?id=${usr.username}">
										<c:set var="col" value="ROLE_ADMIN" /> <c:if
											test="${usra.authority== col}">
											<div onclick="myFunction3();return false;">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
										
										<c:set var="col" value="ROLE_USER" /> <c:if
											test="${usra.authority== col}">
											<div onclick="">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
										</a> 
										</c:forEach>
										</td>
										<td style="color:green" class="text-center" >
										<c:forEach var="usra" items="${usr.authorities}">
										<a href="/remove-admin?id=${usr.username}">
										<c:set var="col" value="ROLE_USER" /> <c:if
											test="${usra.authority== col}">
											<div onclick="myFunction4();return false;">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
										
										<c:set var="col" value="ROLE_ADMIN" /> <c:if
											test="${usra.authority== col}">
											<div onclick="">
											<i class="fa fa-check" aria-hidden="true"></i>
											</div>
										</c:if>
											
											
										</a> </c:forEach></td>
										
										<td class="text-center"><a href="/delete-user?id=${usr.username}">
										<i class="fa fa-trash-o" aria-hidden="true" 
											onclick=""> </i></a>
											
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


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script type="text/javascript" src="/js/script.js"></script>
	<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script src="/js/toastr.min.js"></script>
<script type="text/javascript" src="/js1/darkmode-js.min.js"></script>
<script type="text/javascript" src="/js1/font.js"></script>
<link rel="stylesheet" type="text/css" href="/css1/font-awesome.min.css" />
<script
src="/js1/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
    $(".preload").fadeOut(2000, function() {
        $(".content").fadeIn(1000);        
    });
});

function myFunction1() {
  alert("User Already Approved");
}

function myFunction2() {
	  alert("User Already Disabled");
	}
function myFunction3() {
	  alert("Admin role Already assigned");
	}	
function myFunction4() {
	  alert("Admin role Already removed");
	}	
/* function insertText () {
	var td1 = document.getElementById('td1');
    var text = document.createTextNode("some text");
    td1.appendChild(text);
} */
</script>
  <script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
</script>
</body>
</html>