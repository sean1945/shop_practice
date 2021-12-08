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
				수정
				삭제
				<a href="rewrite?grp=${cvo.grp}&seq=${cvo.seq}&depth=${cvo.depth}">답글달기</a> <!-- grp,seq,depth값 보낸다 -->
				</td>
			</tr>
		</table>	
	</div>
</body>
</html>