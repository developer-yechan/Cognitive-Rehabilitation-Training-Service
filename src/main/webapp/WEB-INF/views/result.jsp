<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String pre = request.getParameter("predict"); 
	String word = "";
	if(pre.equals("0")){
		word = "미국";
	}else if (pre.equals("1")){
		word = "독도";
	}else if (pre.equals("2")){
		word = "8";
	}else if (pre.equals("3")){
		word = "5";
	}else if (pre.equals("4")){
		word = "4";
	}else if (pre.equals("5")){
		word = "금";
	}else if (pre.equals("6")){
		word = "병원";
	}else if (pre.equals("7")){
		word = "월";
	}else if (pre.equals("8")){
		word = "9";
	}else if (pre.equals("9")){
		word = "1";
	}else if (pre.equals("10")){
		word = "토";
	}else if (pre.equals("11")){
		word = "학교";
	}else if (pre.equals("12")){
		word = "7";
	}else if (pre.equals("13")){
		word = "6";
	}else if (pre.equals("14")){
		word = "일";
	}else if (pre.equals("15")){
		word = "3";
	}else if (pre.equals("16")){
		word = "목";
	}else if (pre.equals("17")){
		word = "화";
	}else if (pre.equals("18")){
		word = "2";
	}else if (pre.equals("19")){
		word = "수";
	}else if (pre.equals("20")){
		word = "0";
	}
%>
<h1>결과는 <%= word %> 입니다.</h1>
	<p> 점수는 "${score}"점</p>
	<p> 결과는 "${predict}"</p>
</body>
</html>