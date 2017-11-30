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


<div id="divs">
<c:forEach var="reply" items="${replyList}">
<div class="panel panel-default" id="${reply.rno}" >
	<h4>${reply.replier}</h4>
	<h5>${reply.rtext}</h5>
</div>
<div id="rereplies${reply.rno}"></div>
</c:forEach>
</div>


<script>
$("#divs div").click(function() {
	var rno = $(this).attr("id");
	$.ajax({
		url: '/ex02/replies/update?rno='+rno,
		success: function(res, status, xhr) {
			$('#rereplies'+rno).html(res);
		}
	});
});
</script>
</body>
</html>