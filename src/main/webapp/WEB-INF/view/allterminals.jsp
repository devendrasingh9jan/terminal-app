
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
<script type="text/javascript" src="/js/script.js"></script>
<script type="text/javascript" src="/js1/font.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
<style>
.div-to-align {
	width: 75%;
	padding: 40px 20px;

	/* .... */
}
</style>
</head>

<body onload="myFunction()">
	<div class="preload">
		<img src="/css/ship-wheel.gif" alt="Loading..."
			border="0">
	</div>
	<div class="container">

		<div class="darkmode-ignore">

			<!-- <button type="button" id="button">Click</button> -->

			<jsp:include page="header.jsp"></jsp:include>
			<div class="content">
				<c:choose>
					<c:when test="${mode=='MODE_HOME'}">
						<br>
						<br>
						<br>
						<div class="container" id="homediv">
							<div class="jumbotron text-center">
								<h1>Welcome to access Terminals</h1>
							</div>
						</div>
						<div class="container text-center">
							<a target="_blank"
								href="http://172.18.76.31:10080/apex/apex.jnlp"><img alt=""
								src="/css/N4.png"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank"
								href="http://172.18.76.32:11080/billing/billing.jnlp"><img
								alt="" src="/css/N4 Billing.png"></a>
						</div>
					</c:when>

					<c:when test="${mode=='MODE_ADD'}">
						<div class="container div-to-align ">
							<div class="container text-center">
								<h3>
									<label class="control-label col-md-3" style="color: green">Add
										New Terminal</label>
								</h3>
							</div>
							<form class="form-group row" method="POST" action="saveTerminal">
								<input type="hidden" name="id" value="${trm.tid}" />


								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Terminal
										Name:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="tname" width=280px
											placeholder="Terminal Name" required="required"
											value="${trm.tname}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Name:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="ename"
											placeholder="Environment Name" required="required"
											value="${trm.ename}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Type:</label> <select class="form-control col-md-7" name="etype"
										id="etype" onchange="getSelectValue();">


										<option value="PROD">PROD</option>
										<option value="UAT">UAT</option>
										<option value="TEST">TEST</option>
										<option value="DEV">DEV</option>
										<option value="LOCAL">LOCAL</option> 
									</select>
								</div>


								<div class="col-md-7">
									<input type="hidden" class="form-control" id="myText"
										name="etype" placeholder="Environment Type"
										onclick="getSelectValue();
							
									required"
										value="${trm.etype}" />
								</div>

								<script>
        
        function getSelectValue()
        {
            var selectedValue = document.getElementById("etype").value;
            document.getElementById("myText").value = selectedValue;
            console.log(selectedValue);
        }
        getSelectValue();
        

    </script>

								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Url/IP:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="url"
											placeholder="Url/IP" required="required" value="${trm.url}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">User
										Name:</label>
									<div class="col-md-7">
										<c:set var="col" value="${usr.username}" />
										<c:if test="${trm.username== col}">

											<input type="text" class="form-control" name="username"
												placeholder="User Name" onfocus="this.value=''"
												required="required" value="<c:out value="User-Name" />" />

										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Password:</label>
									<div class="col-md-7">
										<input type="password" class="form-control" name="password"
											placeholder="Password" required="required"
											value="${trm.password}" />
									</div>
								</div>
								<table>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
								</table>
								<div class=" ">
									<div class="control-label col-md-12">
										<input type="submit" class="btn btn-success" value="Submit" />
									</div>
								</div>

							</form>
						</div>

					</c:when>

					<c:when test="${mode=='ALL_TERMINALS'}">
						<div class="container-fluid">

							<input class="form-control mb-4" id="tableSearch" type="text"
								placeholder="Type something to search list items">

						</div>
						
						<div class="">
								
									<h3>
										<b style="color: green">All Terminals</b>
										<button type="button" class="btn btn-success" onclick="exportTableToExcel('tblData')">
										<i class="fa fa-file-excel-o" aria-hidden="true"></i>
										<i class=""></i>Export</button>
										
									</h3>
								
								<div class="control-label col-md-12">
										
									</div>
							
							</div>

						<div class="container" id="tasksDiv">

							<div class="table-responsive">
								<table id="tblData" class="table  table-bordered">


									<tr>
										<th style="color: green" class="text-center">Terminal
											Name</th>
										<th style="color: green" class="text-center">Environment
											Name</th>
										<th style="color: green" class="text-center">Environment
											Type</th>
										<th style="color: green" class="text-center">Environment
											URL/IP</th>
										<th style="color: green" class="text-center">User Name</th>
										<th style="color: green" class="text-center">Password</th>
										<th style="color: green" class="text-center">Delete</th>
										<th style="color: green" class="text-center">Edit</th>

									</tr>


									<tbody id="myTable">

										<c:forEach var="trm" items="${term}">
											<tr>
												<td style="color: green" class="text-center">${trm.tname}</td>
												<td style="color: green" class="text-center">${trm.ename}</td>
												<td style="color: green" class="text-center"><c:set
														var="col" value="PROD" /> <c:if
														test="${col == trm.etype}">
														<div style="color: black" class="bg-danger text-black">
															<c:out value="PROD" />
														</div>

													</c:if> <c:set var="col" value="UAT" /> <c:if
														test="${col == trm.etype}">
														<div style="color: black" class="bg-warning text-black">
															<c:out value="UAT" />
														</div>
													</c:if> <c:set var="col" value="TEST" /> <c:if
														test="${col == trm.etype}">
														<div style="color: black" class="bg-success text-black">
															<c:out value="TEST" />
														</div>
													</c:if> <c:set var="col" value="DEV" /> <c:if
														test="${col == trm.etype}">
														<div style="color: black" class="bg-success text-black">
															<c:out value="DEV" />
														</div>
													</c:if> <c:set var="col" value="LOCAL" /> <c:if
														test="${col == trm.etype}">
														<div style="color: black" class="bg-white text-black">
															<c:out value="LOCAL" />
														</div>
													</c:if></td>

												<td class="text-center" style="user-select: all"
													onclick="CopyToClipboard('${trm.tid}')">
													<div id="${trm.tid}">
														<span style="color: green">${trm.url} </span>
													</div>
												</td>
												<td class="text-center" style="user-select: all"
													onclick="CopyToClipboard('${trm.tid}')"><span
													style="color: green">${trm.username}</span></td>
												<td class="text-center" style="user-select: all"
													onclick="CopyToClipboard('${trm.tid}')"><span
													style="color: green" >
													
													${trm.password}</span></td>

												<td style="color: green" class="text-center"><a
													href="/delete-terminal?id=${trm.tid}"> <i
													 class="fa fa-trash-o" aria-hidden="true" 
											onclick=""> </i></a></td>
												<td class="text-center"><a
													href="/edit-Terminal?id=${trm.tid}" id='mylink'> <i
														class="fa fa-pencil" aria-hidden="true"></i></a></td>



											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</c:when>

					<c:when test="${mode=='MODE_UPDATE'}">
						<div class="container">
							<div class="container text-center">
								<label class="control-label col-md-3" style="color: green"><b><h3>Update
											Terminal</h3></b></label>
							</div>
							<form class="form-horizontal" method="POST"
								action="UpdateTerminal">
								<input type="hidden" name="id" value="${trm.tid}" />

								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Terminal
										Name:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="tname"
											placeholder="Terminal Name" required="required"
											value="${trm.tname}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Name:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="ename"
											placeholder="Environment Name" required="required"
											value="${trm.ename}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Type:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="etype"
											placeholder="Environment Type" required="required"
											value="${trm.etype}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Environment
										Url/IP:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="url"
											placeholder="Url/IP" required="required" value="${trm.url}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">User
										Name:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="username"
											placeholder="User Name" required="required"
											value="${trm.username}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3" style="color: green">Password:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="password"
											placeholder="Password" required="required"
											value="${trm.password}" />
									</div>
								</div>
								<table>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
								</table>
								<div class="form-group ">
									<div class="control-label col-md-12">
										<input type="submit" class="btn btn-success" value="Update" />
									</div>
								</div>
							</form>
						</div>
					</c:when>

				</c:choose>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/script.js"></script>
	<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script src="/js/toastr.min.js"></script>
	<script type="text/javascript" src="/js1/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
			<script src="https://use.fontawesome.com/ff68b7d461.js"></script>
	<script type="text/javascript">

	$(function() {
	    $(".preload").fadeOut(2000, function() {
	        $(".content").fadeIn(1000);        
	    });
	});


	function exportTableToExcel(tableID, filename = 'All_Terminals'){
	    var downloadLink;
	    var dataType = 'application/vnd.ms-excel';
	    var tableSelect = document.getElementById(tableID);
	    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
	    
	    // Specify file name
	    filename = filename?filename+'.xls':'excel_data.xls';
	    
	    // Create download link element
	    downloadLink = document.createElement("a");
	    
	    document.body.appendChild(downloadLink);
	    
	    if(navigator.msSaveOrOpenBlob){
	        var blob = new Blob(['\ufeff', tableHTML], {
	            type: dataType
	        });
	        navigator.msSaveOrOpenBlob( blob, filename);
	    }else{
	        // Create a link to the file
	        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
	    
	        // Setting the file name
	        downloadLink.download = filename;
	        
	        //triggering the function
	        downloadLink.click();
	    }
	}

</script>

</body>
</html>