<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<script type="text/javascript">

faceRecognition();

</script>


<script type="text/javascript">


function faceRecognition(){
	   var num = document.getElementById("specificSizeInputName").value;
	   alert(num)
	   recogRequest(num)
	}

	function sendRequest(num){
	   $.ajax({
	        url: "http://localhost:9500/face/train",
	      data: {
	         data:num
	      },
	        method :"POST", 
	        success: function(result) {
	          alert("success")
	         location.href = "http://localhost:8089/titanic/train_result.jsp?result="+result
	        },
	       error:function(request,status,error){
	          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	      }
	   });
	}


	function recogRequest(num){
	   $.ajax({
	        url: "http://localhost:9500/face/recognition",
	      data: {
	         data:num
	      },
	        method :"POST", 
	        success: function(result) {
	          alert("success")
	         //location.href = "http://localhost:8089/titanic/train_result.jsp?result="+result
	          window.location.href = "patLogin.do?result="+result;
	        },
	       error:function(request,status,error){
	          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	      }
	   });





</script>
</body>
</html>