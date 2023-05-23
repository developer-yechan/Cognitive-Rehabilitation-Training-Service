<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="ctx" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 치료사 로그인 페이지  -->
<form action="/doctor/login",method="post">
<table>
<tr>
<td>아이디</td>
<td><input type="text" name="doc_id"> </td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" name="doc_pass"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="로그인">
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="회원가입" class="btn ntn_primary" onclick="location.href='${ctx}/docRegisterpage.do'"/>
</td>
</tr>
</table>
</form>

</body>
</html>