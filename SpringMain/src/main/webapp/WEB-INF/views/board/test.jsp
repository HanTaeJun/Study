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
<title>::TITLE::</title>
<style>
	select { 
		width: 100px; /* 원하는 너비설정 */
		padding: .10em .3em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */  
		border: 1px solid #999; 
		border-radius: 10px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
</style>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="container-fluid">
		
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02/board/list">홈페이지</a></div>
			<ul class="nav navbar-nav">
				<li><a href="/ex02/board/write">새 글 작성</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" action="/ex02/board/search" method="get">
				<select class="selectpicker" name="searchType">
					<option value="1">작성자</option>
					<option value="2">제목</option>
					<option value="3">제목+내용</option>
				</select>
				
				<div class="form-group">
					<input type="text" class="form-control" name="searchWord" required placeholder="Search">
				</div>
				
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				
				<%
				String userId;
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					if(loginResult!=null) {
						userId=loginResult.getMid();
						out.print("<li><a href=\"/ex02/member/info\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/member/logout\"></span> 로그아웃</a></li>");
					}else {
						userId="손님";
						out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
						out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
					}
				} catch (NullPointerException e) {
					userId="손님";
					out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
					out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
				}
				%>
				
			</ul>
			
		</div>
	</nav>

	<div class="jumbotron">
		<h1 align="center">::TITLE!::</h1>
		<h3 align="right">- TEXT...</h3>
	</div>
	
</div>
</body>
</html>