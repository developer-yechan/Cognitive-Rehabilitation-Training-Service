<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--jstl 태그 참조 -->
  <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="${ctx}/memberUpdate.do" method="post" >
<input type="hidden" name="num" value="${vo.num}"> <!-- 페이지 창에서 숨겨서 파라미터를 보냄  -->
<table class="table table-borderea"  width: 413px">
<colgroup>
<col style="width: 90px">
<col style="width: 323px">
</colgroup>
<thead>
  <tr>
    <th >번호</th>
    <th >${vo.num}</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td >아이디</td>
    <td >${vo.id}</td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td >${vo.pass}</td>
  </tr>
  <tr>
    <td>이름</td>
    <td>${vo.name}</td>
  </tr>
  <tr>
    <td>나이</td>
    <td><input type="text" name="age" value="${vo.age}"></td>
  </tr>
  <tr>
    <td >전화번호</td>
    <td class="tg-0lax"><input type="text" name="phone" value=" ${vo.phone}"></td>
  </tr>
  <tr>
    <td >이메일</td>
    <td><input type="text" name="email" value="${vo.email}"></td>
  </tr>
  <tr>
    <td  colspan="2" align="center">
    <input type="submit" value="수정하기">
    <input type="reset" value="취소">
    <input type="button" value="리스트" onclick="location.href='${ctx}/memberList.do'">
    </td>
    
  </tr>
</tbody>
</table>
</form>


</body>
</html>