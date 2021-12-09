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
	</style>
</head>
<body>
	<div id="section">
		<table>
		<form method="post" action="update_rewrite_ok">
		<input type="hidden" name="id" value="${cvo.id}">
		<caption> <h3> 문의 내용 </h3> </caption>
			<tr>
				<td> 제 목 </td>
				<td> <input type="text" name="title" value="${cvo.title}" size="50"> </td>
			</tr>
			<tr>
				<td> 작성자 </td>
				<td> ${cvo.userid} </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td id="content"> <textarea name="content" cols="60" rows="10"> ${cvo.content} </textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<a href="content?id=${cvo.id}">취소</a>
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>