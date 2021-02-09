<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과페이지(2021/01/05 6번과제)</title>
</head>
<body>
	<h3>ID=${param.id} &amp; PW=${param.pw}</h3>
	<hr>
	
	
	<pre>
	물품명:${param.prod}
	가격:${param.price}
	갯수:${param.count}
	기타요청사항:${param.memory}
	</pre>
</body>
</html>