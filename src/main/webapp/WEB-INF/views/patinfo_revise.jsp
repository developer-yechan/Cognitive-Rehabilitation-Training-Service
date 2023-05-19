
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel ="preconnect" href="https://fonts.gastatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
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
    height: 800px;
    margin:0px auto;
    margin-top: 25px;
    border-radius: 50px;
    }
    .underline0{
    border :none;
    background-color: #c5c8c3a6;
    border-radius: 10px;
    width:90%;
    font-size:1.9vw;

    }
      .underline0.hidden {
       visibility : hidden;
        }
    .table1{
        width: 70%;
        position: absolute;
        top:15%;
        left:18%;
        font-size:1.5vw;
        font-family: 'Do Hyeon', sans-serif;
    }
    .submit3{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    position: absolute;
    left: 18%;
    top:720px;
    font-size:1.5vw;
    border-radius:10px;
    border :none;
    font-family: 'Do Hyeon', sans-serif;
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
    top:720px;
    font-size:1.5vw;
    border-radius:10px;
    border :none;
    font-family: 'Do Hyeon', sans-serif;
}
.return:hover{
   background-color: #eef0ed;
    color :grey;
}
#d_join{
    font-size:3.0vw;
    position: absolute;
    left:35%;
    margin-top: 5%;
    font-family: 'Do Hyeon', sans-serif;
}
.table1 p{
   margin-top: 10px;
   margin-bottom: 10px;
}
.table1 tr{
    margin-top : 5px;
}
    

    </style>


   
</head>
<body>
    <div class="main"data-aos="fade-up" data-aos-duration="500">
        <p id="d_join" data-aos="flip-up" data-aos-duration="1500">회원 수정</p>
        <form action="/patient/update" method="post">
            <table class="table1">
                <tr>
                    <td colspan="2">
                        <p>회원 이름</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="underline0" type="text" name="name" id="name" value="${patient.name}"/>
                    </td>
                </tr>

                <tr>
                    <td style="width:50%">
                        <p>회원 나이</p>
                    </td>
                    <td>
                        <p>성별</p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <input class="underline0" type="number" name="age" id="age" value="${patient.age}" />
                    </td>
                    <td> 
                        <input class="underline0" type="text" name="sex" id="sex" value="${patient.sex}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>작업치료사 아이디</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                        <input class="underline0" type="text" name="doc_id" value="${patient.doctor.email}" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>전화번호</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"> 
                        <input class="underline0" type="text" name="phoneNumber" value="${patient.phoneNumber}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>주소</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="underline0" type="text" name="address" value="${patient.address}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="underline0 hidden" type="text" name="id" value="${patient.id}" readonly/>
                    </td>
                </tr>
            </table>
            <input class ="submit3" type="submit" value="수정하기">
            <a href="/doctor/home"><input class ="return" type="button" value="뒤로가기"></a>
        </form>
    </div>

    <script src = "../../resources/js/jquery-3.6.0.min.js"></script>
    <script src = "scripts.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
       <%--  document.getElementById("name").value= "${patient.name}"; --%>
        <%-- document.getElementById("age").value="${patient.age}"; --%>
       <%--  document.getElementById("sex").value="${patient.sex}"; --%>

    </script>
    <script>
        AOS.init();
    </script>
</body>
</html>