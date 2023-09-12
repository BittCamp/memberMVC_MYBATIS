<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${ requestScope.id }는 사용 가능합니다.</h3>
	<input type="button" value="사용하기" onclick="checkIdClose('${id}')">
	
<script type="text/javascript">
function checkIdClose(id){
	opener.document.getElementById("id").value = id;
	opener.document.getElementById("sw").value = id;
	window.close();
	opener.document.getElementById("pwd").focus();
}
</script>
</body>
</html>