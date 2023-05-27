<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.82.0">
    <title>Sticky Footer Navbar Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sticky-footer-navbar/">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src = "../../resources/js/jquery-3.6.0.min.js"></script>
      <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
      

    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .table_main{
        background-color:whitesmoke;
        width: 118%;
        height: 630px;
        
        }
        .name_table{
            border-bottom:3px solid grey;
            width: 90%;
            height: 10%;
            margin :auto;
            margin-top : 1%;
            text-align : center;

        }
        .thead{
            height:60px;
            border-bottom:1px solid grey;
            color:gray;
            background-color:whitesmoke;
            text-align: center;
            font-size:1.2vw;
        }
        .thead th{
            padding:10px;
            border:1px;
        }
        .scroll{
            height:70%;
            overflow-x: hidden;
            overflow-y: scroll;
            margin-top:20px;
            margin-right: 3.5938px;
            margin-left: 5.5938px;
        }
        .scroll::-webkit-scrollbar{
            width:20px;
        }
        .scroll::-webkit-scrollbar-thumb{
            background-color: whitesmoke;
            border-radius: 7px;
            background-clip: padding-box;
            border:5px solid transparent;
        }
        .scroll::-webkit-scrollbar-track{
            background-color: grey;
            border-radius:7px;
            box-shadow: insert 0px 0px 5px white;
        }
        .information_table{
            border-collapse: collapse;
            width: 90%;
            height: 10%;
            margin: auto;
            text-align:center;
            
        }
        #tbody{
            height:60px;
            color:grey;
            text-align: center;
            font-size:1vw;
            border :1px;
        }
        .page.container{
            margin-left: 180px;
        }
        .merong{
            margin-top : 7% !important;
            margin-bottom: 2% ;
            margin-left: 43%;
        }
        #search_nav{
            margin-bottom : 1% ;
            
        }
	#pat_id{
      	width:9%;
      	
        text-align: center;
        }
        #pat_name{
        width:7%;
        text-align: center;
        }
        #pat_age{
         width:11%;
        text-align: center;
        }
        
        #pat_gender{
        
       	 width:6%;
         text-align: center;
        
        }
        #pat_phone{
        width:16%;
         text-align: center;
        
        }
        #pat_address{
        width:9%;
         text-align: center;
        
        }
        #pp_date{
        width:20%;
        text-align: center;
        
        
        }
        #pp_totalpoint{
        width:16%;
        text-align: center;
        
        }
        #pat_del{
        width:18%;
        text-align: center;
        }
        body{
        	background-size : cover;
        	background-image : url('../../resources/image/back004.png');
        }
         .logout-button{
            background-color : #212529!important;
            border : 0;
            }
	
        
    </style>
 
    
    <!-- Custom styles for this template -->
    <link href="sticky-footer-navbar.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  </head>
  <body class="d-flex flex-column h-100">
    
<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <img style="width:125px; height:62.5px;" class="navbar-brand" href="#" src="../../resources/images/lastlogo.png"/>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
           <a href="/patient/register?doctorId=${doctorEmail}" class="nav-link active" aria-current="page" href="#">회원등록</a>
          </li>
          <li class="nav-item">
          <form action="/logout" method="post">
            <button class="nav-link logout-button">로그아웃</button>
          </form>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="page container">
    <h1 class="merong">이용자 관리</h1>
    <div id = "search_nav" >
        <form action="/doctor/home" method="get" class="row gx-3 gy-2 align-items-center">
            <div class="col-sm-3">
              <label class="visually-hidden" for="specificSizeInputName">Name</label>
              <input type="text" class="form-control" id="specificSizeInputName" placeholder="회원 고유 번호" name="id">
            </div>
            <div class="col-sm-3">
              <label class="visually-hidden" for="specificSizeInputGroupUsername">Username</label>
              <div class="input-group">
                <input type="text" class="form-control" id="specificSizeInputGroupUsername" placeholder="회원 이름" name="name">
              </div>
            </div>
            <div class="col-sm-3">
              <label class="visually-hidden" for="specificSizeSelect">Preference</label>
              <select class="form-select" id="specificSizeSelect" name="sex">
              <option value="">성별</option>
                <option value="남">남성</option>
                <option value="여">여성</option>
              </select>
            </div>
            <div class="col-auto">
              <button type="submit" class="btn btn-outline-secondary">검색하기</button>
            </div>
          </form>
    </div>
    <div class= "table_main" data-aos="fade-up" data-aos-duration="1500">
        <table class="name_table">
            <tr class="thead">
                <th>번호</th>
                <th>이름</th>
                <th>나이</th>
                <th>성별</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>최종시험 날짜</th>
                <th>최종점수</th>
                <th>삭제</th>
                
            </tr>
        </table>
    <div class="scroll" data-aos="fade-up" data-aos-duration="1500">
        <table class="information_table" id="vo">
        
            
        </table>
    </div>    
    </div>
   
    
  </div>
</main>

<footer class="footer mt-auto py-3 bg-light">
  <div class="container">
    
  </div>
</footer>


    <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
      
       <script>
        AOS.init();
    </script> 
  <script type="text/javascript">

   function deleteFn(pat_id){

	 	$.ajax({
			url:"${ctx}/patient/delete?patientId="+pat_id,
			method : "DELETE",
			success:function(result){
				$('#vo').empty(); //기존 태그 비우기
				drawTable(result);
			}
		});  
		
	}

	
	function drawTable(data){
		let html = '';
		
		/* html += `<tr>
			<td>환자 고유번호</td>
			<td>환자 인름</td>
			<td>환자 나이</td>
			<td>환자 성별</td>
			<td>환자 전화번호</td>
			<td>환자 주소</td>
			<td>최근 검사 날짜</td>
			<td>환자 최종 점수</td>
			<td>삭제</td>
			</tr>`; */
		
		for(let i=0; i<data.length; i++){
			
			html += '<tr>';
			html += '<td id='+"'pat_id'"+'>'+data[i].id+'</td>';
			
			html += '<td id='+"'pat_name'"+'><a href="/patient/update?patientId='+data[i].id+'">'+data[i].name+'</a></td>';
			html += '<td id='+"'pat_age'"+'>'+data[i].age+'</td>';
			html += '<td id='+"'pat_gender'"+'>'+data[i].sex+'</td>';
			html += '<td id='+"'pat_phone'"+'>'+data[i].phoneNumber+'</td>';
			html += '<td id='+"'pat_address'"+'>'+data[i].address+'</td>';

			if(data[i].score.length === 0){
			    html += '<td id='+"'pp_date'"+'>'+'훈련결과가 없습니다.</td>';
				html += '<td id='+"'pp_totalpoint'"+'>'+'훈련결과가 없습니다.</td>';
			 }else{
			    html += '<td id='+"'pp_date'"+'>'+data[i].score[0].date.year+'년 '+data[i].score[0].date.monthValue+'월 '+data[i].score[0].date.dayOfMonth+"일"+'</td>';
				html += '<td id='+"'pp_totalpoint'"+'><a href="/train/doctor/confirm?patientId='+data[i].id+'">'+'<input type="button" value="결과보기"></a></td>';
			 }
			
			
			html += '<td id='+"'pat_del'"+'><input type="button" value="삭제" onclick="deleteFn('+data[i].id+')"></td>';
			
			
			
			html += '<tr>';
		} 


		$('#vo').append(html);
	}    
    $(function(){
    	let data = JSON.parse('${patients}');
    	console.log(data)
    	drawTable(data);
    });
    </script>
     
</body></html>