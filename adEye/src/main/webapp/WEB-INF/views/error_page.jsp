<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_exception.jsp</title>
</head>
<body>
	<h4><c:out value="${exception.getMessage() }"></c:out></h4>
	<ul>
		<!-- exception.getStackTrace() 는 자바에서 예외를 처리할 때 사용하는 메서드 중 하나 -->
		<c:forEach items="${exception.getStackTrace() }" var="stack">
			<li><c:out value="${stack }"></c:out></li>
		</c:forEach>
	</ul>
</body>
</html>