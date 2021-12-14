<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table{
			width: 390px;
			margin: auto;
		}
	</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso1.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.juso2.focus();
      }
  }).open();
}
</script>
</head>
<body>
	<form method="post" name="pkc" action="baesong_add_ok">
	<table>
		<tr>
			<td><input type="text" name="name" placeholder="받는 분"></td>
		</tr>
		<tr>
			<td><input type="text" name="zip" placeholder="우편번호" readonly></td>
		</tr>
		<tr>
			<td><input type="text" name="juso1" placeholder="주소찾기" onclick="juso_search()"></td>
		</tr>
		<tr>
			<td><input type="text" name="juso2" placeholder="상세주소"></td>
		</tr>
		<tr>
			<td><input type="text" name="phone" placeholder="전화번호"></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="gibon" value="1">기본배송지</td>
		</tr>
		
		<tr>
			<td> 요청사항
			<select name="req">
				<option value="0">경비실</option>
				<option value="1">부재시 문앞</option>
				<option value="2">편의점</option>
				<option value="3">직접 수령</option>
			</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="배송지 추가"></td>
		</tr>
	</table>
	</form> 
</body>
</html>