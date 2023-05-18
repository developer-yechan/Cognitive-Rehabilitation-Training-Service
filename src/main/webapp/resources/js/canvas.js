/**
 * 
 */

// canvas.js
window.onload = function(){
    var canvas = document.getElementById("canvas");
    draw(canvas);
   canvas.lineWidth = 20;
   canvas.strokeStyle = "black"
}
function draw(canvas){
   
    var ctx = canvas.getContext("2d");
    ctx.moveTo(30, 100);
    ctx.lineTo(80, 100);
   //ctx.lineWidth = 20;
    ctx.stroke();
   
}

// canvas.js
var pos = {
   
    drawable: false,
    x: -1,
    y: -1
};
var canvas, ctx;
 
window.onload = function(){
   
    canvas = document.getElementById("canvas");
    ctx = canvas.getContext("2d");
    //ctx.lineWidth = 10;
    canvas.addEventListener("mousedown", listener);
    canvas.addEventListener("mousemove", listener);
    canvas.addEventListener("mouseup", listener);
    canvas.addEventListener("mouseout", listener);
}
 
function listener(event){
    switch(event.type){
        case "mousedown":
            initDraw(event);
            break;
 
        case "mousemove":
            if(pos.drawable)
                draw(event);
            break;
 
        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}

function initDraw(event){
    ctx.beginPath();
   ctx.lineWidth = 10; // 글씨두께
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.moveTo(pos.X, pos.Y);
}
 
function draw(event){
    var coors = getPosition(event);
    ctx.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.stroke();
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
    var x = event.pageX - canvas.offsetLeft;
    var y = event.pageY - canvas.offsetTop;
    return {X: x, Y: y};
}

// 모두 지우기
function clearCanvas(event) {
   event.preventDefault();
   ctx.clearRect(0, 0, canvas.width, canvas.height);
   ctx.beginPath();
}

function canvastoimage(){
   var canvas = document.getElementById('canvas');
   var dataUrl = canvas.toDataURL();
   //alert(dataUrl)
   sendImage(dataUrl)
}

function sendImage(dataUrl){
   $.ajax({
        url: "http://localhost:9600/draw/predict",
        data: {
          img: dataUrl
        },
        method :"POST", 
        success: function( result ) {
         window.location.href = "http://localhost:8080/train/nextProblem?result="+result;
        },
       error:function(request,status,error){
          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      }
   });
}
