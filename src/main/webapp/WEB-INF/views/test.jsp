<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src = "resources/js/jquery-3.6.0.min.js"></script>
    <script src ="scripts.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel ="preconnect" href="https://fonts.gastatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <style type="text/css">
    
    body{
                background-color: #eef0ed;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
    .main8 {
        background-color:#d7e0e7;
        width :80%;
        height: 750px;
        margin:0px auto;
        margin-top: 60px;
        border-radius: 50px;
        }
    .left {
    background-color: #a9c5db;
    width: 30%;
    height: 550px;
    position: absolute;
    left:15%;
    top: 20%;
    border-radius: 50px;
    color:#d7e0e7;
    
}
    .left:hover{
        background-color: #8db4d1;
        color:#d7e0e7;

    }
.right {
    background-color: #a9c5db;
    width: 30%;
    height: 550px;
    position: absolute;
    left: 55%;
    top: 20%;
    border-radius: 50px;
    color:#d7e0e7;
}
    .right:hover{
        background-color: #8db4d1;
        color:#d7e0e7;  
    }
#question{
    font-size:6vw;
    position: relative;
    top:35%;
    left:17%;
    color:#d7e0e7;
    font-family: 'Do Hyeon', sans-serif;
}
#result{
    font-size:6vw;
    position: relative;
    top:35%;
    left:17%;
    color:#d7e0e7;
    font-family: 'Do Hyeon', sans-serif;
}
.p_main{
    font-size:2.5vw;
    margin-left: auto;
    margin-right:auto;
    
}
.logout{
    margin-left: 60px;
    width: 80%;
    background-color: #8db4d1;
    color:#d7e0e7;
    border-radius:10px;
    border:none;
    font-size:1.5vw;
    font-family: 'Do Hyeon', sans-serif;
}
.logout:hover{
   background-color: #eef0ed;
    color :#8db4d1
}
.p_main{
    position: relative;
    font-size:1.5vw;
    top:40px;
    font-family: 'Do Hyeon', sans-serif;
    
    
}

.p_name{
    margin-top:40%;
    
    }
.col-md-auto{
	font-size: 40px;
}
    
</style>


</head>
<body>
    <div class="main8">
        <div class="p_main container">
            <div class="row justify-content-md-center">
              <div class="col col-lg-2">
                </div>
              <div class="col-md-auto">
                <p class ="p_name"data-aos="flip-down" data-aos-duration="1500" class="left">${patientName}님 아직 훈련을 하지 않으셨습니다.</p>
              </div>
              <div class="col col-lg-2 pull-right">
                <a href="/patient/home"><input class ="logout"  data-aos="flip-down" data-aos-duration="1500"type="button" value="돌아가기"></a>
              </div>
            </div>
         </div>
        
 
        

    </div>

    <script src = "resources/js/jquery-3.6.0.min.js"></script>
    <script src = "scripts.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <script>
        AOS.init();
    </script>
</body>
</html>