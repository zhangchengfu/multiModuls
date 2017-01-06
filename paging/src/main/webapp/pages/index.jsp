<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/meta.jsp"%>
<title>page test</title>

<link rel="stylesheet"
	href="${contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/lib/font-awesome-4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${contextPath}/lib/ionicons-2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${contextPath}/dist/css/AdminLTE.css">
<link rel="stylesheet"
	href="${contextPath}/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${contextPath}/plugins/iCheck/flat/blue.css">
<link rel="stylesheet"
	href="${contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${contextPath}/plugins/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet"
	href="${contextPath}/plugins/bootstrap3-dialog/css/bootstrap-dialog.min.css">
<link rel="stylesheet" href="${contextPath}/dist/css/validform.css">
<link rel="stylesheet" href="${contextPath}/dist/css/style.css">
<link rel="stylesheet"
	href="${contextPath}/plugins/jstree/themes/default/style.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/bootstrap-table/bootstrap-table.min.css">
<script src="${contextPath}/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${contextPath}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="${contextPath}/lib/moment/moment.js"></script>
<script src="${contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
	src="${contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
	src="${contextPath}/plugins/bootstrap3-dialog/js/bootstrap-dialog.min.js"></script>
<script src="${contextPath}/dist/js/app.js"></script>
<script src="${contextPath}/plugins/ajaxfileupload/ajaxfileupload.js"></script>
<script src="${contextPath}/plugins/ajaxfileupload/ajaxupload.js"></script>
<script src="${contextPath}/js/main.js"></script>
<script src="${contextPath}/plugins/validform/Validform_v5.3.2_min.js"></script>
<script src="${contextPath}/plugins/jstree/jstree.js"></script>
<script src="${contextPath}/plugins/avalon/avalon-1.5.min.js"></script>
<script src="${contextPath}/plugins/avalon/avalon.js"></script>
<script src="${contextPath}/js/Ajax.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="javascript:void(0)"> <span class="logo">LAO ZHANG</span>
			</a>
		</header>

		<aside class="main-sidebar">
			<section class="sidebar">
				<ul class="sidebar-menu">
					<li class="treeview active">
						<a href="javascript:void(0)"> <i class="fa fa-table"></i> <span>Tables</span>
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li class="active"><a href="javascript:dataPage()"><i
									class="fa fa-circle-o"></i> Data tables</a></li>
						</ul>
					</li>
				</ul>
			</section>
		</aside>

		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					Data Tables <small>advanced tables</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Tables</a></li>
					<li class="active" onclick="dataPage()">Data tables</li>
				</ol>
			</section>
			
			<section class="content"></section>
		</div>
	</div>
</body>

<script type="text/javascript">
	function dataPage() {
		
		skip("/pages/table/datatable.jsp", "分页", "test");
	}
</script>

</html>