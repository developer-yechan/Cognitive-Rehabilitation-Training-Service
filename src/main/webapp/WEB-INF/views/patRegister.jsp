<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setCharacterEncoding("utf-8"); %>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel ="preconnect" href="https://fonts.gastatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <style>
    body{
        background-color: #eef0ed;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
    }
    
    .main {
    background-color:whitesmoke;
    width :40%;
    height: 840px;
    margin:0px auto;
    margin-top: 50px;
    border-radius: 50px;
    
    }
    .underline0{
    border :none;
    background-color: #eef0ed;
    border : 1px solid grey;
    border-radius: 10px;
    width:90%;

    }
    .table1{
        width: 70%;
        position: absolute;
        top:10%;
        left:18%;
        font-size:1.5vw;
        font-family: 'Gothic A1', sans-serif;
        
    }
    .submit3{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    position: absolute;
    left: 18%;
    top:750px;
    font-size:1.5vw;
    border-radius:10px;
    border:none;
}
.submit3:hover{
   background-color: #eef0ed;
    color :grey;
}
.return{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    position: absolute;
    left: 51%;
    top:750px;
    border-radius:10px;
    border:none;
    font-size:1.5vw;
}
.return:hover{
   background-color: #eef0ed;
    color :grey;
}
#d_join{
    margin-left:35%;
    font-family: 'Do Hyeon', sans-serif;
    font-size:3vw;
}
.table1 p{
   margin-top: 10px;
   margin-bottom: 5px;
}
.table1 tr{
    margin-top : 5px;
}
#radio_sex{
    width: 10%;
}
    

    </style>

</head>
<body>
    <div class="main"data-aos="fade-up" data-aos-duration="500">
        <p id="d_join" data-aos="flip-up" data-aos-duration="1500">회원 등록</p>
        <form action="/patient/register?doctorId=${param.doctorId}" method="post">
            <table class="table1">
                <tr>
                    
                    <td>
                        <p>회원 이름</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="underline0" type="text" name="name" />
                    </td>
                    
                </tr>

                <tr>
                    <td>
                        <p>회원 나이</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="underline0" type="number" name="age" />
                    </td>
                 </tr>
                <tr>
                    <td>
                        <p>성별</p>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <input id ="radio_sex" type="radio" name="sex"checked="checked" value="남"/>남성
                        <input id ="radio_sex"type="radio" name="sex"value="여"/>여성
                    </td>
                </tr>
                <tr>
                    
                <tr>
                    
                </tr>
                <tr>
                    <td>
                        <p>전화번호</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"> 
                        <input class="underline0" type="text" name="phoneNumber" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>주소</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="underline0" type="text" name="address" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>작업치료사 아이디</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="underline0">${param.doctorId}<p/>
                    </td>
                </tr>
            </table>
            <input class ="submit3" type="submit" value="등록">
            <a href="/doctor/home"><input class ="return" type="button" value="뒤로가기"></a>
            
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