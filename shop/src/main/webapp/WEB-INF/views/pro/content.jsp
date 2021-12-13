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
		#product_img{
			width: 400px;
			height: 400px;
			margin-top: 0px;
			margin-left: 30px;
		}
		#td_img{
			width: 510px;
		}
		#td_detail{
			width: 440px;
		}
		#product_title{
			font-size: 25px;
		}
		#product_price{
			font-size: 20px;
		}
		.pro{
			height: 80px;
			font-size: 20px;
			padding-left: 30px;
		}
		#section #outer{
			padding-left: 60px;
		}
		#section #outer .num{
			display: inline-block;
			font-size: 22px;
			width: 35px;
			height: 35px;
			border: 1px solid #ddd;
			text-align: center;
		}
		#product_detail{
			height: 500px;
			width: 1000px;
		}
		#left, #right{
			cursor: pointer;
		}
	</style>
	<script>		
		function num_chg(chk)
		{
			var num = parseInt(document.getElementById("center").innerText);
			var price = ${pvo.price};
			if(chk == 0) // 갯수를 -
			{
				if(num > 1)
				{
					num--;	
				}		
			}
			else // 갯수를 +
			{
				num++;
				
			}
			// num의 갯수와 가격을 곱하기 => product_price에 innerText로
			price = add_comma(price*num);
			document.getElementById("center").innerText=num;
			
			document.getElementById("product_price").innerText=price+'원';
		}
		function add_comma(val) // 콤마 생성 javascript
		{
			return new Intl.NumberFormat().format(val);
		}
		function cart_add() // 장바구니 추가
		{
			var pcode = "${pvo.pcode}";
			var su = document.getElementById("center").innerText;
			
			var cart = new XMLHttpRequest();
			var url = "cart_add?pcode="+pcode+"&su="+su;
			cart.open("get", url);
			cart.send();
			
			cart.onreadystatechange = function()
			{
				if(cart.readyState == 4)
				{
					if(cart.responseText == 1)
					{
						confirm("장바구니로 이동하시겠습니까?");
					}
					else if(cart.responseText == 2)
					{
						confirm("로그인을 하지 않았습니다");
					}
				}
			}
		}
		function check(my)
		{
			my.su.value = document.getElementById("center").innerText;
			return true;
		}
	</script>
</head>
<body>
	<div id="section">
		<form method="post" action="gumae" onsubmit="return check(this)">
		<input type="hidden" name="pcode" value="${pvo.pcode}">
		<input type="hidden" name="su">
		<table width="960" align="center">
			<tr>
				<td id="td_img"><img id="product_img" src="${pvo.imgsrc}"></td>
				<td id="td_detail">
					<div class="pro" id="product_title"><strong>${pvo.title}</strong></div>
					<div class="pro" id="star">별점</div>
					<div class="pro" id="product_price"><fmt:formatNumber value="${pvo.price}"/>원</div>
					<div class="pro" id="bae">무료배송</div>
					<div id="outer" class="pro">
						<div class="num" id="left" onclick="num_chg(0)">-</div>
						<div class="num" id="center">1</div>
						<div class="num" id="right" onclick="num_chg(1)">+</div>	
					</div>
					<div class="pro">
					<button type="button" onclick="cart_add()">장바구니</button> 
					<button type="submit">구매하기</button>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 상품 상세 정보 </td>
			</tr>
		</table>
		</form>
		<div id="product_detail">
		</div>
	</div>
</body>
</html>