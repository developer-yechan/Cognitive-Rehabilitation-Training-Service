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
             height:880px;
             margin: auto;
             margin-top:10px;
             border-radius:30px;
             background-color:#d7e0e7
         }
         .header {
            background-color: #bfd2d9;

            
         }
         .header h2{
            font-family: 'Do Hyeon', sans-serif;
            font-size:3vw;
            margin-left:40%;
         
         }
         .return{
    width :30%;
    height: 6%;
    background-color: #8db4d1;
    color:#fff;
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
    background-color: #d7e0e7;
}
.container{
    position: relative;
    left: 55vh;
    bottom: 45vh;
}
#member_name3{
    font-size: 1.5vw;
    margin-left:5%;
}
table{
    width:90%;
    height: 10%;
    font-size:1vw;
    margin-top: 520px;
    margin-left: 5%;
    text-align:center;
}
th{
    background-color: #bfd2d9;
    border:4px solid #d7e0e7;
}
span{
    font-size:1vw;
    margin-left:5%;
}
.radio{
    margin-left:30%;
}
#back{
    margin-top:2%;
}
#chart{
    float: left;
    width:100%;
    height: 10%;
}
/* 원그래프  */    


.single-chart {
  width:28%;
  margin-left:4%;
  justify-content: space-around ;
}

.circular-chart {
  display: block;
  max-width: 70%;
  max-height: 70%;
  margin-top: 15%;
  margin-left: 20%;
}

.circle-bg {
  fill: none;
  stroke: #eee;
  stroke-width: 3.8;
}

.circle {
  fill: none;
  stroke-width: 2.8;
  stroke-linecap: round;
  animation: progress 1s ease-out forwards;
}

@keyframes progress {
  0% {
    stroke-dasharray: 0 100;
  }
}

.circular-chart .circle {
  stroke: #3c9ee5;
}


.percentage {
  fill: #666;
  font-family: sans-serif;
  font-size: 0.5em;
  text-anchor: middle;
}


.percentage {
  fill: #666;
  font-family: sans-serif;
  font-size: 0.5em;
  text-anchor: middle;
}
    </style>
   <% List<Score>scores =(List<Score>) application.getAttribute("scores"); %>
    <% System.out.println("jsp scores = " + scores); %>
</head>
<body>
    <div id="result_page">
        <header class="header">
            <h2>인지재활훈련 결과</h2>
        </header>
        <div id="check">
            <div class ="col-md-12">
            <!-- 여기 아이디 꺼내는게 없어서 일단 에러인데 이름 어디에 저장되어있나요? 이름꺼네는건 따로 만들어야 할것 같아요 그리고 검사를 아직 안해서 점수가 없는 아이디는 어떻게 처리해야 할까요?
            	이거 반복문 돌면서 꺼내자나요 아마도 리스트 안에 있는거 같은데 그럼 리스트안에 점수가 0점이라면 출력이 안되게 조건문 걸면되요
 	잠깐만요           
             -->
                <p id="member_name3">${patientName}님 결과입니다.</p>
            </div>
            <div class="radio col-md-8">
                <span><input id = "check1" type = "radio" checked = "checked" name = "choose" onclick="dispList('0')"><label>영역별 점수</label></span>
                <span><input id = "check2" type = "radio" name = "choose" onclick="dispList('1')"><label>날짜별 점수</label></span>
            </div>
        
        </div>
            <div id="chart">
                  <!-- 총 점수 -->
                     <div class="single-chart">
                         <svg viewBox="0 0 36 36" class="circular-chart blue">
                           <path class="circle-bg"
                              d="M18 2.0845
                                a 15.9155 15.9155 0 0 1 0 31.831
                                a 15.9155 15.9155 0 0 1 0 -31.831"
                />
                     <!-- 점수 "점수,평균"  stroke-dasharray-->
                          <path class="circle"
                             stroke-dasharray="<%=(int)(scores.get(scores.size()-1).getTotalPoint()*10/(scores.size()-1))%>, 100"
                             d="M18 2.0845
                                 a 15.9155 15.9155 0 0 1 0 31.831
                                a 15.9155 15.9155 0 0 1 0 -31.831"
                />
                         <text x="18" y="20.35" class="percentage"><%=(int)(scores.get(scores.size()-1).getTotalPoint()*10/(scores.size()-1))%>점</text>
                         </svg>
                     </div>
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
                <a href="/doctor/home"><input class ="return" type="button" value="뒤로가기"></a>
            </footer>
        </div>


    <script>
        let myChartOne = document.getElementById('myChartOne').getContext('2d');
  
          let barChart = new Chart(myChartOne, {
              type : 'bar', // pie, line, doughnut, polarArea
              data : {
                  labels : ['지남력', ' 기억력', '계산력', '집중력', '문제해결', '총합'],
                  datasets :[{
                      label : '회원 영역별 점수', 
                      data : [
                            <%= scores.get(scores.size()-1).getOrientation()*10 %>,
                            <%= scores.get(scores.size()-1).getMemory()*10 %>,
                            <%= scores.get(scores.size()-1).getCalculation()*10 %>,
                            <%= scores.get(scores.size()-1).getConcentration()*10 %>,
                            <%= scores.get(scores.size()-1).getProblemSolving()*10 %>,
                            <%= scores.get(scores.size()-1).getTotalPoint()*10 %>
                      ]
                  }]
              },
              options :{
              scales : {
                         x:{
                              },
                         y : {
                               max : 100,
                               ticks : {
                                          beginSize : true,
                                          suggesteMin : 0,
                                          stepSize : 10,
                                       }
                               }
                       } //scales
              }
  
  
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
              },
              options : {
                  scales : {
                     x:{

                     },
                      y : {
                             max : 100,
                             min : 0,
                          ticks : {

                              beginSize : true,
                              suggesteMin : 0,
                              stepSize : 10,
                          }
                      }

                  }
              }

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