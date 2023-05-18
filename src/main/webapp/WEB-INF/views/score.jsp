<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    position: absolute;
    left:35%;
    top:20%;
}
#member_name3{
    font-size: 1.5vw;
    margin-left:45%;
    margin-top:3%
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
  margin-left:35%;
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
   
</head>
<body>
    <div id="result_page">
        <header class="header">
            <h2>인지재활훈련 결과</h2>
        </header>
        <div id="check">
            <div class ="col-md-12">
                <p id="member_name3">${score.patient.name}님 결과입니다.</p>
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
                     <!-- 점수 "점수,최대"  stroke-dasharray-->
                          <path class="circle"
                             stroke-dasharray="${score.totalPoint*10}, 100"
                             d="M18 2.0845
                                 a 15.9155 15.9155 0 0 1 0 31.831
                                a 15.9155 15.9155 0 0 1 0 -31.831"
                />
                         <text x="18" y="20.35" class="percentage">${score.totalPoint*10}점</text>
                         </svg>
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
                            <td class="tg-c3ow">${score.orientation}</td>
                            <td class="tg-c3ow">${score.memory}</td>
                            <td class="tg-c3ow">${score.calculation}</td>
                            <td class="tg-c3ow">${score.concentration}</td>
                            <td class="tg-c3ow">${score.problemSolving}</td>
                            <td class="tg-c3ow">${score.totalPoint}</td>
                          </tr>
                        </tbody>
                        </table>
                </div>
            </div>
            <footer id="back">
                <a href="/patient/home"><input class ="return" type="button" value="뒤로가기"></a>
            </footer>
        </div>

    <script src = "../../resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>