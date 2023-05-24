<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel ="preconnect" href="https://fonts.gastatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <style>
    body{
        background-color: #eef0ed;;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
    }
    .main {
    background-color:whitesmoke;
    width :40%;
    height: 600px;
    margin:0px auto;
    margin-top: 50px;
    top: 5%;
    border-radius: 50px;
    }
    .underline0{
        border :none;
    background-color: #c5c8c3a6;
    border : none;
    border-radius: 10px;
    width:90%;
    font-size:1.9vw;

    }
    table{
        width: 90%;
        position: absolute;
        top:15%;
        left:7%;
        font-size:1.5vw;
        
    }
    .submit3{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    position: absolute;
    left: 18%;
    top:500px;
    font-size:1.5vw;
    border-radius:10px;
    border :none;
    font-family: 'Do Hyeon', sans-serif;
}
.submit3:hover{
   background-color: #eef0ed;
    color :grey;
}
#d_join{
    font-size:2.5vw;
    margin-top: 20px;
    margin-bottom: 20px;
    position: absolute;
    left:40%;
    font-family: 'Do Hyeon', sans-serif;
}
table p{
   margin-bottom: 15px;
}
.return{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    position: absolute;
    left: 51%;
    top:500px;
    font-size:1.5vw;
    border-radius:10px;
    border :none;
    font-family: 'Do Hyeon', sans-serif;
}
.return:hover{
   background-color: #eef0ed;
    color :grey;
}
    

    </style>
    
</head>

<body>
    <div class="main"data-aos="fade-up" data-aos-duration="500">
        <p id="d_join" data-aos="flip-up" data-aos-duration="1500">회원가입</p>
        <form action="/doctor/signup" method="post">
            <table>
                <tr>
                    <td>
                        <p>이메일</p>
                    </td>
                    <td>
                        <p>비밀번호</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="underline0" type="text" name="email" />
                    </td>
                    <td>
                        <input class="underline0" type="password" name="password" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>이름</p>
                    </td>
                    <td>
                        <p>전화번호</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="underline0" type="text" name="name" />
                    </td>
                    <td>
                        <input class="underline0" type="text" name="phoneNumber" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <p>소속</p>
                    </td>

                </tr>
                <tr>
                    <td>
                        <input class="underline0" type="text" name="organization" />
                    </td>
                </tr>
            </table>
            <input class ="submit3" type="submit" value="회원가입">
            <a href="/login"><input class ="return" type="button" value="뒤로가기"></a>
        </form>
    </div>

    <script src = "jquery-3.6.0.min.js"></script>
    <script src = "scripts.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>