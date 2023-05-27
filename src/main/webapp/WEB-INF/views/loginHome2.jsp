<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <style>

    
    body{
            background-color: #eef0ed;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    .main {
    background-color:#eef0ed;
    width :85%;
    height: 700px;
    margin:0px auto;
    margin-top: 100px;
    border-radius: 50px;
    }
    
    .login_img{
    width :15%;
    height: 25%;
    position: absolute;
    left: 18%;
    top : 150px;
    }
    .login_text{
        margin-top: 140px;
        margin-left: 21%;
        font-size:3.0vw;
    }

    .vl {
    border-left: 2px solid grey;
    height: 80%;
    border-style :dotted;
    position: absolute;
    left: 50%;
    top: 10%;
    }
    
    .login_page1{
    background-color:#eef0ed;
    width :40%;
    height: 40%;
    position: absolute;
    left: 55%;
    top: 35%;
    }
    .login_page2{
    background-color:#eef0ed;
    width :40%;
    height: 40%;
    position: absolute;
    left: 55%;
    top: 35%;
    }

.radio{
    width :150%;
    height: 30%;
}
#radio{
    position: absolute;
    left: 56%;
    top: 20%;
    width :38%;
    height: 15%;
}
#radio1{
    width: 5%;
    height: 20%;
}

.fade-in-box {
  animation: fadein 3s;
  -moz-animation: fadein 3s; /* Firefox */
  -webkit-animation: fadein 3s; /* Safari and Chrome */
  -o-animation: fadein 3s; /* Opera */
}
@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
.btn{
    width :80%;
    height: 40%;
    background-color: grey;
    color:#fff;
    font-size: 90%;
    border-radius:10px;
    margin-top: 30px;
    border:none;
}
.btn:hover{
   background-color: white;
    color :grey;
}
.member form-control{
    width: 200%;
}

.member{
    border :none;
    background-color:#eef0ed;
    border : 1px solid grey;
    width: 300%;
    margin-top:20px;
    margin-left:20%;
}
.doc{
    border :none;
    background-color:#eef0ed;
    border : 1px solid grey;
    width: 400%;
    margin-top:20px;
    margin-left:20%;
}
.doctor{
    width :100%;
    height: 80%;
    background-color: grey;
    color:#fff;
    font-size: 90%;
    border-radius:10px;
    border:none;
    margin-left:11%;
    margin-top:10%
}
.doctor:hover{
   background-color: white;
    color :grey;
}
.join{
    width :90%;
    height: 80%;
    background-color: grey;
    color:#fff;
    font-size: 90%;
    border-radius:10px;
    border:none;
    margin-top:8%;
    margin-left:18%;
}
.join:hover{
   background-color: white;
    color :grey;
}
.login_plz{

    font-size: 150%;
    margin-left: 13%;
    font-size:1.5vw;
}
.errorMessage{
    width : 400%;
    display : block;
    color : red;
}

    </style>


    
    
</head>
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <div class="container-fluid">
        <img style="width:125px; height:62.5px" class="navbar-brand" href="#" src="../../resources/images/lastlogo.png"/>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
          </ul>
        </div>
      </div>
    </nav>
  </header>
<body>
    <script type="text/javascript" src="../../resources/js/login.js"></script>
    
    <div class="main" data-aos="fade-up" data-aos-duration="500">
        <div class="radio">
            <table id ="radio">
                <tr>
                    <td>
                        <input id= "radio1" type="radio" name="tp_cd" value="1" checked="checked" > 회원
                        <input id="radio1" type="radio" name="tp_cd" value="2" display-4>치료사
                    </td>
                </tr>
            </table>
            
        </div>
        <div>
            <img class="login_img" src="../../resources/images/login.png">
            <h2 class="login_text display-4">LOGIN</h2>
            <div>
            <p class="login_plz h5 display-4" data-aos="flip-up" data-aos-duration="2500">저희 페이지에 오신것을 환영합니다.</p>
        </div>
        </div>
        <div class="vl"></div>
        <div class="login_page1 fade-in-box" >
            <div class = "login">
                <form action="/patient/home" method="post" class="row gx-3 gy-2 align-items-center">
                    <table>
                        <tr>
                            <td>
                                <div class="col-sm-3">
                                    <input type="text" class="member form-control" id="specificSizeInputName"placeholder="회원 고유 번호" name="pat_id">
                                  </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-auto">
                                	 
                                	 <button onclick="faceRecognition()" type="button" class="btn btn-primary continue" style="width:75%; margin-left: 5%;">로그인</button>

                                    
                                    </div> 
                                  
                            </td>
                        </tr>
                    </table>
                  </form>
        </div>
    </div>

        <div style="display: none;" class="login_page2 fade-in-box" >
            <div class = "login">
                <div>
                <spring:hasBindErrors name="loginDto">
                    <c:if test="${errors.hasGlobalErrors()}">
                        <strong class="errorMessage">${errors.getGlobalError().defaultMessage}</strong>
                    </c:if>
                </spring:hasBindErrors>
                </div>
                <form:form
                 modelAttribute="loginDto"
                 action="/doctor/login"
                 method="post">
                    <table style="width:70%">
                        <tr>
                            <td colspan="2">
                                <div class="col-sm-3">
                                <form:input type="text" class="doc form-control" id="specificSizeInputName" placeholder="작업치료사 이메일" name="email" path="email"/>
                                <form:errors class="errorMessage" path="email" />
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="col-sm-3" >
                                <form:input type="password" class="doc form-control" id="specificSizeInputName" placeholder="비밀번호" name="password" path="password" />
                                <form:errors class="errorMessage" path="password" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="doctor btn-primary">로그인</button> 
                            </td>
                            <td>
                                <a href="/doctor/signup"><input class ="join" type="button" name ='join' value="회원가입"></a>
                            </td>
                        </tr>
                    </table>
                </form:form>
        </div>
        </div>

        </div>
        <script src = "../../resources/js/jquery-3.6.0.min.js"></script>
        
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
         <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
         
          <script type="text/javascript">

		
		
		
		$(function(){
		    $('input[type=radio][name=tp_cd]').on('click',function(){
		        var chkValue = $('input[type=radio][name=tp_cd]:checked').val();
		        if(chkValue=='1'){
		            $('.login_page1').css('display','block');
		            $('.login_page2').css('display','none');

		        }
		        else if(chkValue=='2'){
		            $('.login_page1').css('display','none');
		            $('.login_page2').css('display','block');
		           
		    }
		    })
		});
</script>
         
         
         
         
</body>
</html>