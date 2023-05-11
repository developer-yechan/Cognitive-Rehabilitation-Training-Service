<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="ctx" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-sh07{background-color:#cbcefb;text-align:center;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
</head>
<body>

<!--치료사 회원가입 페이지  -->

<form action="${ctx}/docRegister.do" method="post">
<table class="table table-bordered" style="undefined;table-layout: fixed; width: 541px">
<colgroup>
<col style="width: 131px">
<col style="width: 410px">
</colgroup>
<thead>
  <tr>
    <th class="tg-sh07">아이디</th>
    <th class="tg-0lax"><input type="text" name="doc_id"/></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-sh07">비밀번호</td>
    <td class="tg-0lax"><input type="password" name="doc_pass"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">이름</td>
    <td class="tg-0lax"><input type="text" name="doc_name"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">전화번호</td>
    <td class="tg-0lax"><input type="text" name="doc_phone"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">소속</td>
    <td class="tg-0lax"><input type="text" name="doc_organization"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">이메일</td>
    <td class="tg-0lax"><input type="text" name="doc_email"/></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2" align="center">
     <input type="submit" value="회원가입" class="btn btn-primary"/>
     <input type="reset" value="취소" class="btn btn-primary"/>
    </td>
  </tr>
</tbody>
</table>
</form>
</body>
</html>