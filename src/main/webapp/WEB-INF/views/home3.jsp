<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <% response.setCharacterEncoding("utf-8"); %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="icon" type="image/png" href="http://example.com/myicon.png">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <style>
         
        body{
                background-color: #eef0ed;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
        .main2 {
        background-color:#d7e0e7;
        width :80%;
        height: 700px;
        margin:0px auto;
        margin-top: 50px;
        border-radius: 50px;
        }
        .table_main{
        background-color:#eef0ed;
        width: 90%;
        height: 70%;
        position: relative;
        top:50px;
        left:5%;
        border-radius: 50px;
        border:1px solid #a9c5db;
        }
        .name_table{
            border-bottom:5px solid #7aaccd;
            width: 90%;
            height: 10%;
            margin :auto;
            text-align:center;
            
        }
        .thead{
            height:60px;
            border-bottom:1px solid grey;
            color:gray;
            background-color:#eef0ed;
            text-align: center;
            font-size:100%;
        }
        .thead th{
            padding:10px;
            border:1px;
        }
        .scroll{
            height:70%;
            overflow-x: hidden;
            overflow-y: scroll;
            margin-top:50px;
            margin-right:5px;
        }
        .scroll::-webkit-scrollbar{
            width:20px;
        }
        .scroll::-webkit-scrollbar-thumb{
            background-color: #d7e0e7;
            border-radius: 5px;
            background-clip: padding-box;
            border:5px solid transparent;
        }
        .scroll::-webkit-scrollbar-track{
            background-color: #a9c5db;
            border-radius:5px;
            box-shadow: insert 0px 0px 5px white;
        }
        .information_table{
            border-collapse: collapse;
            border-top:3px solid #8db4d1;
            border :1px;
            width: 90%;
            height: 10%;
            margin: auto;
            text-align:center;
        }
        #tbody{
            height:60px;
            color:#168;
            text-align: center;
            font-size:70%;
        }
        #main_title{
            position: absolute;
            top: 1%;
            left:40%;
            font-size:50%
        }
        
        #pat_id{
      	width:9%;
      	
        text-align: center;
        }
        #pat_name{
        width:10%;
        text-align: center;
        }
        #pat_age{
         width:8%;
        text-align: center;
        }
        
        #pat_gender{
        
       	 width:7%;
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
        width:18%;
        text-align: center;
        
        }
        #pat_del{
        width:20%;
        text-align: center;
        }  

    .btn{
    width :150%;
    height: 40%;
    background-color: #8db4d1;
    color:#fff;
    font-size: 70%;
    border-radius:10px;
    
}
.btn:hover{
   background-color: white;
    color :grey;
}
.gender_search{
    font-size: 100%;
    width: 100%;
    margin-left:30px;

}.member_register{
    margin-top: 70px;
    margin-left: 45%;
}
.join1{
    width :25%;
    height: 10%;
    background-color: #8db4d1;;
    color:#fff;
    font-size: 100%;
    border-radius:10px;
}
.join1:hover{
   background-color: white;
    color :grey;
}
.title {
    margin-left: 40%;
    margin-top:50px;
}
.form-control{
    border :none;
    background-color:#eef0ed;
    border : 2px solid #8db4d1;
}
.form-select{
    border :none;
    background-color:#eef0ed;
    border : 2px solid #8db4d1;
}
.row{
    position:relative;
    left :10%;
    top:20px;
}
    </style>
    <script src = "resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript">
    function deleteFn2(pat_id){
    	
		//location.href="${ctx}/patientDelete.do?pat_id="+pat_id;
		
	 	$.ajax({
			url:"${ctx}/patientDelete.do?pat_id="+pat_id,
			dataType:'json',
			success:function(result){
				
				console.log(result);
				
				$('#vo').empty(); //기존 태그 비우기
				drawTable(result);
			}
		}); 
		
	}
    function click(pat_id){
		
		//location.href="${ctx}/patientDelete.do?pat_id="+pat_id;
		
	 	$.ajax({
			url:"${ctx}/revise_info.do?pat_id="+pat_id,
			dataType:'json',
			success:function(result){
				//alert('성공');
				console.log(result);
				
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
			html += '<td id='+"'pat_id'"+'>'+data[i].pat_id+'</td>';
			
			html += '<td id='+"'pat_name'"+'><a href="revise_info.do?pat_id='+data[i].pat_id+'">'+data[i].pat_name+'</a></td>';
			//html="<td id=pat_name><a href='revise_info.do?pat_id="+data[i].pat_id+"'>"+data[i].pat_name+"</a></td>";
			html += '<td id='+"'pat_age'"+'>'+data[i].pat_age+'</td>';
			html += '<td id='+"'pat_gender'"+'>'+data[i].pat_gender+'</td>';
			html += '<td id='+"'pat_phone'"+'>'+data[i].pat_phone+'</td>';
			html += '<td id='+"'pat_address'"+'>'+data[i].pat_address+'</td>';
			html += '<td id='+"'pp_date'"+'>'+data[i].pp_date+'</td>';
			html += '<td id='+"'pp_totalpoint'"+'>'+data[i].totalpoint+'</td>';
			html += '<td id='+"'pat_del'"+'><input type="button" value="삭제" onclick="deleteFn2('+data[i].pat_id+')"></td>';
			
			
			
			html += '<tr>';
		} 

		console.log(html);
		$('#vo').append(html);
	}    
    $(function(){
    	let data = JSON.parse('${info}');
    	
    	drawTable(data);

    });
    </script>
</head>
<body>
    <h3 class="title container-xxl" data-aos="flip-up" data-aos-duration="2500">작업치료사 회원관리</h3>
    <div class="main2">
        <div >
            <form action="selectPt.do" method="post" class="row gx-3 gy-2 align-items-center">
                <div class="col-sm-3">
                  <label class="visually-hidden" for="specificSizeInputName">Name</label>
                  <input type="text" class="form-control" id="specificSizeInputName" placeholder="회원 고유 번호" name="pat_id">
                </div>
                <div class="col-sm-3">
                  <label class="visually-hidden" for="specificSizeInputGroupUsername">Username</label>
                  <div class="input-group">
                    <input type="text" class="form-control" id="specificSizeInputGroupUsername" placeholder="회원 이름" name="pat_name">
                  </div>
                </div>
                <div class="col-sm-3">
                  <label class="visually-hidden" for="specificSizeSelect">Preference</label>
                  <select class="form-select" id="specificSizeSelect" name="pat_gender">
                    <option selected>성별</option>
                    <option value="0">남성</option>
                    <option value="1">여성</option>
                  </select>
                </div>
                <div class="col-auto">
                  <button type="submit" class="btn btn-primary">검색하기</button>
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
                    <th>최근 검사 날짜</th>
                    <th>최종 점수</th>
                    <th>삭제</th>

                </tr>
            </table>
        <div class="scroll" data-aos="fade-up" data-aos-duration="1500">
            <table class="information_table" id="vo">
          	
            </table>
        </div>    
        </div>
        <div class="member_register">
            <a href="patRegisterpage.do"><input class ="join1" type="button" name ='join' value="회원등록"></a>
        </div>


    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    
    <script>
        AOS.init();
    </script>
    
   
</body>
</html>