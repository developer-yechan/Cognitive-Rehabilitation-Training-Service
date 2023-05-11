<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath }"/>



<!DOCTYPE html>
<html>
<head>

 <!-- jquery 경로 추가 -->
    <!-- <script src="/src/main/webapp/resources/js/canvas.js"></script> -->
    <!-- <script src="/src/main/webapp/resources/js/jquery-3.6.0.min.js"></script> -->
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script src="resources/js/canvas.js"></script>
 <!-- jquery 경로 추가 끝 -->

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
        canvas{border: 1px solid black};
    </style>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
   <form action="http://localhost:9000/draw/predict" method="post">
      <div>
           <canvas id="canvas" width="500" height="500"></canvas>
       </div>
       <div>
          <button onclick="clearCanvas(event, this)"><i class="fas fa-eraser">지우기</i></button>
       </div>
        <div class="object-size">
            <label for="size_font">Font</label>
        </div>
       <input type="button" value = "예측하기" onclick='canvastoimage()'>
    </form>
 
   
</body>
</html>