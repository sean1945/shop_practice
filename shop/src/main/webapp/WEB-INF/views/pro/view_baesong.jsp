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
			width: 390px;
		}
		#add{
			width: 370px;
			height: 30px;
			text-align: center;
			font-size: 18px;
			border: 1px solid #ccc;
			margin: auto;
		}
		#main{
			border: 1px solid #ccc;
		}
		#gib{
			display: inline-block;
			width: 100px;
			height: 30px;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
		#section #main div{
			height: 35px;
		}
	</style>
</head>
<body>	<!-- 이름, 주소1, 주소2, 전화번호, req -->
	<div id="section">
		<c:forEach items="${list}" var="bvo">
			<div id="main"> 
			<div>${bvo.name}
				<c:if test="${bvo.gibon==1}">
					<span id="gib">기본배송지</span>
				</c:if>
			</div>
			<div>${bvo.juso1} ${bvo.juso2}</div>
			<div>${bvo.phone}</div>
			<div>
				<c:if test="${bvo.req==0}">
					경비실
				</c:if>
				<c:if test="${bvo.req==1}">
					부재시 문앞
				</c:if>
				<c:if test="${bvo.req==2}">
					편의점
				</c:if>
				<c:if test="${bvo.req==3}">
					무조건 직접
				</c:if>
			</div>
			</div>
		</c:forEach>
		<div id="add" onclick="location='baesong_add'">배송지 추가</div>
	</div>
</body>
</html>