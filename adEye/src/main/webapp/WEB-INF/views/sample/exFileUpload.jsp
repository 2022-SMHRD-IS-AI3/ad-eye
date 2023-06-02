<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath  == '/' ? '' : pageContext.request.contextPath }" />
<!-- 현재 페이지가 컨텍스트루트를 읽어왔을 때 슬러시 (/)면 '' 아니면 컨텍스트루트로 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exFileUpload.jsp</title>
</head>
<body> <!-- file 첨부는 get 방식은이 안된다. 용량이 제한적이기 때문에  -->
	<!-- 파일 첨부시  enctype="multipart/form-data" 속성을 넣어줘야한다 -->
	<form action="${ctx}/sample/exUploadPost" method="post" enctype="multipart/form-data">
		<div>
			<input type="file" name="files">
		</div>
		<div>
			<input type="file" name="files">
		</div>
		<div>
			<input type="file" name="files">
		</div>
		<div>
			<input type="file" name="files">
		</div>
		<div>
			<input type="submit" value="파일등록">
		</div>

	</form>
</body>
</html>