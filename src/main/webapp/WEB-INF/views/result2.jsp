<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="trainingservice.domain.Score"%>
    <%@page import="java.util.List"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <title>Document</title>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.1/chart.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <style>
        body{
        background-color: #eef0ed;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
    }
         #result_page{
             width: 90%;
             height:800px;
             margin: auto;
             margin-top:100px;
             background-color:whitesmoke;
         }
         .header {
            background-color: #c5c8c3a6;

            
         }
         .header h2{
            font-family: 'Do Hyeon', sans-serif;
            font-size:3vw;
            margin-left:40%;
         
         }
         .return{
    width :30%;
    height: 6%;
    background-color: grey;
    color:#eef0ed;
    font-size:1.5vw;
    border-radius:10px;
    border :none;
    font-family: 'Do Hyeon', sans-serif;
    margin-left:35%;
}
.return:hover{
   background-color: #eef0ed;
    color :grey;
}
#check{
    background-color: whitesmoke;
}
.container{
    margin-left:22%;
}
#member_name3{
    font-size: 1.5vw;
    margin-left:5%;
}
table{
    width:90%;
    height: 10%;
    font-size:1vw;
    margin-top: 5%;
    margin:auto;
    text-align:center;
}
th{
    background-color: #c5c8c3a6;
    border:4px solid whitesmoke;
}
span{
    font-size:1vw;
    margin-left:5%;
}
.radio{
    margin-left:16%;
}
#back{
    margin-top:2%;
}
.logout-button{
  background-color : #212529!important;
  border : 0;
  }
    </style>

   	<%
   	List<Score> scores = (List<Score>) application.getAttribute("scores"); %>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
              <img style="width:125px; height:62.5px" class="navbar-brand" href="#" src="../../resources/images/lastlogo.png">
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                  <li class="nav-item">
                    <form action="/patient/logout" method="post">
                      <button class="nav-link logout-button">로그아웃</button>
                    </form>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
      </header>
    
    <div id="result_page">
        <header class="header">
            <h2>인지재활훈련 결과</h2>
        </header>
        <div id="check">
            <div class ="col-md-12">
                <p id="member_name3">${scores.get(0).patient.name}님 결과입니다.</p>
            </div>
            <div class="radio col-md-8">
                <span><input id = "check1" type = "radio" checked = "checked" name = "choose" onclick="dispList('0')"><label>영역별 점수</label></span>
                <span><input id = "check2" type = "radio" name = "choose" onclick="dispList('1')"><label>요일별 점수</label></span>
            </div>
            
            
        </div>
        <div id="chart">
            <div class="container">
                <div id = "Chart1" class = "row" >
                   <div class = "col-md-9">
                      <canvas id = "myChartOne"></canvas>
                   
                     </div>
                  </div>
                  <div id = "Chart2" class = "row" style = "display:none">
                   <div class = "col-md-9">
                      <canvas id = "myChartTwo"></canvas>
                   </div>
                </div>
             </div>
        </div>
        <div id="chart2">
            <div class="result_table">
                <table class="tg">
                    <thead>
                      <tr>
                        <th class="tg-c3ow">영역</th>
                        <th class="tg-c3ow">지남력</th>
                        <th class="tg-c3ow">기억력</th>
                        <th class="tg-c3ow">계산력</th>
                        <th class="tg-c3ow">집중력</th>
                        <th class="tg-c3ow">문제해결</th>
                        <th class="tg-c3ow">총합</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="tg-c3ow">정답 수</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).orientation}</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).memory}</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).calculation}</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).concentration}</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).problemSolving}</td>
                        <td class="tg-c3ow">${scores.get(scores.size()-1).totalPoint}</td>
                      </tr>
                    </tbody>
                    </table>
            </div>
    
        </div>
        <footer id="back">
            <a href="/patient/home"><input class ="return" type="button" value="뒤로가기"></a>
            <input type="hidden" name="scores" value="${scores}">
        </footer>
    </div>
    <script type="text/javascript">
        let myChartOne = document.getElementById('myChartOne').getContext('2d');

          let barChart = new Chart(myChartOne, {
              type : 'bar', // pie, line, doughnut, polarArea
              data : {
                  labels : ['지남력', ' 기억력', '계산력', '집중력', '문제해결'],
                  datasets :[{
                      label : '회원 영역별 점수',
                      data : [
                    	  <%= scores.get(scores.size()-1).getOrientation()*10 %>,
                          <%= scores.get(scores.size()-1).getMemory()*10 %>,
                          <%= scores.get(scores.size()-1).getCalculation()*10 %>,
                          <%= scores.get(scores.size()-1).getConcentration()*10 %>,
                          <%= scores.get(scores.size()-1).getProblemSolving()*10 %>

                      ]
                  }]
              },
               options : {
                 scales : {
                           x:{
                                },
                           y : {
                                 ticks : {
                                            beginSize : true,
                                            suggesteMin : 0,
                                            max : 100,
                                            stepSize : 10,
                                         }
                                 }
                           } //scales
                          } //options
          })

          let barChartTwo = new Chart(myChartTwo, {
              type : 'line', // pie, line, doughnut, polarArea
              data : {
                  labels : [
                	  <% for(int i=scores.size()-2; i>=0 ;i--){%>
                         <% if(i >0) {%>
                         '<%= scores.get(i).getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))%>',
                         <%}else if(i==0){%>
                         '<%= scores.get(i).getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))%>'
                         <%}%>
                	   <%}%>
                	  ],

                  datasets :[{
                      label : '회원 날짜별 점수',
                      data : [
                            <% for(int i=scores.size()-2; i>=0 ;i--){%>
                             <% if(i >0) {%>
                             <%= scores.get(i).getTotalPoint()*10%>,
                             <%}else if(i==0){%>
                             <%= scores.get(i).getTotalPoint()*10%>
                             <%}%>
                           <%}%>
                      ],
                      backgroundColor : [
                          'red',
                          'rgba(255,255,0,0.5)',
                          '#990000',
                          'skyblue',
                          'dodgerblue',
                      ],
                      borderWidth : 10, // 볼더 크기
                      borderColor : '#8db4d1', // 볼더 색상

                  }]
              }, //data
              options : {
                  scales : {
                     x:{

                     },
                      y : {
                          ticks : {
                              beginSize : true,
                              suggesteMin : 0,
                              max : 100,
                              stepSize : 10,
                          }
                      }

                  } //scales
              } //options

          });
     </script>
      <script type="text/javascript">
        function dispList(selectList){
            var obj1 = document.getElementById("Chart1");
            var obj2 = document.getElementById("Chart2");

            if (selectList == "0"){
                obj1.style.display = "block";
                obj2.style.display = "none";
            } else {
                obj1.style.display = "none";
                obj2.style.display = "block";
            }

        }
            
    </script>
    <script src = "../../resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>