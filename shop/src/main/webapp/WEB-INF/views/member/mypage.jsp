<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			position: relative;
		}
		table{
			width: 480px;
			margin: auto;
			border-spacing: 0px;
		}
		tr:nth-child(odd){
			background: #eee;	
		}
		td{
			padding-left: 20px;
		}
		input[type=button]{
			margin-top: 20px;
			background: mediumseagreen;
			border: 1px solid mediumseagreen;
			width: 125px;
			height: 30px;
			color: white;
		}
		#chgpwd{
			position: absolute;
			width: 260px;
			height: auto;
			left: 350px;
			top: 100px;
			border: 3px solid mediumseagreen;
			visibility: hidden;
			background: white;
			padding: 25px;
		}
		input[type=password]{
			border: 1px solid mediumseagreen;
			width: 250px;
			height: 30px;
		}
		input[type=submit]{
			background: mediumseagreen;
			border: 1px solid mediumseagreen;
			color: white;
			width: 125px;
			height: 30px;
		}
	</style>
	<script>
	function change_pwd()
	{
		document.getElementById("chgpwd").style.visibility="visible";
	}
	function check(my)
	{
		// 변경할 비밀번호 칸에 값이 비어있는지 확인
		if(my.pwd.value.trim().length!=0 && my.pwd2.value.trim().length!=0)
		{
			if(my.pwd.value != my.pwd2.value)
			{
				alert("비밀번호가 일치하지 않습니다");
				return false;
			}
			else
			{
				return ture;
			}
		}
		else
			return false;
	}
	function hide_pwd()
	{
		document.getElementById("chgpwd").style.visibility="hidden";
		document.getElementById("before_pwd").value="";
		document.getElementById("pwd").value="";
		document.getElementById("pwd2").value="";
	}
	</script>
</head>
<body>
	<div id="section">
	<form method="post" action="change_pwd" id="chgpwd" onsubmit="return check(this)">
		<input type="password" name="before_pwd" id="before_pwd" placeholder="현재 비밀번호"><p>
		<input type="password" name="pwd" id="pwd" placeholder="새 비밀번호"><p>
		<input type="password" name="pwd2" id="pwd2" placeholder="새 비밀번호 확인"><p>
		<input type="submit" value="비밀번호 변경">
		<input type="button" value="취소" onclick="hide_pwd()">
	</form>
		<table>
		<caption> <h3> ${name}님의 회원정보 </h3> </caption>
		<tr>
			<td> 회원 아이디 : </td>
			<td> ${mvo.userid} </td>
		</tr>
		<tr>
			<td> 이름 : </td>
			<td> ${mvo.name} </td>
		</tr>
		<tr>
			<td> 이메일 :  </td>
			<td> ${mvo.email} </td>
		</tr>
		<tr>
			<td> 전화번호  : </td>
			<td> ${mvo.phone} </td>
		</tr>
		<tr>
			<td> 회원포인터 :  </td>
			<td> ${mvo.point}점 </td>
		</tr>	
		<tr>
			<td colspan="2" align="center"> 
				<input type="button" value="회원정보수정" onclick="location='mypage_update'">
				<input type="button" value="비밀번호수정" onclick="change_pwd()">
			</td>
		</tr>
		</table>
	</div>
</body>
</html>