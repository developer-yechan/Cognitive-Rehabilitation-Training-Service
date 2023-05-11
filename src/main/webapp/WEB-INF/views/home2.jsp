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
   
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
 <script src = "resources/js/jquery-3.6.0.min.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <title>Document</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body{
                background-color: whitesmoke;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
        .main2 {
        background-color:white;
        width :85%;
        height: 1500px;
        margin:0px auto;
        margin-top: 250px;
        top: 8%;
        border-radius: 50px;;
        }
        .table_main{
        background-color:whitesmoke;
        position: absolute;
        width: 80%;
        height: 60%;
        top:25%;
        left:10%;
        border-radius: 50px;
        border:1px solid grey;
        }
        .name_table{
            border-bottom:5px solid grey;
            width: 90%;
            height: 10%;
            margin :auto;
            text-align:center;
        }
        .thead{
            height:60px;
            border-bottom:1px solid grey;
            color:gray;
            background-color: whitesmoke;
            text-align: center;
            font-size:200%;
        }
        .thead th{
            padding:10px;
            border:1px;
        }
        .scroll{
            height:80%;
            overflow-x: hidden;
            overflow-y: scroll;
            margin-top:50px;
        }
        .scroll::-webkit-scrollbar{
            width:30px;
        }
        .scroll::-webkit-scrollbar-thumb{
            background-color: whitesmoke;
            border-radius: 10px;
            background-clip: padding-box;
            border:5px solid transparent;
        }
        .scroll::-webkit-scrollbar-track{
            background-color: rgb(185, 182, 182);
            border-radius:10px;
            box-shadow: insert 0px 0px 5px white;
        }
        .information_table{
            border-collapse: collapse;
            border-top:3px solid #168;
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
            font-size:200%;
        }
        #pat_id{
      	width:14%;
      	
        text-align: center;
        }
        #pat_name{
        width:5%;
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
        width:11%;
         text-align: center;
        
        }
        #pat_address{
        width:9%;
         text-align: center;
        
        }
        #pp_date{
        width:13%;
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
      
        #main_title{
            position: absolute;
            top: 1%;
            left:40%;
            font-size:400%
        }  
        .search{
            font-size: 250%;
            width: 40;
            position: absolute;
            top: 15%;
            left:10%;

        }
        .underline5{
        border :none;
        border-bottom : 2px solid black;
        width :80%;
        font-size: 100%;
    }
    .submit4{
    width :150%;
    height: 30%;
    background-color: grey;
    color:#fff;
    font-size: 70%;
    border-radius:10px;
    margin-left : 70px;
}
.submit4:hover{
   background-color: white;
    color :grey;
}
.gender_search{
    font-size: 100%;
    width: 100%;
    margin-left:30px;

}.member_register{
    position: absolute;
    width:80%;
    top: 88%;
    left:40%;
}
.join1{
    width :20%;
    height: 15%;
    background-color: grey;
    color:#fff;
    font-size: 200%;
    border-radius:10px;
}
.join1:hover{
   background-color: white;
    color :grey;
}
#pat_del input{
    width :60%;
    height:60%;
    background-color: grey;
    color:#fff;
    font-size: 80%;
    border-radius:10px;
}
#pat_del input:hover{
   background-color: white;
    color :grey;
} 
    </style>
    
    <script type="text/javascript">
    function deleteFn2(pat_id){
		
		//location.href="${ctx}/patientDelete.do?pat_id="+pat_id;
		
	 	$.ajax({
			url:"${ctx}/patientDelete.do?pat_id="+pat_id,
					console.log(pat_id);,
			dataType:'json',
			success:function(result){
				//alert('성공');
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
			html += '<td id='+"'pp_totalpoint'"+'>'+data[i].pp_totalpoint+'</td>';
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
    <h3 id="main_title"  data-aos="flip-up" data-aos-duration="2500">작업치료사 회원관리</h3>
    <div class="main2">
        <div class="search">
            <form action="selectPt.do" method="post">
            <table>
                <tr>
                    <td>
                        <p>회원 고유번호 검색</p>
                    </td>
                    <td>
                        <input class="underline5" type="number" name="pat_id" >
                    </td>
                    <td>
                        <p>회원 검색</p>
                    </td>
                    <td>
                        <input class="underline5" type="text" name="pat_name"/>
                    </td>
                    <td>
                        <p>성별</p>
                    </td>
                    <td>
                        <select class ="gender_search" name="pat_gender">
                            <option value=0 >남성</option>
                            <option value=1>여성</option>
                            <option value="blank"></option>
                        </select>
                    </td>
                    <td>
                        <input class="submit4" type="submit" value="검색하기">
                    </td>
                </tr>
            </table>
        </form>
        </div>
        <div class= "table_main" data-aos="fade-up" data-aos-duration="1500">
            <table class="name_table">
                <tr class="thead">
                    <th>고유번호</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th>성별</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>최근 점수</th>
                    <th>최종 평균 점수</th>
                    <th style="width:15%">삭제</th>
                </tr>
            </table>
        <div class="scroll" data-aos="fade-up" data-aos-duration="1500">
            <table class="information_table" id="vo">
               
               
               
               
               
              
            </table>
        </div>    
        </div>
       <a href="patRegisterpage.do"><div class="member_register">
            <input class ="join1" type="button" name ='join' value="회원등록">
        </div></a>


    </div>

    
    <!-- <script src = "scripts.js"></script> -->
   
    <script>
        AOS.init();
    </script>
</body>
</html>