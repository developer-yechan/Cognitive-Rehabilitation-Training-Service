<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src = "../../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel ="preconnect" href="https://fonts.gastatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <style type="text/css">
    
    body{
                background-color: #f5f5f5;
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
        }
    .left {
    background-color: #a9c5db;
    width: 30%;
    height: 300px;
    position: absolute;
    left:15%;
    top: 57%;
    color:#d7e0e7;
    border-radius: 10%;
    
}
    .left:hover{
        background-color: #8db4d1;
        color:#d7e0e7;
        

    }
.right {
    background-color: #a9c5db;
    width: 30%;
    height: 300px;
    position: absolute;
    left: 55%;
    top: 57%;
    color:#d7e0e7;
    border-radius: 10%;

}
    .right:hover{
        background-color: #8db4d1;
        color:#d7e0e7;  
    }
#question{
    font-size:6vw;
    position: relative;
    top:30%;
    left:17%;
    color:white;
    font-family: 'Do Hyeon', sans-serif;
}
#result{
    font-size:6vw;
    position: relative;
    top:30%;
    left:17%;
    color:white;
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
    height: 80%;
    background-color: #5d5d5d;
    color : white;
    border:none;
    font-size:1.5vw;
    font-family: 'Do Hyeon', sans-serif;
}
.logout:hover{
   background-color: #eef0ed;
    color :#5d5d5d
}
.p_main{
    position: relative;
    font-size:1.5vw;
    top:40px;
    font-family: 'Do Hyeon', sans-serif;
}

.header1{
    width : 1920px;
    height: 220px;
    background-color: teal;
    background-size: cover;
    background-image: url('../../resources/images/background_img.png');
}

#mainlogo{
			width:400px;
			height:200px;
			margin-left:780px;
			margin-bottom:100px;
}

.p_name{

	font-size:1.9vw;
}
</style>


</head>
<body>
    <div class = "header1"> 
    <img id="mainlogo" alt="" src="../../resources/images/mainlogo.png">
    </div>
    
        <div class="p_main container">
            <div class="row justify-content-md-center">
              <div class="col col-lg-2">
              </div>
              <div class="col-md-auto">
                <h3 class ="p_name"data-aos="flip-down" data-aos-duration="1500" class="left">${pat_name}님 환영합니다.</h3>
              </div>
              <div class="col col-lg-2 pull-right">
                <form action="/logout" method="post">
                  <input class ="logout"  data-aos="flip-down" data-aos-duration="1500"type="submit" value="로그아웃">
                </form>
              </div>
            </div>
        </div>
        <a href="/train"><div data-aos="fade-up" data-aos-duration="1500" class="left">
            <p id="question" data-aos="flip-up" data-aos-duration="2000">훈련 시작</p>
        </div></a>
 
         <a href="/train/score/statistics"><div data-aos="fade-up" data-aos-duration="1500" class="right">
            <p id="result" data-aos="flip-up" data-aos-duration="2000" >결과 보기</p>
        </div></a>

    


    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <script>
        AOS.init();
    </script>
</body>
</html>