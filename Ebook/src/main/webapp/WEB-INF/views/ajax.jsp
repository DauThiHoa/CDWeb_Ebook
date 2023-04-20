<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo Ajax</title>
<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		
		$('#bttHello').click(function() {
			var fullname = $('#fullname').val();
			
			$.ajax({
				type : 'POST',
				data : {
					fullname : fullname,
					action : 'demo1'
				},
				url : 'AjaxController',
				success : function(result) {
					$('#result1').html(result)
				}
			})
				
		});
		
		

		$('#bttSum').click(function() {
			var number1 = $('#number1').val();
			var number2 = $('#number2').val();
			
			$.ajax({
				type : 'POST',
				data : {
					number1 : number1,
					number2 : number2,
					action : 'demo2'
				},
				url : 'AjaxController',
				success : function(result) {
					$('#result2').html(result)
				}
			})
				
		});
		
	})
	
	
</script>
</head>
<body>
	<fieldset>
		<legend> Demo 1 </legend>

		<form action="">
			Name <input type="text" id="fullname"> 
			<input type="button"
				value="Hello" id="bttHello"> <br> <span id="result1"></span>
		</form>
	</fieldset>




	<fieldset>
		<legend> Demo 2 </legend>

		<form action="">
			Number1 <input type="text" id="number1"><br> 
			Number2 <input
				type="text" id="number2"><br> 
				Result <span id="result2"></span><br>
			<input type="button" value="sum" id="bttSum"> <br>
		</form>
	</fieldset>



</body>
</html>