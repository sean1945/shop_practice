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
		table{
			width: 700px;
			margin: auto;
			padding-top: 10px;
			margin-bottom: 50px;
		}
		tr:nth-child(odd){
			background: #eee;
		}
		td{
			padding: 10px 20px;
		}
		.td_head{
			font-size: 14px;
			font-weight: bold;
		}
		h3{
			width: 700px;
			text-align: left;
			border-bottom: 1px solid #ccc;
		}
		.h3_span{
			font-size: 14px;
		}
		/* 결제수단 관련 */
		#section .sudan{
			display: none;
		}
		#section #ff{
			display: block;
		}
	</style>
	<script>
		function view_baesong()
		{
			window.open("view_baesong","","width=400,height=500,scrollbar=true")
		}
		function phone_chg()
	    {
	    	var chk=new XMLHttpRequest();
	    	var phone=document.getElementById("phone").value;
	    	chk.open("get","phone_chg?phone="+phone);
	    	chk.send();
	    	chk.onreadystatechange=function()
	    	{
	    		if(chk.readyState==4)
	    	    {   
	    			if(chk.responseText=="0")
	    			{
	    				document.getElementById("phone").value=phone;
	    			}	
	    			else
	    			{
	    				alert("예외 발생하였습니다 잠시후에 다시 해보세요");
	    			}	
	    	    }
	    	}
	    }
	    
	    function req_chg(req)
	    {
	    	var id=document.getElementById("bid").value;
	    	var chk=new XMLHttpRequest();
	    	chk.open("get","req_chg?id="+id+"&req="+req);
	    	chk.send();
	    	
	    	chk.onreadystatechange=function()
	    	{
	    		if(chk.readyState==4)
	    		{  
	    			if(chk.responseText=="0")
	    			{
	    				switch(req)
	    				{
	    				  case 0: document.getElementsByClassName("sreq")[0].innerText="경비실"; break;
	    				  case 1: document.getElementsByClassName("sreq")[0].innerText="부재시 문 앞"; break;
	    				  case 2: document.getElementsByClassName("sreq")[0].innerText="편의점"; break;
	    				  case 3: document.getElementsByClassName("sreq")[0].innerText="무조건 직접"; break;
	    				}
	    			}	
	    			else
	    			{
	    				alert("예외발생");
	    			}	
	    		}	
	    	}
	    }
	    function view_creq()
	    {
	    	document.getElementById("creq").style.display="inline-block";
	    }
	    function sudan_chg(n)
	    {
	    	var sudan = document.getElementsByClassName("sudan");
	    	for(i=0; i<sudan.length; i++)
	    	{
	    		sudan[i].style.display = "none";	
	    	}
	    	sudan[n].style.display = "block";
	    }
	</script>
