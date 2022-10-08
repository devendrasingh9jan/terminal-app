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
<script src="/js/toastr.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>

<script type="text/javascript" src="/js1/darkmode-js.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<script type="text/javascript" src="/js1/jquery.min.js"></script>
<script type="text/javascript" src="/js1/popper.min.js"></script>
<script type="text/javascript" src="/js1/bootstrap.min.js"></script>
<style>
.dropdown:hover>.dropdown-menu{
display:block;
}
.image {
border:1px solid;
border-radius:50%;
width:35px;
height:35px;
}
.image1 {
border-radius:50%;
width:35px;
height:35px;
}
</style>
</head>
<body onload="myFunction()">
	<form action="/upload-Image" method="post" enctype="multipart/form-data">
<!-- <button type="button" id="button">Click</button> -->
	<nav class="navbar navbar-expand-md fixed-top navbar-dark bg-success">
	

<a href="/welcome" class="navbar-brand" onclick="myFunction()"><img alt="" src="/css/ig.png" width="80" height="40" class="d-inline-block align-top"></a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
    
    <li class="nav-item">
        <a href="https://infogain.sharepoint.com/sites/APMTSupport/Lists/Task%20Tracker/APMT%20Tasks.aspx"  target="_blank"
						class="nav-link" onclick="myFunction()">Task Tracker</a>
      </li>
    
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
          Softwares
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">							
          <a class="dropdown-item" target="_blank" href="https://maersk.service-now.com/nav_to.do?uri=%2Ftask_list.do%3Fsysparm_userpref_module%3D2ccb50dfc61122820032728dcea648fe%26sysparm_query%3Dassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Estate%2521%253D-5%255Esys_class_name%253Dchange_request%255Estate%253C%253D6%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Estate%2521%253D-5%255Esys_class_name%253Dincident%255Estate%253C6%255EORstate%253D8%255EORstate%253D9%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Esys_class_name%253Dsc_req_item%255EORsys_class_name%253Dproblem_task%255Estate%253C%253D3%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Esys_class_name%253Dproblem%255Estate%253C8%255Estate%2521%253D4%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Esys_class_name%253Dsc_task%255Estate%253C3%255EORstate%253D8%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Esys_class_name%253Dsn_si_task%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255Esys_class_name%253Dsn_si_incident%255ENQsys_class_name%253Dchange_task%255Eassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Eactive%253Dtrue%255ENQassignment_groupDYNAMIC943a1828d8b87100ff80e65e18e39f3c%255Esys_class_name%253Dcert_task%255Eactive%253Dtrue%255EEQ%26sysparm_clear_stack%3Dtrue" 
					class="nav-link"><img src="/css/ServiceNow.png" alt="ServiceNow" width="25"> ServiceNow</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" target="_blank" href="https://ctxportal.vdi.maersk.com/vpn/index.html" 
					class="nav-link"><img src="/css/Citrix.png" alt="Citrix" width="25"> Citrix</a>
		<div class="dropdown-divider"></div>			
          <a class="dropdown-item" target="_blank" href="https://maersk-digital.aha.io/bookmarks/idea_grids/6758399422400224165/6782068581895331200?product_id=N4CS" 
					class="nav-link"><img src="/css/aha.png" alt="Aha!" width="35"> Aha!</a>
		<div class="dropdown-divider"></div>			
          <a class="dropdown-item" target="_blank" href="https://apmt.my.workfront.com/login?nextURL=%2Fhome" 
					class="nav-link"><img src="/css/workfrontImg.png" alt="Workfront" width="35"> Workfront</a>			
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" target="_blank" href="http://svnserver.igglobal.com:3326/svn/IAS/trunk/APMT Core" 
					class="nav-link"><img src="/css/svn.jpg" alt="SVN" width="25"> SVN</a>
        </div>
      </li>	
      
      
      <li class="nav-item">
			<c:set var="col" value="USER" /> <c:if
											test="${col == Role}">
											<div>
												<c:out value=" " />
											</div>
										</c:if> 
						<c:set var="col" value="ADMIN" />					
										<c:if
											test="${col == Role}">
											<div>
												<a href="/admin"
						class="nav-link" onclick="myFunction()"><c:out value="ADMIN" /></a>	
											</div>
										</c:if> 
      </li>
      
      <li class="nav-item">
        <a href="/addTerminal"
						class="nav-link" onclick="myFunction()">Add Terminal</a>
      </li>
      <li class="nav-item">
        <a href="/showTerminals" class="nav-link" onclick="myFunction()">All Terminals</a>
      </li>
      
      <li class="nav-item">

						
						<c:set var="col" value="USER" /> <c:if
											test="${col == Role}">
											<div>
												<c:out value=" " />
											</div>
										</c:if> 
						<c:set var="col" value="ADMIN" />					
										<c:if
											test="${col == Role}">
											<div>
												<a href="/logs"
						class="nav-link" onclick="myFunction()"><c:out value="Logs" /></a>	
											</div>
										</c:if> 
      </li>
      
		<li class="nav-item">
        <a class="nav-link " href="/profile">
        <img class="image" alt="${firstname}" src="data:image/png;base64,${image}">
        </a>
          
      </li>

      
       <li class="nav-item">
        <a href="/performlogout" 
						class="nav-link" onclick="myFunction()"><img class="image1" alt="Logout"  src="/css/logout.png"></a>
      </li>
      
    </ul>
    

  </div>
</nav>
    	 <jsp:include page="dark.jsp"></jsp:include>
   <div class="theme-switch">
    <a href="#" data-toggle="tooltip" title="Dark/Bright"></a>
 <div class="switch">
 </div>
 </div>

  
<script type="text/javascript" src="/js/script.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(".theme-switch").on("click",()=>{
	$("body").toggleClass("light-theme");
	$("div.section").toggleClass("light-color");
	})
</script>
  </form>
</body>
</html>