<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<script>

	//var pageContext = "${pageContext.request.contextPath}";
	var pageContext = "<%=contextPath%>";
	var contextPath = "<%=contextPath%>";
</script>
<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<link href="<%=contextPath%>/static/css/koala.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/static/css/tree.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-1.11.0.min.js"></script>
<script  src="<%=contextPath%>/static/jquery-validate/jquery.validate.js"></script>
<script  src="<%=contextPath%>/static/jquery-validate/additional-methods.min.js"></script>
<script  src="<%=contextPath%>/static/jquery-validate/messages_zh.min.js"></script>
<script  src="<%=contextPath%>/static/jquery-validate/validate_default.js"></script>
<script  src="<%=contextPath%>/static/jquery-validate/customize-validate.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap-dialog.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap-tree.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/avalon.modern.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/upload/uploadImg.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/koala-ui.plugin.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/avalon-1.5.min.js"></script>
<script  src="<%=contextPath%>/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script  src="<%=contextPath%>/static/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/dateTimePickerUtil.js"></script>
