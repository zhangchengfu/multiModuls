<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
	<head>
		<title></title>
	</head>
	<body>
		
		<script type="text/javascript">
		var head = "<html><head><title></title><head><body>";//生成头部
		var foot = "</body></html>";//生成尾部
		var print = "";//打印区域
		var older = document.body.innerHTML;
		
		print += "<div>TEST</div>";
		
		document.body.innerHTML = head + print + foot;//构建新的网页
		
		try {
			window.print();//打印新建的网页
		} catch (e) {
			document.body.innerHTML = older;//网页还原
		}
		document.body.innerHTML = older;//网页还原
		
		</script>
	</body>
</html>