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
			width: 500px;
			margin: auto;
		}
	</style>
</head>
<body>
	<div id="section">
		<form method="post" action="write_ok">
		<input type="hidden" name="seq" value="0">
		<input type="hidden" name="depth" value="0">
		<table>
		<caption> <h3> 글 작 성 </h3> </caption>
			<c:if test="${userid == null }">
			<tr>
				<td> 이 름 </td>
				<td> <input type="text" name="userid" size="50"> </td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td> <input type="password" name="pwd" size="50"> </td>
			</tr>
			</c:if>
			<tr>
				<td> 제 목 </td>
				<td> <input type="text" name="title" size="50"> </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td> <textarea name="content" cols="50" rows="6"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="저 장"> </td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>