<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#section{
			width: 1000px;
			height: auto;
			margin: auto;
			padding-top: 50px;
		}
		#product_list{
			width: 1000px;
			height: auto;
			margin: 0px;
			padding: 0px;
		}
		#product{
			list-style-type: none;
			width: 200px;
			height: 300px;
			float: left;
			border: 1px solid white;
			margin-top: 20px;
			margin-left: 40px;
			text-align: center;
		}
		#product:hover{
			border: 1px solid #eee;
			box-shadow: 0px 0px 15px #ccc;
			color: blue;
			text-decoration: underline;
			cursor: pointer;
		}
		#cate{
			font-size: 17px;
			color: #aaa;
			padding-left: 30px;
		}
		#product .img{
			width: 180px;
			height: 180px;
			margin: auto;
			margin-top: 5px;
		}
		#product .title{
			display: inline-block;
			margin: auto;
			width: 170px;
			height: 60px;
		}
		#product .price{
			display: inline-block;
			margin: auto;
			heith: 20px;
			font-size: 20px;
			font-weight: bold;
			color: #800;
		}
		#product_list_end{
			clear: both;
		}
	</style>
	<script>
		function view_content(pcode)
		{
			location="procontent?pcode="+pcode;
		}
	</script>
</head>
<body>
	<div id="section">
	<span id="cate">농산물 >> 야채</span>
		<ul id="product_list">
		<c:forEach items="${plist}" var="pvo">
			<li id="product" onclick="view_content('${pvo.pcode}')">
			<img class="img" src="${pvo.imgsrc}">
			<span class="title">${pvo.title}</span><br>
			<span class="price"><fmt:formatNumber value="${pvo.price}"/>원</span>
			</li>
			<c:set var="i" value="${i+1}" />
		</c:forEach>
		</ul>
		<div id="product_list_end">
		</div>
	</div>
</body>
</html>