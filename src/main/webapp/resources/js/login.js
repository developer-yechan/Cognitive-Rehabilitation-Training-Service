
function faceRecognition(){
   var num = document.getElementById("specificSizeInputName").value;
//   alert(num)
   alert("얼굴 인식 진행")
   recogRequest(num)
//    login(1)
//     location.href = `http://localhost:8080/home/patient?pat_id=${num}`;
}

function recogRequest(num){
	console.log("이동")
   $.ajax({
        url: "http://localhost:9500/face/recognition",
      data: {
         data:num
      },
        method :"POST",
        success: function(result) {

          if(result=="Unlocked"){
        	  alert("얼굴인식 완료")
        	  location.href = `http://localhost:8080/home/patient?pat_id=${num}`;
//        	  login(num)
          }else{
        	  alert("얼굴인식 실패")
        	  window.location.href = "http://localhost:8080/home";
          }

        },
       error:function(request,status,error){
    	   	alert("실패!!")
/*          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);*/
      }
   });
}

//function login(num){
//    	   $.ajax({
//    	     /*   url: "http://localhost:8089/myapp/face_recognition.do"*/
//    		   url: `http://localhost:8080/home/patient?pat_id=${num}`,
//    	      data: {
//    	         data:num
//    	      },
//    	        method :"POST",
//    	        success: function() {
//    	          alert("환영합니다.")
//    //	         //location.href = "http://localhost:8089/titanic/train_result.jsp?result="+result
//    	          location.href = "studymain";
//    	        },
//    	       error:function(request,status,error){
//    	          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
//    	      }
//    	   });
//    	}

    	function faceTrain(){
           var num = document.getElementById("num").value;
           alert(num)
           sendRequest(num)
        }

        function sendRequest(num){
           $.ajax({
                url: "http://localhost:9500/face/train",
              data: {
                 data:num
              },
                method :"POST",
                success: function(result) {
                  alert("success")

                },
               error:function(request,status,error){
                  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
              }
           });
        }