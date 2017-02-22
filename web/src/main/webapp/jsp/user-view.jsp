<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%
	String contextPath = request.getContextPath();
	String id = request.getParameter("id");
%>

<html>
	<head>
		<title></title>
		<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=contextPath%>/static/css/koala.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-1.11.0.min.js"></script>
		<script  src="<%=contextPath%>/static/jquery-validate/jquery.validate.js"></script>
		<script  src="<%=contextPath%>/static/jquery-validate/additional-methods.min.js"></script>
		<script  src="<%=contextPath%>/static/jquery-validate/messages_zh.min.js"></script>
		<script  src="<%=contextPath%>/static/jquery-validate/validate_default.js"></script>
		<script  src="<%=contextPath%>/static/jquery-validate/customize-validate.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap-dialog.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery.form.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/avalon.modern.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/upload/uploadImg.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/koala-ui.plugin.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/avalon-1.5.min.js"></script>
		
		
	</head>
	
	<body>
		<div id="User-view">
			<div class="modal-header form-header">
				<h4 style="display: inline-block">查看</h4>
				<div class="pull-right">
					<button type="button" class="btn btn-default" id="back">返回</button>
				</div>
			</div>
			
			<form class="form-horizontal" id="User-view-form">
				<div class="modal-body form-body ms-controller" ms-controller="UserEditModel">
					<div class="form-group">
						<label class="col-lg-2 control-label">姓名:</label>
						<div class="col-lg-10">
							<p class="form-control-static">{{vo.userName}}</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-lg-2 control-label">密码:</label>
						<div class="col-lg-10">
							<p class="form-control-static">{{vo.password}}</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-lg-2 control-label">年龄:</label>
						<div class="col-lg-10">
							<p class="form-control-static">{{vo.age}}</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	
		<script type="text/javascript">
			var contextPath = "<%=contextPath%>";
			var id = "<%=id%>";
			var UserEditModel = avalon.define({
				$id:"UserEditModel",
				vo:{}
			});
			var UserView = $("#User-view");
			var UserViewForm = $("#User-view-form");
			
			$(function(){
				UserView.find("#back").on({
					'click':function(){
						window.location.href=contextPath+"/jsp/table.jsp";
					}
				});
				
				$.post(contextPath + "/table/get", {id:id}).done(function(result){
					if (result.success) {
						UserEditModel.vo = result.data;
						avalon.scan();
					} else {
						UserViewForm.message({
							type:'error',
							content:result.errorMessage
						});
					}
				});
			});
		</script>
	</body>
</html>