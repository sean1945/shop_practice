<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#section{
			width: 1000px;
			height: 500px;
			margin: auto;
			padding-top:70px;
		}
		table{
			width: 700px;
			margin: auto;
			text-align: center;
		}
		tr:nth-child(odd){
			background: #eee;
		}
		#content{
			width: 500px;
			height: 200px;
		}
		#pwd_check, #pwd_check2{
			display: none;
			background: #eee;
		}
	</style>
	<script>
		<c:if test="${err != null}">
		window.onload = function()
		{
			alert("작성자 정보가 일치하지 않습니다!!");
			<c:if test="${err == 1}">
				document.getElementById("pwd_check2").style.display="table-row";
			</c:if>
			<c:if test="${err == 2}">
				document.getElementById("pwd_check").style.display="table-row";
			</c:if>
		}
		</c:if>
		function view_pwd()
		{
			document.getElementById("pwd_check").style.display="table-row";
			document.pkc2.userid.value="";
			document.pkc2.pwd.value="";
			document.getElementById("pwd_check2").style.display="none";
		}
		function view_pwd2()
		{
			document.getElementById("pwd_check2").style.display="table-row";
			document.pkc.userid.value="";
			document.pkc.pwd.value="";
			document.getElementById("pwd_check").style.display="none";
		}
		function hide_pwd()
		{
			document.getElementById("pwd_check").style.display="none";
			document.pkc.userid.value="";
			document.pkc.pwd.value="";
			document.pkc2.userid.value="";
			document.pkc2.pwd.value="";
			document.getElementById("pwd_check2").style.display="none";
		}
	</script>
</head>
<body>
	<div id="section">
		<table>
		<caption> <h3> 문의 내용 </h3> </caption>
			<tr>
				<td> 제 목 </td>
				<td> ${cvo.title} </td>
			</tr>
			<tr>
				<td> 작성자 </td>
				<td> ${cvo.userid} </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td id="content"> ${cvo.content} </td>
			</tr>
			<tr>
				<td> 조회수 </td>
				<td> ${cvo.readnum} </td>
			</tr>
			<tr>
				<td> 작성일 </td>
				<td> ${cvo.writeday} </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<a href="list">목록보기</a>
				<c:if test="${cvo.pwd==null && userid==cvo.userid}">
					<a href="update_rewrite?id=${cvo.id}">수정</a>
				</c:if>
				<c:if test="${cvo.pwd!=null && userid!=cvo.userid}">
					<a href="javascript:view_pwd2()">수정</a>
				</c:if>
				<c:if test="${cvo.pwd==null && userid==cvo.userid}">
					<a href="delete_rewrite?id=${cvo.id}">삭제</a>
				</c:if>
				<c:if test="${cvo.pwd!=null && userid!=cvo.userid}">
					<a href="javascript:view_pwd()">삭제</a>
				</c:if>
				<a href="rewrite?grp=${cvo.grp}&seq=${cvo.seq}&depth=${cvo.depth}">답글달기</a> <!-- grp,seq,depth값 보낸다 -->
				</td>
			</tr>
			</form>
			<form method="post" action="delete_rewrite" name="pkc">	
			<input type="hidden" name="id" value="${cvo.id}">
			<tr id="pwd_check">
				<td>삭제 작성자 확인</td>
				<td align="center">
					<input type="text" name="userid" placeholder="작성 아이디입력">
					<input type="password" name="pwd" placeholder="작성 비밀번호 입력">
					<input type="submit" value="삭제"><a href="javascript:hide_pwd()">취소</a>
				</td>
			</tr>
			</form>
			<form method="post" action="update_rewrite" name="pkc2">	
			<input type="hidden" name="id" value="${cvo.id}">
			<tr id="pwd_check2">
				<td>수정 작성자 확인</td>
				<td align="center">
					<input type="text" name="userid" placeholder="작성 아이디입력">
					<input type="password" name="pwd" placeholder="작성 비밀번호 입력">
					<input type="submit" value="확인"><a href="javascript:hide_pwd()">취소</a>
				</td>
			</tr>
			</form>
		</table>	
	</div>
</body>
</html>