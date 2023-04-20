<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Simple Example</title>

<script type="text/javascript" src="./scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="./scripts/jquery-ajax.js"></script>


<script type="text/javascript">
	$(document).ready(function() {

		$('#yourname').blur(function() {

			var name = $('#yourname').val();

			$.ajax({

				type : "GET",

				url : "GetUserServlet",

				data : {
					name : name
				},

				success : function(responseText) {

					$('#result').text(responseText);

				}

			});

		});

	});
</script>

</head>

<body>

	<form>

		<h1>Simple example using Ajax with JSP and Servlet</h1>

		Enter your name: <input type="text" id="yourname" /> <br> <br>



		<strong>Hello: </strong>:

		<div id="result"></div>

	</form>

</body>

</html>