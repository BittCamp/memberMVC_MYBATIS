<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse:collapse;
}

#memberloginForm div{
	font-size: 8pt;
	font-weight: bold;
	color: red;
}
</style>
</head>
<body>
<form id="memberloginForm" method="post" action="/memberMVC/member/login.do">
	<table border="1" cellspacing ="0" cellpadding ="7">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="id" placeholder="아이디 입력" size="30">
				<div id="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td >
				<input type="password" id="pwd" name="pwd" size="40">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<button type="button" id="loginBtn">로그인</button>
				<button type="button" onclick="location.href='writeForm.jsp'">회원가입</button>
			</th>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#id').val()==''){
			$('#idDiv').text('아이디를 입력하세요.');
			$('#id').focus();
			
		}else if($('#pwd').val()==''){
			$('#pwdDiv').text('비밀번호를 입력하세요.');
			$('#pwd').focus();
			
		}else{
			$('#memberloginForm').submit();
		}
	});
});
</script>
</body>
</html>











