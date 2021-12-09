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
			min-height: 500px;
			height: auto;
			margin: auto;
			padding-top: 50px;
			margin-bottom: 100px;
		}
		table{
			width: 700px;
			margin: auto;
			padding-top: 20px;
		}
		tr:nth-child(odd){
			background: #eee;
		}
		td{
			padding-left: 20px;
		}
	</style>
</head>
<body>
	<div id="section">
		<table width="700" align="center">
		<caption> <h3> 고객 센터 </h3> </caption>
			<tr>
				<th> 제 목 </th>
				<th> 작성자 </th>
				<th> 조회수 </th>
				<th> 작성일 </th>
			</tr>
			<c:forEach items="${list}" var="cvo">
			<tr>
				<c:if test="${cvo.del == 0}">
				<td>
					<c:if test="${cvo.depth > 0}">
						<c:forEach begin="0" end="${cvo.depth}">
						&nbsp;&nbsp;
						</c:forEach>
					 ↪
					</c:if>		
						 <a href="readnum?id=${cvo.id}"> ${cvo.title} </a> 
					</td>
					<td> ${cvo.userid} </td>
					<td> ${cvo.readnum} </td>
					<td> ${cvo.writeday} </td>
				</c:if>	
				<c:if test="${cvo.del != 0}">
					<td colspan="4">
					<c:if test="${cvo.depth > 0}">
						<c:forEach begin="0" end="${cvo.depth}">
							&nbsp;&nbsp;
						</c:forEach>
					 ↪
					</c:if>
					삭제된 글입니다...
					</td>
				</c:if>	
			</tr>	
			</c:forEach>
			<tr>
				<td colspan="4" align="center"> <a href="write"> 글 작 성 </a> </td>
			</tr>
		</table>
	</div>
</body>
</html>