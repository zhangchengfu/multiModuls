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
    
</div>
<div class="ui-layout-west">
功能菜单<br/>
<a href="${pageContext.request.contextPath}/richText/index" target="content">富文本</a><br/>
<a href="${pageContext.request.contextPath}/upload/index" target="content">upload</a><br/>
<a href="${pageContext.request.contextPath}/table/index" target="content">分页</a><br/>
<a href="${pageContext.request.contextPath}/jsp/time.jsp" target="content">日期</a><br/>
<a href="${pageContext.request.contextPath}/jsp/tree-list.jsp" target="content">树形列表</a><br/>
<a href="${pageContext.request.contextPath}/jsp/tree.jsp" target="content">树</a><br/>
<a href="${pageContext.request.contextPath}/jsp/jpa.jsp" target="content">jpa</a><br/>
<a href="${pageContext.request.contextPath}/jsp/js-study.jsp" target="content">javascript</a><br/>
<a href="${pageContext.request.contextPath}/jsp/js-study2.jsp" target="content">javascript2</a><br/>
<a href="${pageContext.request.contextPath}/jsp/js-study3.jsp" target="content">javascript3</a><br/>
<a href="${pageContext.request.contextPath}/jsp/js-studyFour.jsp" target="content">javascript4</a><br/>
<a href="${pageContext.request.contextPath}/jsp/jsbom.jsp" target="content">bom</a><br/>
<a href="${pageContext.request.contextPath}/jsp/js-dom.jsp" target="content">dom</a><br/>
<a href="${pageContext.request.contextPath}/jsp/windowPrint.jsp" target="content">windowPrint</a><br/>
<a href="${pageContext.request.contextPath}/jsp/CustomerValidate.jsp" target="content">自定义表单验证</a><br/>
<a href="${pageContext.request.contextPath}/jsp/tableExport.jsp" target="content">tableExport</a><br/>
<a href="${pageContext.request.contextPath}/jsp/dispPdf.jsp" target="content">显示pdf</a><br/>
<a href="${pageContext.request.contextPath}/jsp/echarts1.jsp" target="content">echarts1</a><br/>
<a href="${pageContext.request.contextPath}/jsp/echarts2.jsp" target="content">echarts2</a><br/>
<a href="${pageContext.request.contextPath}/jsp/vue.jsp" target="content">vue</a>
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
