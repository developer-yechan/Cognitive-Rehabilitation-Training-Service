<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.PatientsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/face.js"></script>
</head>


<%-- <%List<PatientsVO> patlog = (List<PatientsVO>)application.getAttribute("patlog"); %>
 --%>

<body>
<!-- specificSizeInputName -->
		
	<!-- 	<input type="text" id="specificSizeInputName" value="">
		
		
		<script>
		
		 faceRecognition();
		
		</script> -->

	<%
	String result =(String)application.getAttribute("result");
	/* String pat_id =(String)application.getAttribute("data"); */
	System.out.println(result);
	/* System.out.println(pat_id); */
	application.setAttribute("finalresult", result);
	response.sendRedirect("/myapp/loginHome.do");%>
		
<!-- 	try{
	
	if(result.equals("Unlocked")) {
		application.setAttribute("finalresult", result);
		
	}else if(result.equals("Locked")) {
		//page="redirect:/loginHome.do";
		application.setAttribute("finalresult", result);
		response.sendRedirect("/myapp/loginHome.do");
		
	}}
	catch(Exception e){ 
	System.out.pri
	 } %>   -->
	
</body>
</html>