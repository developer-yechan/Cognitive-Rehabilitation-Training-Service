<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
      $("#btn").click(function(){
         $.ajax({
            url : "/myapp/memberListJson.do",
            type : "get",
            dataType : "json",
            success : resultHtml,
            error : function(){ alert("error"); }
         });
      });     
  });
  function resultHtml(data){
     //alert(data);
     var html="";
     html+="<table class='table table-bordered'>";
     html+="<tr>";
     html+="<td>번호</td>";
     html+="<td>아이디</td>";
     html+="<td>비밀번호</td>";
     html+="<td>이름</td>";
     html+="<td>나이</td>";
     html+="<td>전화번호</td>";
     html+="<td>이메일</td>";
     html+="</tr>";
     $.each(data, function(index, obj){
        html+="<tr>";
        html+="<td>"+obj.num+"</td>";
        html+="<td>"+obj.id+"</td>";
        html+="<td>"+obj.pass+"</td>";
        html+="<td>"+obj.name+"</td>";
        html+="<td>"+obj.age+"</td>";
        html+="<td>"+obj.phone+"</td>";
        html+="<td>"+obj.email+"</td>";
        html+="</tr>";        
     });     
     html+="</table>";     
     $("#list").html(html);
   }
</script>
</head>
<body>
<input type="button" value="리스트가져오기(Ajax)" id="btn">
<hr>
<div id="list"></div>
</body>
</html>