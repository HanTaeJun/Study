
<%@page import="edu.spring.ex02.domain.Member"%>
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
<title>::LIST::</title>
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
		<h1 align="center">::Board List Page::</h1>
	</div>
  
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>시간</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.bno}</td>
				<td><a href="detail?bno=${board.bno}">${board.title}</a></td>
				<td>${board.userid}</td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy년 MM월dd일 HH:mm"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="search?page=${(pageMaker.startPage)-1 }&perPage=10&searchType=${searchType }&searchWord=${searchWord}">prev</a></li>
		</c:if>
		
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }"> 
			<li id="${num }"><a href="search?page=${num }&perPage=10&searchType=${searchType }&searchWord=${searchWord }">${num }</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li><a href="search?page=${(pageMaker.endPage)+1 }&perPage=10&searchType=${searchType }&searchWord=${searchWord }">next</a></li>
		</c:if>
	</ul>
</div>

<script>
$(document).ready(function() {
	var thisPage = ${page};
	$('#'+thisPage).addClass("active");	
});//end doufun
</script>
</body>
</html>