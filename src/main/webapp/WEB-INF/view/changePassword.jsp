<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.form-gap {
	padding-top: 70px;
}


  input {

    padding: 8px 8px;
    width: 288px;
    margin-left: 10px;
  }


</style>


<title>Terminals</title>
</head>
<body>
	<div class="form-gap"></div>
	<div align="center" class="container">
		<div class="">
			<div class="col-sm-4 col-md-offset-4">
			<form onSubmit = "return checkPassword() && checkOTP()" id="form" role="form" autocomplete="off" class="form" method="post" action="changed">
			 <input type="hidden" id="text" name="email" value="${email}"  placeholder="email address" class="form-control">
				
				<input type="hidden" value="${randomNo}" name="otp1" id="otp1">
				
				<label><b>Verification Code</b></label>
				<div class="form-group pass_show">
					<input type="text" value="" class="form-control" required="required" name="otp2" id="otp2"
						placeholder="Verification Code Sent to Phone">
				</div>
				<br>
				<label><b>New Password</b></label>
				<div class="form-group pass_show">
					<input type="password" value="" class="form-control" required="required" name="password1" id="password1"
						placeholder="New Password">
				</div>
				<br>
				<label><b>Confirm Password</b></label>
				<div class="form-group pass_show">
					<input type="password" value="" class="form-control" required="required" name="confirm_password" id="confirm_password" 
						placeholder="Confirm Password">
				</div>
				<br>
				<div class="form-group">
					<input name="recover-submit"
						class="btn btn-lg btn-primary btn-block" value="Reset Password" onclick = ""
						type="submit">
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	function checkPassword() { 
		
		password1 = document.getElementById("password1").value;
        password2 = document.getElementById("confirm_password").value; 
        

     // If password not entered 
        if (password1 == '') 
            alert ("Please enter Password"); 	
              
        // If confirm password not entered 
        else if (password2 == '') 
            alert ("Please enter confirm password"); 
              
        // If Not same return False.     
        else if (password1 != password2) { 
            alert ("\nPassword did not match: Please try again...") 
            return false; 
        } 

        // If same return True. 
        else{ 
            //alert("Password Match: Welcome!") 
            return true; 
        } 
    } 
	
	
	function checkOTP() { 
		password1 = document.getElementById("otp1").value;
        password2 = document.getElementById("otp2").value; 

        // If confirm password not entered 
        if (password2 == '') 
            alert ("Please enter Verfication Code"); 
              
        // If Not same return False.     
        else if (password1 != password2) { 
            alert ("\nVerfication Code did not match: Please try again...") 
            return false; 
        } 

        // If same return True. 
        else{ 
            //alert("Password Match: Welcome") 
            return true; 
        } 
    } 
	
	</script>
</body>
</html>
