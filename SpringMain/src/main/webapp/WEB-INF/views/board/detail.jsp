
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
<title>::DETAIL::</title>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02/board/list">홈페이지</a></div>
			<ul class="nav navbar-nav">
				<li><a href="/ex02/board/update?bno=${board.bno }">이 글 수정</a></li>
				<li><a href="/ex02/board/delete?bno=${board.bno }">이 글 삭제</a></li>
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
				String userId;
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					
					if(loginResult!=null) {
						userId=loginResult.getMid();
						out.print("<li><a href=\"/ex02/member/info\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/member/logout\"></span> 로그아웃</a></li>");
					}else {
						out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
						out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
						userId="손님";
					}
				} catch (NullPointerException e) {
					out.print("<li><a href=\"/ex02/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
					out.print("<li><a href=\"/ex02/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
					userId="손님";
				}
				%>	
			</ul>
			
		</div>
	</nav>

	<div class="jumbotron">
		<h1 align="center">::Board Detail Page::</h1>
	</div>
	
	<p>No.${board.bno }</p>
	
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="form-group" align="center">
				<label for="title">글 제목:</label>
				<input type="text" class="form-control" id="title" name="title" value="${board.title }" required readonly/>
			</div>
	    </div>
	    		
	    	<div class="panel-body">
				<div class="form-group">
					<label for="content">글 내용:</label>
					<textarea class="form-control" rows="14" id="content" name="content" required readonly>${board.content}</textarea>
				</div>
	    	</div>
	    		
	    	<div class="panel-body">
	    		<div class="form-group" align="right">
		    	<label for="userid">작성자 :</label>
		    	<input type="text" class="form-control" id="userid" name="userid" value="${board.userid }" required readonly/>
		    </div>
		    
		    <div class="panel-body">
	    		<div class="form-group" align="right">
		    	<a href="">${board.bfile}</a>
		    </div>
		</div>
	</div>
	
	<p align="right">${board.regdate}</p>
	
	<div>
	<form action="/ex02/replies/insert" method="get">
		<input type="hidden" id="bno" name="bno" value="${board.bno}">
		<%out.print("<input type=\"hidden\" name=\"userid\" value= \""+userId+"\">");%>
		<div class="panel panel-default input-group">
			<input class="form-control" type="text" id="rtext" name="rtext"/>
		<div class="input-group-btn">
			<button class="btn btn-default" type="submit">댓글작성</button>
		</div>
		</div>
	</form>
	</div>
	<hr>
	<div id="replies"><h4>댓글이 들어가는 공간입니다.</h4></div>
	
</div>

<input type="hidden" id="failput" name="failput" value="${fail}"/>

<script>
$(document).ready(function() {
	// 검색할 댓글의 게시글 번호
	var bno = $('#bno').val();
	var list;
	// JQuery를 사용해서 AJax요청을 보내는 함수들 중에서
	// $.getJSON(url, data, callback)
	// 해당 url로 HTTP GET 방식의 ajax 요청을 보내고,	
	// JSON 객체를 로드하는 함수
	// url(필수) : 서버로 요청을 보내는 주소
	// data (선택): 요청과 함께 서버로 보내는 데이터. 생략 가능.
	// callback (선택): 응답을 받았을 때 처리할 일을 정의하는 콜백 함수
	function getAllReplies() {
		$.ajax({
			url: '/ex02/replies/all?bno='+bno,
			success: function(res, status, xhr) {
				$('#replies').html(res);
			}
		});
	}
	getAllReplies();
	
	function failed() {
		var fail= $('#failput').val();
			if('fail'==fail){
				alert('작성자가 아닙니다!');
			}
	}
	failed();
});</script>
</body>
</html>