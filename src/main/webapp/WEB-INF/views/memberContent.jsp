<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--jstl �±� ���� -->
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
<input type="hidden" name="num" value="${vo.num}"> <!-- ������ â���� ���ܼ� �Ķ���͸� ����  -->
<table class="table table-borderea"  width: 413px">
<colgroup>
<col style="width: 90px">
<col style="width: 323px">
</colgroup>
<thead>
  <tr>
    <th >��ȣ</th>
    <th >${vo.num}</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td >���̵�</td>
    <td >${vo.id}</td>
  </tr>
  <tr>
    <td>��й�ȣ</td>
    <td >${vo.pass}</td>
  </tr>
  <tr>
    <td>�̸�</td>
    <td>${vo.name}</td>
  </tr>
  <tr>
    <td>����</td>
    <td><input type="text" name="age" value="${vo.age}"></td>
  </tr>
  <tr>
    <td >��ȭ��ȣ</td>
    <td class="tg-0lax"><input type="text" name="phone" value=" ${vo.phone}"></td>
  </tr>
  <tr>
    <td >�̸���</td>
    <td><input type="text" name="email" value="${vo.email}"></td>
  </tr>
  <tr>
    <td  colspan="2" align="center">
    <input type="submit" value="�����ϱ�">
    <input type="reset" value="���">
    <input type="button" value="����Ʈ" onclick="location.href='${ctx}/memberList.do'">
    </td>
    
  </tr>
</tbody>
</table>
</form>


</body>
</html>