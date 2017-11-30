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
<title>::Update::</title>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02/board/list">홈페이지</a></div>
			<ul class="nav navbar-nav">
				<li><a href="/ex02/board/detail?bno=${board.bno }">뒤 로 가기</a></li>
			</ul>
			

			
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" action="/ex02/board/search" method="get">
					<select name="searchType">
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
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					if(loginResult!=null) {
						out.print("<li><a href=\"/ex02/member/info\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/member/logout\"></span> 로그아웃</a></li>");
					}else {
						out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
						out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
					}
				} catch (NullPointerException e) {
					out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
					out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
				}
				%>	
			</ul>
			
		</div>
	</nav>

	<div class="jumbotron">
		<h1 align="center">::Board Update Page::</h1>
	</div>
	
	<p align="left">No.${board.bno}</p>
	
	<div class="panel panel-default">
		<form method="post">
			<div class="panel-body">
				<div class="form-group" align="center">
					<label for="title">글 제목:</label>
					<input type="text" class="form-control" id="title" name="title" value="${board.title }" required/>
				</div>
		    </div>
		    		
		    	<div class="panel-body">
					<div class="form-group">
						<label for="content">글 내용:</label>
						<textarea class="form-control" rows="14" id="content" name="content" required>${board.content}</textarea>
					</div>
		    	</div>
		    		
		    	<div class="panel-body">
		    		<div class="form-group" align="right">
			    	<label for="userid">작성자 :</label>
			    	<input type="text" class="form-control" id="userid" name="userid" value="${board.userid }" required readonly/>
			    </div>
			    <br>
			    <div align="center">
		    			<input type="submit" class="btn btn-default" value="UPDATE"/>
		    	</div>
		    	<br>
			</div>
		</form>
	</div>
	
	<p align="right">${board.regdate}</p>
	
</div>
</body>
</html>