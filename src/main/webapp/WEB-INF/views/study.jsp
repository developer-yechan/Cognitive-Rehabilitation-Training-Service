<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="../../resources/js/canvas.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
body {
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-image: url('../../resources/images/back004.png');
	background-color: whitesmoke;
	
}

.main6 {
	background-color: #bfd2d9;
	width: 100%;
	height: 300px;
}

.quiz_main {
	background-color: #a9c5db;
	width: 1880px;
	height: 1000px;
	position: relative;
	left: 1%;
	top: 1%;
}

/*이동버튼*/
.bttn-jelly, .bttn-3 {
	margin: 0;
	padding: 0;
	border-width: 0;
	border-color: transparent;
	background: transparent;
	font-weight: 400;
	cursor: pointer;
	position: relative;
	font-size: 20px;
	font-family: inherit;
	padding: 10px 25px;
	overflow: hidden;
	border-radius: 50px;
	background: #f5f5f5;
	color: #1d89ff;
	-webkit-transition: all 0.2s cubic-bezier(0.02, 0.01, 0.47, 1);
	transition: all 0.2s cubic-bezier(0.02, 0.01, 0.47, 1);
}

.bttn-jelly:hover, .bttn-jelly:focus, .bttn-3:hover, .bttn-3:focus {
	box-shadow: 0 1px 8px rgba(58, 51, 53, 0.4);
	-webkit-transition: all 0.3s cubic-bezier(0.02, 0.01, 0.47, 1);
	transition: all 0.3s cubic-bezier(0.02, 0.01, 0.47, 1);
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}
/*이전버튼 컬러*/
.bttn-1 {
	background: #bfd2d9;
	color: #fff;
	margin-left: 5px;
	font-family: 'Gothic A1', sans-serif;
}
/*다음버튼 컬러*/
.bttn-2 {
	background: #8db4d1;
	color: #fff;
	margin-left: 10px;;
	font-family: 'Gothic A1', sans-serif;
}

/*문제 듣기버튼 */
.bttn-3 {
	padding: 10px 25px !important;
	left: 20px !important;
	top: 0px !important;
	background: #7aaccd;
	color: #fff;
	font-family: 'Gothic A1', sans-serif;
}

.aa {
	margin-left: 90%;
	position: absolute;
	top: 5%;
	font-size: 1.3vw;
}
/*문제 듣기버튼 */
.bttn-3 {
	padding: 10px 25px !important;
	left: 20px !important;
	top: 0px !important;
	background: #7aaccd;
	color: #fff;
	font-family: 'Gothic A1', sans-serif;
}

.listen {
	margin-left: 5%;
	position: absolute;
	top: 5%;
	font-family: 'Gothic A1', sans-serif;
	font-size: 1.3vw;
}

#canvas {
	background-color: white;
	border: 4px dashed black;
	margin-left: 35%;
	margin-top: 80px;
}

.options {
	margin-left: 39%;
	margin-top: 10px;
}

#clear {
	width: 15%;
	border-radius: 5px;
	height: 34px;
	font-size: 100%;
	appearance: none;
	background-color: #8db4d1;
	color: black;
	vertical-align: middle;
	text-align-last: center;
	border: none;
	font-family: 'Gothic A1', sans-serif;
}

#clear:hover {
	background-color: #bfd2d9;
	color: white;
}

#next_page {
	width: 15%;
	border-radius: 5px;
	height: 34px;
	font-size: 100%;
	appearance: none;
	background-color: #8db4d1;
	vertical-align: middle;
	text-align-last: center;
	color: black;
	border: none;
	font-family: 'Gothic A1', sans-serif;
}

#next_page:hover {
	background-color: #bfd2d9;
	color: white;
}

h1 {
	position: relative;
	left: 800px;
	top: 50px;
	width: 30%;
}

.question {
	height: 500px;
    position: relative;
    left: 14%;
    top: 40px;
    width: 70%;;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<audio id='audio_play1' src='../../resources/audio/${problem.soundPath}'>
</audio>
<script type="text/javascript">
   function play() {
      var audio = document.querySelector('audio');
      if (audio.paused) {
        audio.play();
      } else {
         audio.pause();
         audio.currentTime = 0
      }
   }
</script>



</head>
<body>
	<div class=".col-xl-12 col-lg-12">
		<div class="aa">문제풀이 ${problem.number}/10</div>
		<div class="listen">
			<a>인지영역: </a><a>${problem.category}</a> <a><button class="bttn-3"
					onclick=play()>🔊문제듣기</button></a>

		</div>
	</div>
	<div style="text-align: center;">
		<h1 style="position: relative; left: 25%; top: 50px; width: 55%;">${problem.content}</h1>
	</div>
	<!-- 문제 -->
	<div id="q_n_a">
		<div>
			<!-- 문제 이미지 -->
			<img class="question"
				alt="이미지가 없습니다." src="../../resources/images/${problem.imagePath}">
		</div>
	</div>
	<!--정답작성란-->
	<canvas id="canvas" width="480" height="240"></canvas>
	<div class="options">
		<input type="button" id="clear" value="💨 지우기" />
		<button id="next_page" onclick='canvastoimage()'>다음</button>
	</div>


	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js">
        AOS.init();
    </script>
	<script>
            var canvas;
            var ctx;
            var sx, sy;                      // 현재 위치
            var drawing = false;          // 현재 그리는 중인가?
            window.onload = function() {
                 canvas = document.getElementById("canvas");
                 if (canvas == null || canvas.getContext == null) return;
                 ctx = canvas.getContext("2d");
                 ctx.lineCap="round";
                 // 현재 위치를 저장한다.
                 canvas.onmousedown = function(e) {
                      e.preventDefault();
                      sx = canvasX(e.clientX);
                      sy = canvasY(e.clientY);
                      drawing = true;
                 } 
                 // 현재 위치에서 새로 이동한 곳까지 선을 그린다.
                 canvas.onmousemove = function(e) {
                      if (drawing) {
                           e.preventDefault();
                           ctx.beginPath();
                           ctx.moveTo(sx, sy);
                           sx = canvasX(e.clientX);
                           sy = canvasY(e.clientY);
                           ctx.lineTo(sx, sy);
                           ctx.stroke();
                           ctx.lineWidth = 15;
                      }
                 }
                 // 그리기를 종료한다.
                 canvas.onmouseup = function(e) {
                      drawing = false;
                 }            
            }
            
            // 선 색상 변경
            // var selcolor = document.getElementById("selcolor");
            //selcolor.onchange = function(e) {
            //     ctx.strokeStyle = selcolor.value;
            //}
            // 선 굵기 변경
            //var selwidth = document.getElementById("selwidth");
            //selwidth.onchange = function(e) {
            //     ctx.lineWidth = selwidth.value;
            //}
            // 모두 지우기
            var btnclear = document.getElementById("clear");
            btnclear.onclick = function(e) {
                 ctx.clearRect(0, 0, canvas.width, canvas.height);
            }
            function canvasX(clientX) {
                 var bound = canvas.getBoundingClientRect();
                 var bw = 5;
                 return (clientX - bound.left - bw) * (canvas.width / (bound.width - bw * 2));
            }
            function canvasY(clientY) {
                 var bound = canvas.getBoundingClientRect();
                 var bw = 5;
                 return (clientY - bound.top - bw) * (canvas.height / (bound.height - bw * 2));
            }
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
		integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
		integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>


</body>
</html>