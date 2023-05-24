
function faceRecognition(){
   var num = document.getElementById("specificSizeInputName").value;
//   alert(num)
   alert("얼굴 인식 진행")
   recogRequest(num)
}

function recogRequest(num){
   $.ajax({
        url: "http://localhost:9500/face/recognition",
      data: {
         data:num
      },
        method :"POST",
        success: function(result) {

          if(result=="Unlocked"){
        	  alert("얼굴인식 완료")
        	  post_to_url("http://localhost:8080/patient/login",{"pat_id":num})
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

/*
 * path : 전송 URL
 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
 * method : 전송 방식(생략가능)
 */
function post_to_url(path, params) {
    method = "post";
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}


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