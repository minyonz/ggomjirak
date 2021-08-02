<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<script>
</script>

<title>글목록</title>
</head>
<body>
<c:choose>
	<c:when test="${msgDelte == 'success'}">
		<script>
		Swal.fire({
			icon : "success",
			title : "삭제 성공",
		}).then(function(){close()});
		</script>
	</c:when>
	<c:otherwise>
		<script>
		Swal.fire({
			icon : "error",
			title : "삭제 실패",
		}).then(function(){close()});
		</script>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${msgInsert == 'success'}">
		<script>
		Swal.fire({
			icon : "success",
			title : "등록 성공",
		}).then(function(){close()});
		</script>
	</c:when>
	<c:otherwise>
		<script>
		Swal.fire({
			icon : "error",
			title : "등록 성공",
		}).then(function(){close()});
		</script>
	</c:otherwise>
</c:choose>

글 목록 화면 


</body>
</html>