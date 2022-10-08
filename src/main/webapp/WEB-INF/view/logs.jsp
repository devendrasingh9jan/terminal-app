<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<style>
.right
</style>
</head>

<body onload="myFunction()">
	<div class="preload">
		<img src="/css/ship-wheel.gif" alt="Loading..." border="0">
	</div>
	<div class="">

		<div class="darkmode-ignore">


			<jsp:include page="header.jsp"></jsp:include>

			<div class="content">
				<div class="container">

					<input class="form-control mb-4" id="myInput" onkeyup="myFunction()" type="text" 
						placeholder="Type something to search list items">

				</div>

				<div class="container-fluid" id="tasksDiv" style="padding: 70px;">
					<h3 style="color: green">
						<b>All Changes</b>
					</h3>


					<div class="table-responsive">
						<table id="myTable" class="table  table-bordered"" style="width:1200px">


							<tr>
								<th style="color: green" class="text-center">User</th>
								<th style="color: green" class="text-center">Operation</th>
								<th style="color: green" class="text-center">Change</th>
								<th style="color: green" class="text-center"
									onclick="sortTable(3)">On <i class="fa fa-sort"
									aria-hidden="true"></i></th>


							</tr>


							<tbody id="myTable">

								<c:forEach var="usr" items="${users}">

									<tr>
										<td style="color: green" class="text-center">${usr.uname}</td>
										<td style="color: green" class="text-center" id="operation">
											<c:set var="String" value="${usr.changed}" /> 
											<c:if test="${fn:contains(String, 'updated')}">
												<p>UPDATE</p>
											</c:if> 
											<c:if test="${fn:contains(String, 'deleted an environment')}">
												<p>DELETE</p>
											</c:if> 
											<c:if test="${fn:contains(String, 'added')}">
												<p>ADD</p>
											</c:if> 
											<c:if test="${fn:contains(String, 'rejected')}">
												<p>USER REJECTD</p>
											</c:if> <c:if test="${fn:contains(String, 'approved')}">
												<p>USER APPROVED</p>
											</c:if>
											<c:if test="${fn:contains(String, 'database')}">
												<p>USER REMOVED</p>
											</c:if>
											<c:if test="${fn:contains(String, 'given')}">
												<p>ADMIN PRIVILEGES ASSIGNED</p>	
											</c:if> <c:if test="${fn:contains(String, 'removed')}">
												<p>ADMIN PRIVILEGES REMOVED</p>
											</c:if>
											<c:if test="${fn:contains(String, 'registered')}">
												<p>User Registered</p>
											</c:if>
										</td>
										<td style="color: green">
											 <c:set var="newline" value="<%=\"\n\"%>" />
											
											${fn:replace(usr.changed,newline, "<br />")}  
										</td>
										<td style="color: green" class="text-center">${usr.date}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>




		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".preload").fadeOut(2000, function() {
				$(".content").fadeIn(1000);
			});
		});
		
		function sortTable(n) {
			  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			  table = document.getElementById("myTable");
			  switching = true;
			  //Set the sorting direction to ascending:
			  dir = "asc"; 
			  /*Make a loop that will continue until
			  no switching has been done:*/
			  while (switching) {
			    //start by saying: no switching is done:
			    switching = false;
			    rows = table.rows;
			    /*Loop through all table rows (except the
			    first, which contains table headers):*/
			    for (i = 1; i < (rows.length - 1); i++) {
			      //start by saying there should be no switching:
			      shouldSwitch = false;
			      /*Get the two elements you want to compare,
			      one from current row and one from the next:*/
			      x = rows[i].getElementsByTagName("TD")[n];
			      y = rows[i + 1].getElementsByTagName("TD")[n];
			      /*check if the two rows should switch place,
			      based on the direction, asc or desc:*/
			      if (dir == "asc") {
			        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
			          //if so, mark as a switch and break the loop:
			          shouldSwitch= true;
			          break;
			        }
			      } else if (dir == "desc") {
			        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
			          //if so, mark as a switch and break the loop:
			          shouldSwitch = true;
			          break;
			        }
			      }
			    }
			    if (shouldSwitch) {
			      /*If a switch has been marked, make the switch
			      and mark that a switch has been done:*/
			      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			      switching = true;
			      //Each time a switch is done, increase this count by 1:
			      switchcount ++;      
			    } else {
			      /*If no switching has been done AND the direction is "asc",
			      set the direction to "desc" and run the while loop again.*/
			      if (switchcount == 0 && dir == "asc") {
			        dir = "desc";
			        switching = true;
			      }
			    }
			  }
			}
		
		function myFunction() {
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
	
	</script>

</body>
</html>