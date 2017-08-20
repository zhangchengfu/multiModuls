<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head></head>
	<body>
		<div id="app">
			<p>{{message}}</p>
		</div>
	
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/vue.min.js"></script>
		<script type="text/javascript">
			new Vue({
				el:"#app",
				data:{
					message : 'Hello Vue.js!'
				}
			});
		</script>
	</body>
</html>