</head>
<body>
	<div id="section">
	<form method="post" action="gumae_ok">
	<input type="hidden" name="pcode" value="${pvo.pcode}">
	<input type="hidden" name="su" value="${su}">
	<c:if test="${(pvo.price*su) >= 30000}">
		<input type="hidden" name="price" value="${pvo.price*su}">
	</c:if>
	<c:if test="${(pvo.price*su) < 30000}">
		<input type="hidden" name="price" value="${pvo.price*su+2500}">
	</c:if>
		<table>
			<caption><h3>구매자 정보</h3></caption>
			<tr>
				<td class="td_head">이름</td>
				<td>${mvo.name}</td>
			</tr>
			<tr>
				<td class="td_head">이메일</td>
				<td>${mvo.email}</td>
			</tr>
			<tr>
				<td class="td_head">전화번호</td>
				<td>
					<input type="text" id="phone" value="${mvo.phone}">
					<input type="button" onclick="phone_chg()" value="수정">
				</td>
			</tr>
		</table>
		<table>
			<caption>
				<h3>받는사람 정보
				<c:if test="${empty bvo}">
					<span class="h3_span" onclick="view_baesong()">배송지 추가</span>
				</c:if>
				<c:if test="${!empty bvo}">
					<span class="h3_span" onclick="view_baesong()">배송지 변경</span>
				</c:if>
				</h3>
			</caption>
			<tr>
				<td class="td_head">이름</td>
				<td class="sname">${bvo.name}</td>
			</tr>
			<tr>
				<td class="td_head">배송주소</td>
				<td class="sjuso">${bvo.juso1} ${bvo.juso2}</td>
			</tr>
			<tr>
				<td class="td_head">전화번호</td>
				<td class="sphone">${bvo.phone}</td>
			</tr>
			<tr>
				<td class="td_head">배송요청사항</td>
				<td><span class="sreq">
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
					<input type="button" value="변경" onclick="view_creq()">
					<span id="creq" style="display:none">
						<input type="hidden" id="bid" value="${bvo.id}">
						<input type="radio" value="0" name="req" onclick="req_chg(0)">경비실
						<input type="radio" value="1" name="req" onclick="req_chg(1)">부재시 문앞
						<input type="radio" value="2" name="req" onclick="req_chg(2)">편의점
						<input type="radio" value="3" name="req" onclick="req_chg(3)">무조건 직접
					</span>
				</td>
			</tr>
		</table>
		<table>
			<caption><h3>구매상품 정보</h3></caption>
			<tr>
				<td class="td_head">주문상품</td>
				<td>${pvo.title}</td>
			</tr>
			<tr>
				<td class="td_head">주문수량</td>
				<td>${su}</td>
			</tr>
		</table>
		<table>
			<caption><h3>결제 정보</h3></caption>
			<tr>
				<td id="top" width="120" class="title">주문상품</td>
				<td>${pvo.title}</td>
			</tr>
			<tr>
				<td id="top" width="120" class="title">상품금액</td>
				<td id="top"><fmt:formatNumber value="${pvo.price*su}"/>원</td>
			</tr>
			<tr>
				<td id="top" width="120" class="title">배송비</td>
				<c:if test="${(pvo.price*su) >= 30000}">
				<td>0원</td>
				</c:if>
				<c:if test="${(pvo.price*su) < 30000}">
				<td>2,500원</td>
				</c:if>
			</tr>
			<tr>
				<td id="top" width="120" class="title">포인트</td>
				<td></td>
			</tr>
			<tr>
				<td id="top" width="120" class="title">총결제금액</td>
				<c:if test="${(pvo.price*su) >= 30000}">
				<td><fmt:formatNumber value="${pvo.price*su}"/>원</td>
				</c:if>
				<c:if test="${(pvo.price*su) < 30000}">
				<td><fmt:formatNumber value="${(pvo.price*su)+2500}"/>원</td>
				</c:if>		
			</tr>
			<tr>
				<td id="top" width="120" class="title">결제수단</td>
				<td>
					<input type="radio" name="sudan" value="0" onclick="sudan_chg(this.value)" checked="checked">계좌이체
					<input type="radio" name="sudan" value="1" onclick="sudan_chg(1)">신용/체크
					<input type="radio" name="sudan" value="2" onclick="sudan_chg(2)">휴대폰<p>
					<div class="sudan" id="ff">
					은행선택<select name="bank">
						<option value="0">선택</option>
						<option value="1">신한은행</option>
						<option value="2">우리은행</option>
						<option value="3">농협은행</option>
						<option value="4">하나은행</option>
					</select>
					</div>
					<div class="sudan">
					카드선택<select name="card">
						<option value="0">선택</option>
						<option value="1">신한카드</option>
						<option value="2">우리카드</option>
						<option value="3">농협카드</option>
						<option value="4">하나카드</option>
					</select><p>
					할부기간<select name="halbu">
						<option value="0">일시불</option>
						<option value="1">2개월</option>
						<option value="2">3개월</option>
						<option value="3">4개월</option>
						<option value="4">5개월</option>
					</select>
					</div>
					<div class="sudan">
					통신사<select name="com">
						<option value="0">선택</option>
						<option value="1">SKT</option>
						<option value="2">KT</option>
						<option value="3">LG</option>
						<option value="4">알뜰통신</option>
					</select><p>
					전화번호<input type="text" name="phone">
					</div>
				</td>
			</tr>
		</table>
		<div align="center"><input type="submit" value="구매하기"></div>
		</form>
	</div>
</body>
</html>