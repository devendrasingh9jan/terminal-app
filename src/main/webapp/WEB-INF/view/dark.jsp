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
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
<div class="section">
<p>
 </p>
  <div class="theme-switch">
 <div data-toggle="tooltip" title="Dark/Bright"  class="switch">
 <a href="#" data-toggle="tooltip" title="Dark/Bright"></a>
 </div>
 </div>
</div>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
<script>
	$(".theme-switch").on("click",()=>{
	$("body").toggleClass("light-theme");
	$("div.section").toggleClass("light-color");
	})
</script>
</body>
</html>