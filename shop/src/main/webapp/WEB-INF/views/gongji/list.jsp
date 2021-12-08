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
			padding-top: 50px;
		}
		table{
			width: 700px;
			margin: auto;
			padding-top: 20px;
		}
		tr:nth-child(odd){
			background: #eee;
		}
	</style>
</head>
<body>
	<div id="section"> 
		<table>
		<caption> <h3> 공지사항  </h3> </caption>	
			<tr>
				<th> 작성자 </th>
				<th> 제 목 </th>
				<th> 조회수 </th>
				<th> 작성일 </th>
				<c:if test="${userid == 'admin'}">
					<th> 삭 제 </th>
				</c:if>
			</tr>
			<c:forEach items="${list}" var="gvo">
			<tr>
				<td> 관리자 </td>
				<td> <a href="readnum?id=${gvo.id}"> ${gvo.title} </a> </td>
				<td> ${gvo.readnum} </td>
				<td> ${gvo.writeday} </td>
				<c:if test="${userid == 'admin'}">
					<td> <a href="delete?id=${gvo.id}"> 삭제 </a> </td>
				</c:if>
			</tr>
			</c:forEach>
			<c:if test="${userid == 'admin'}">
				<tr>
					<td colspan="5" align="center"> <a href="write"> 글 작 성 </a> </td>
				</tr>
			</c:if>	
		</table>
	</div>
</body>
</html>