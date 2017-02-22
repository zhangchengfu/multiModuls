<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%
	String contextPath = request.getContextPath();
	String id = request.getParameter("id");
%>

<html>
	<head>
		<title></title>
		
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
		
		<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=contextPath%>/static/css/koala.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body>
		<div id="User-edit">
			<div class="modal-header form-header">
				<h4 style="display: inline-block">编辑</h4>
				<div class="pull-right">
					<button type="button" class="btn btn-success" id="save">保存</button>
					<button type="button" class="btn btn-default" id="back">返回</button>
				</div>
			</div>
			
			<form class="form-horizontal" id="User-edit-form">
				<div class="modal-body form-body ms-controller" ms-controller="UserEditModel">
					<input id="id" type="hidden" name="id" ms-attr-value="vo.id">
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="required">*</span>姓名:</label>
						<div class="col-sm-3">
							<input name="userName"  style="display: inline; width: 94%;"
								class="form-control" type="text" ms-attr-value="vo.userName" maxlength="255"/>
						</div>
						
						<label class="col-sm-2 control-label"><span class="required">*</span>密码:</label>
						<div class="col-sm-3">
							<input name="password"  style="display: inline; width: 94%;" maxlength="255"
								class="form-control" type="text" ms-attr-value="vo.password"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="required">*</span>年龄:</label>
						<div class="col-sm-3">
							<input name="age"  style="display: inline; width: 94%;"
								class="form-control" type="text" ms-attr-value="{{vo.age}}" maxlength="3"/>
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
			
			var UserEdit = $("#User-edit");
			var UserEditForm = $("#User-edit-form");
			
			
			
			$(function(){
				
				var getModel = function() {
					$.post(contextPath + "/table/get", {id:id}).done(function(result){
						if (result.success) {
							UserEditModel.vo = result.data;
							avalon.scan();
						} else {
							UserEditForm.message({
								type:'error',
								content:result.errorMessage
							});
						}
					});
				}
				
				if (!!id && id != 'null') {
					getModel();
				}
				
				UserEditForm.validate({
					rules:{
						userName:{
							required:true,
							maxlength:255
						},
						password:{
							required:true,
							maxlength:255
						},
						age:{
							required:true,
							digits:true,
							max:100,
							min:0
						}
					},
					messages:{
						userName:{
							required:'姓名不能为空',
							maxlength:'姓名输入过长'
						},
						password:{
							required:'密码不能为空',
							maxlength:'密码输入过长'
						},
						age:{
							required:'年龄不能为空',
							digits:'请输入整数',
							max:'值过大',
							min:'值过小'
						}
					}
				});
				
				UserEdit.find("#back").on({
					'click':function(){
						window.location.href=contextPath+"/jsp/table.jsp";
					}
				});
				
				UserEdit.find("#save").on({
					'click':function(){
						if (!UserEditForm.valid()){
							return;
						}
						$.post(contextPath+"/table/edit", UserEditForm.serialize()).done(function(result){
							if (result.success) {
								UserEditForm.message({
									type:'success',
									content:'保存成功'
								});
								window.location.href=contextPath+"/jsp/table.jsp";
							} else {
								UserEditForm.message({
									type:'error',
									content:result.errorMessage
								});
							}
						});
					}
				});
			});
			
		</script>
	</body>
</html>