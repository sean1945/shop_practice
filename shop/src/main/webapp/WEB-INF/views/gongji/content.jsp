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
			padding-top: 50px;
		}
		table{
			width: 600px;
			margin: auto;
			padding-top: 20px;
		}
		tr:nth-child(odd){
			background: #eee;
		}
		#content{
			height:200px;
		}
	</style>
</head>
<body>
	<div id="section"> 
		<table>
		<caption> <h3> 공지내용  </h3> </caption>	
			<tr>
				<td> 작성자 </td>
				<td> 관리자 </td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> ${gvo.title} </td>
			</tr>
			<tr>
				<td> 조회수 </td>
				<td> ${gvo.readnum} </td>
			</tr>
			<tr>
				<td> 작성일 </td>
				<td> ${gvo.writeday} </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td id="content"> ${gvo.content} </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <a href="list"> 목 록 </a> </td>
			</tr>
		</table>
	</div>
</body>
</html>