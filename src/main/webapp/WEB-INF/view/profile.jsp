<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="locale" content="en-US">
<script type="text/javascript" src="/js1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<script type="text/javascript" src="/js/script.js"></script>
<title>Terminals</title>
<style>
.card {
	width: 450px;
	border: none;
	border-radius: 10px;
	position: absolute;
	top: 90%;
	right: 40%;
	
	margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
}

.left {
width: 450px;
  position: absolute;
  width: 300px;
  top: 70%;
  right: 40%;
  margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */

}
.right {
width: 450px;
  position: absolute;
  width: 300px;
  top: 70%;
  right: 18%;
  margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */

}
img {
  border-radius: 50%;
}	
</style>
</head>

<body onload="myFunction()">
	<div class="preload">
		<img src="/css/ship-wheel.gif" alt="Loading..." border="0">
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="content">
	<form action="/upload-Image" method="post" enctype="multipart/form-data" onsubmit="return Validate(this);" >
		<div class="left">
			<input type="file" name="file" class="" required="required">
			
		</div>
		<div class="right">
			
			<button type="submit" class="btn btn-success"  >Submit</button>
		
		</div>
		
		<div class="darkmode-ignore">
			<div class="d-flex justify-content-center">

				<div class="container mt-5 d-flex justify-content-center">
					
					<div class="card">
						
						<div class="d-flex align-items-center">
							
								<img alt="Image"
									src="data:image/png;base64,${image}"
									class="rounded" width="155" height="170">
							
							
							<div class="ml-3 w-100">

								<h4 class="mb-0 mt-0">${firstname} ${lastname}</h4>
								<span>${Role}</span>
								<div>
									<span class="mb-0 mt-0">Email</span> <span class="number1">${user}</span>
								</div>					
							</div>
							
						</div>
						
					</div>
	
				</div>
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".preload").fadeOut(2000, function() {
				$(".content").fadeIn(1000);
			});
		});
		
		
		var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];    
		function Validate(oForm) {
		    var arrInputs = oForm.getElementsByTagName("input");
		    for (var i = 0; i < arrInputs.length; i++) {
		        var oInput = arrInputs[i];
		        if (oInput.type == "file") {
		            var sFileName = oInput.value;
		            if (sFileName.length > 0) {
		                var blnValid = false;
		                for (var j = 0; j < _validFileExtensions.length; j++) {
		                    var sCurExtension = _validFileExtensions[j];
		                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
		                        blnValid = true;
		                        break;
		                    }
		                }
		                
		                if (!blnValid) {
		                    alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
		                    return false;
		                }
		            }
		        }
		    }
		  
		    return true;
		}
	</script>
</body>
</html>



