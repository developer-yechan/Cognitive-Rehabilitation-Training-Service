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
<form action="${ctx}/memberInsert.do" method="post">
<table class="table table-bordered" style="undefined;table-layout: fixed; width: 541px">
<colgroup>
<col style="width: 131px">
<col style="width: 410px">
</colgroup>
<thead>
  <tr>
    <th class="tg-sh07">���̵�</th>
    <th class="tg-0lax"><input type="text" name="id"/></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-sh07">��й�ȣ</td>
    <td class="tg-0lax"><input type="password" name="pass"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">�̸�</td>
    <td class="tg-0lax"><input type="text" name="name"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">����</td>
    <td class="tg-0lax"><input type="text" name="age"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">��ȭ��ȣ</td>
    <td class="tg-0lax"><input type="text" name="phone"/></td>
  </tr>
  <tr>
    <td class="tg-sh07">�̸���</td>
    <td class="tg-0lax"><input type="text" name="email"/></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2" align="center">
     <input type="submit" value="ȸ������" class="btn btn-primary"/>
     <input type="reset" value="���" class="btn btn-primary"/>
    </td>
  </tr>
</tbody>
</table>
</form>
</body>
</html>