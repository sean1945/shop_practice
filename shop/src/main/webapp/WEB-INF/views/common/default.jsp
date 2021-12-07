<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		body{
			margin: 0px;
		}
		#first{
			width: 1000px;
			height: 25px;
			margin: auto;
			background: #eee;
			text-align: center;
		}
		#second{
			width: 1000px;
			height: 50px;
			margin: auto;
		}
		#second ul{
			padding-left: 10px;
			margin: 0px;
			height: 50px;
		}
		#second > ul{
			border-bottom:1px solid #aaa;
		}
		#second #shop > li{
			list-style-type: none;
			display: inline-block;
			height: 50px;
		}
		#second #menu > li{  /* 주메뉴 */
			list-style-type: none;
			display: inline-block;
			height: 30px;
			padding: 10px 5px;
		}
		#second #shop > li:first-child{
			width: 100px;
		}
		#second #shop > li:nth-child(2){
			width: 600px;
		}
		#second #shop > li:last-child{
			width: 250px;
		}
		#second #menu li{
			width: 100px;
			text-align: center;
		}
		#second #menu li:hover{
			background: #aaa;
		}
		.sub_div{ /* 서브메뉴 */
			position: absolute;
			width: 900px;
			background: #aaa;	
			margin: auto;
			margin-top: 0px;
			display: none;	
			padding-top: 10px;
			padding-left: 100px;
		}
		.sub > li, .sub > li a:link, .sub > li a:visited{
			display: inline-block;
			width: 120px;
			height: 30px;
			list-style-type: none;
			margin: auto;
			color: white;
			font-weight: bold;
			text-align: center;
			text-decoration: none;
		}
		.sub > li:last-child{
			float: right;
			color: black;
			font-weight: bold;
		}
		#bottom{
			width: 1000px;
			height: 100px;
			background: #ccc;
			margin: auto;
			margin-top: 50px;
		}
	</style>
	<script>
		function view_sub(n)
		{
			for(i=0; i<5; i++)
			{
				document.getElementsByClassName("sub_div")[i].style.display="none";
				document.getElementsByClassName("main_menu")[i].style.background="white";
				document.getElementsByClassName("main_menu")[i].style.color="black";
			}
			document.getElementsByClassName("sub_div")[n].style.display="block";
			document.getElementsByClassName("main_menu")[n].style.background="#aaa";
			document.getElementsByClassName("main_menu")[n].style.color="white";
		}
		function hide_sub(n)
		{
			document.getElementsByClassName("sub_div")[n].style.display="none";
			document.getElementsByClassName("main_menu")[n].style.background="white";
			document.getElementsByClassName("main_menu")[n].style.color="black";
		}
	</script>
</head>
 <decorator:head/>
<body>
	<div id="first">
		 * 회원가입시 모든 제품을 100원에 드립니다.
	</div>
	<div id="second">
		<ul id="shop">
			<li> <a href="/"> My Shop </a> </li>
			<li>
				<ul id="menu">
					<li onmouseover="view_sub(0)" class="main_menu"> 농산물 </li>
					<li onmouseover="view_sub(1)" class="main_menu"> 수산물 </li>
					<li onmouseover="view_sub(2)" class="main_menu"> 축산물 </li>
					<li onmouseover="view_sub(3)" class="main_menu"> 그 외 </li>
					<li onmouseover="view_sub(4)" class="main_menu"> 커뮤니티</li>
				</ul>			
			</li>
			<li>
				<c:if test="${userid == null}">
				<a href="../member/login"> 로그인 </a>
				<a href="../member/member_input"> 회원가입 </a>
				</c:if>
				<c:if test="${userid != null}">
				 ${name}님!! 
				 <a href="../member/logout">로그아웃</a>
				  <a href="../member/mypage">마이페이지</a>
				</c:if>
			</li>
		</ul>
		<div class="sub_div">
		<ul class="sub">
			<li> 쌀,잡곡 </li>
			<li> 야채 </li>
			<li> 과일 </li>
			<li> 약초 </li>
			<li onclick="hide_sub(0)"> X </li>
		</ul>
		</div>
		<div class="sub_div">
			<ul class="sub">
				<li> 생선 </li>
				<li> 조개류 </li>
				<li> 갑각류</li>
				<li> 해초류 </li>
				<li onclick="hide_sub(1)"> X </li>
			</ul>
		</div>
		<div class="sub_div">
			<ul class="sub">
				<li> 소고기 </li>
				<li> 돼지고기 </li>
				<li> 닭,오리고기 </li>
				<li> 가공품 </li>
				<li onclick="hide_sub(2)"> X </li>
			</ul>
		</div>
		<div class="sub_div">
			<ul class="sub">
				<li> 양념 </li>
				<li> 밀키트 </li>
				<li> 즉석식품 </li>
				<li onclick="hide_sub(3)"> X </li>
			</ul>
		</div>
		<div class="sub_div">
			<ul class="sub">
				<li> <a href="../gongji/list"> 공지사항 </a> </li>
				<li> 고객센터 </li>
				<li> 추천상품 </li>
				<li onclick="hide_sub(4)"> X </li>
			</ul>
		</div>			
	</div>
	
	<decorator:body/>
	
	<!-- 문서의 내용이 출력 -->
	
	<div id="bottom">
		My SHOP의 정보
	</div>
</body>
</html>