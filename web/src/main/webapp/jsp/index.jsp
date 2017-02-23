<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layout-default-latest.css" />
</head>
<body>
<iframe name="content" class="ui-layout-center" frameborder="0" scrolling="auto"></iframe>
<div class="ui-layout-north">欢迎[${username}]，<a href="${pageContext.request.contextPath}/loginout">退出</a></div>
<div class="ui-layout-south">
    test
</div>
<div class="ui-layout-west">
功能菜单<br/>
<a href="${pageContext.request.contextPath}/richText/index" target="content">富文本</a><br/>
<a href="${pageContext.request.contextPath}/upload/index" target="content">upload</a><br/>
<a href="${pageContext.request.contextPath}/table/index" target="content">分页</a><br/>
<a href="${pageContext.request.contextPath}/jsp/time.jsp" target="content">日期</a><br/>
<a href="${pageContext.request.contextPath}/jsp/tree-list.jsp" target="content">树形列表</a><br/>
<a href="${pageContext.request.contextPath}/jsp/tree.jsp" target="content">树</a>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.layout-latest.min.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            $('body').layout({ applyDemoStyles: true });
        });
    });
</script>
</body>
</html>
