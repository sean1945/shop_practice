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
			margin-top: 20px;
			cursor: pointer;
		}
		#main{
			width: 350px;
			height: 100px;
			margin: auto;
			padding: 10px;
			border: 1px solid #ccc;
			margin-top: 10px;
		}
		#gib{
			display: inline-block;
			width: 100px;
			height: 25px;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
		#section #main div{
			height: 35px;
		}
	</style>
	<script>
		function jundal(n)
		{
			// 현재창의 이름, 주소, 전화번호, 요청사항을 부모창의 영역에 전달
			opener.document.getElementsByClassName("sname")[0].innerText = document.getElementsByClassName("name")[n].innerText;
			opener.document.getElementsByClassName("sjuso")[0].innerText = document.getElementsByClassName("juso")[n].innerText;
			opener.document.getElementsByClassName("sphone")[0].innerText = document.getElementsByClassName("phone")[n].innerText;
			opener.document.getElementsByClassName("sreq")[0].innerText = document.getElementsByClassName("req")[n].innerText;
			opener.document.getElementById("bid").value = document.getElementsByClassName("id")[n].value;
			close();
		}
	</script>
</head>
<body>	<!-- 이름, 주소1, 주소2, 전화번호, req -->
	<div id="section">
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="bvo">
		<input type="hidden" class="id" value="${bvo.id}">
			<div id="main"> 
			<div><span class="name">${bvo.name}</span>
				<c:if test="${bvo.gibon==1}">
					<span id="gib">기본배송지</span>
				</c:if>
			<br>
			<span class="juso">${bvo.juso1} ${bvo.juso2}</span><br>
			<span class="phone">${bvo.phone}</span>
			<br>
			<span class="req">
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
			</span>
			</div>
			<div id="select" align="right"><span onclick="jundal(${i})">선 택</span></div>
			</div>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>
		<div id="add" onclick="location='baesong_add'">배송지 추가</div>
	</div>
</body>
</html>