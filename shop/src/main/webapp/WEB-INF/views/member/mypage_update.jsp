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
			height: 600px;
			margin: auto;
			padding-top: 50px;
		}
		table{
			width: 500px;
			margin: auto;
			padding-left: 50px;
		}
		input[type=text], input[type=password]{
			width: 380px;
			height: 40px;
			font-size: 17px;
			margin-top: 10px;
			padding-left: 20px;
			border: 1px solid mediumseagreen;
		}
		input[type=submit], input[type=button]{
			width: 200px;
			height: 40px;
			font-size: 17px;
			margin-top: 10px;
			background: mediumseagreen;
			border: 1px solid mediumseagreen;
			color: white;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div id="section">
	<form method="post" name="myinput" action="mypage_update_ok">
		<table>
		<caption><h2>회원 가입</h2></caption>
			<tr>
				<td>아이디 : ${userid}</td>
			</tr>
			<tr>
				<td>이름 : ${name}</td>
			</tr>
			<tr>
				<td> <input type="text" name="email" placeholder="이메일" value="${mvo.email}"> </td>
			</tr>
			<tr>
				<td> <input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="정 보 수 정"> <input type="button" value="수 정 취 소" onclick="location='mypage'"> </td>
			</tr>
		</table>	
	</form>
	</div>
</body>
</html>