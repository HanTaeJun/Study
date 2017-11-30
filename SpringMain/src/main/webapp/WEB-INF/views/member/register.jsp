<%@page import="edu.spring.ex02.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
var checkId = false;
var checkPw = false;
</script>
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::REGISTER::</title>
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
		<h1 align="center">::Member Register Page::</h1>
	</div>
	
<form method="post">
	<div class="input-group form-group " id="idtbl" >
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input id="mid" type="text" class="form-control" name="mid" required placeholder="User ID">
	</div>
	
	<div class="input-group form-group has-warning has-feedback" id="pwddiv">
		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		<input id="pwd" type="password" class="form-control" name="pwd" required placeholder="Password">
		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		<input id="pwc" type="password" class="form-control" name="pwc" required placeholder="Password Check">
	</div>
	
	<div class="input-group form-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
		<input id="Email" type="email" class="form-control" name="Email" required placeholder="Email">
	</div>
	<br>
	<div class="input-group" align="right">
		<input class="btn btn-default" id="submit" type="submit" value="Register" disabled />
	</div>
</form>


<script>
$(document).ready(function() {
	var pwd = $('#pwd').val();
	var pwc = $('#pwc').val();
	var mid = $('#mid').val();
	//$('#submit').attr("disabled", "disabled");
	//$('#submit').removeAttr("disabled");
	function check() {
		if(checkPw==true){
			$('#submit').removeAttr("disabled");
		}else{
			$('#submit').attr("disabled", "disabled");
		}
	}//end check
	
	function pwCheck() {
		pwd = $('#pwd').val();
		pwc = $('#pwc').val();
		mid = $('#mid').val();
		if(pwd == pwc){
			$('#pwddiv').addClass("has-success has-feedback");
			checkPw=true;
			check();
		}else {
			$('#pwddiv').removeClass("has-success has-feedback");
			$('#pwddiv').addClass("has-error has-feedback");
			checkPw = false;
			check();
		}
	}//end function pwCheck()
	$('#pwd').change(pwCheck); // end $('#pwd').change()
	$('#pwc').change(pwCheck); // end $('#pwc').change()
	
	
	$('#mid').change(function() {
		mid = $('#mid').val();
		$.ajax({
			type: 'post',
			url: 'test',
			data: {mid:$('#mid').val()},
			success: function(res, status, xhr) {
					//alert(res);
					$('#checkbody').html(res);
			}
		}); //end ajax
		check();
	});//end $('#mid').change(function() {})
	
}); // end $(document).ready(function(){})
</script>
<div id = "checkbody"></div>
</body>
</html>