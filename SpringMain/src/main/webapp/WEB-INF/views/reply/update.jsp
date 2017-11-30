<%@page import="edu.spring.ex02.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<body>
<div>
<%
String userId;
String replierId= (String) session.getAttribute("replierid");
	try{
		Member loginResult = (Member) session.getAttribute("loginResult");
		if(loginResult!=null) {
			userId=loginResult.getMid();
		}else {
			userId="손님";
		}
	} catch (NullPointerException e) {
		userId="손님";
	}
%>

<%
	if (userId.equals(replierId)){	
%>
	<form action="/ex02/replies/update-result" method="get">
		<input type="hidden" id="rno" name="rno" value="${update.rno}">
		<input type="hidden" id="bno" name="bno" value="${update.bno}">
		<%out.print("<input type=\"hidden\" name=\"userid\" value= \""+userId+"\">");%>
		<div class="panel panel-default input-group">
			<input class="form-control" type="text" id="rtext" name="rtext"/>
		<div class="input-group-btn">
			<button class="btn btn-default" type="submit">댓글수정</button>
		</div>
		</div>
	</form>
<%	}else{ %>
	<script>
		alert('댓글 작성자가 아닙니다...');
	</script>
<%
	}
%>
</div>
</body>
</html>