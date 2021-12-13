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
		h3{
			width: 700px;
			text-align: left;
			border-bottom: 1px solid #ccc;
		}
	</style>
</head>
<body>
	<div id="section">
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
				<td>${mvo.phone}</td>
			</tr>
		</table>
		<table>
			<caption><h3>받는사람 정보</h3></caption>
			<tr>
				<td class="td_head">이름</td>
				<td>${bvo.name}</td>
			</tr>
			<tr>
				<td class="td_head">배송주소</td>
				<td>${bvo.juso1} ${bvo.juso2}</td>
			</tr>
			<tr>
				<td class="td_head">전화번호</td>
				<td>${bvo.phone}</td>
			</tr>
			<tr>
				<td class="td_head">배송요청사항</td>
				<td>${bvo.req}</td>
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
			
		</table>
	</div>
</body>
</html>