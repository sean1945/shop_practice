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
			padding-top: 90px;
		}
		table{
			width: 400px;
			margin: auto;
		}
	</style>
</head>
<body>
	<div id="section"> 
		<table>
		<caption> <h3> 공지사항 글쓰기 </h3> </caption>
		<form method="post" action="write_ok">	
			<tr>
				<td> 제 목 </td>
				<td> <input type="text" name="title" size="40"> </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td> <textarea name="content" cols="45" rows="5"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="글 쓰 기"> </td>
			</tr>
		</form>
		</table>
	</div>
</body>
</html>