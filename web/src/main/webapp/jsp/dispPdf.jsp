<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 展示pdf -->
		<script type="text/javascript" src="<%=contextPath%>/static/js/pdfobject.js"></script>
	</head>
	<body>
		<div style="width: 800px;height: 600px;" id="pdf">
			
		</div>
		
		<script type="text/javascript">
			$(function(){
				var url = "<%=contextPath%>/jsp/upload/test.pdf";
				var success = new PDFObject({ url: url ,pdfOpenParams: { scrollbars: '0', toolbar: '0', statusbar: '0'}}).embed("pdf");
			});
		</script>
	</body>
</html>