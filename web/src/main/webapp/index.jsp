<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<script type="text/javascript">
	var path = window.location.href;
	var last = path.indexOf("?");
	location.href = path.substring(0, last) + "user/index";
</script>
</body>
</html>
