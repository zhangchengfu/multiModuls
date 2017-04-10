<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<%@ taglib prefix="formToken" uri="http://www.laozhag.com/formToken" %>
<!DOCTYPE html>
<% 
	String id = request.getParameter("id");
%>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<div id="Jpa-edit">
			<div class="modal-header form-header">
				<h4 style="display: inline-block">编辑</h4>
				<div class="pull-right">
					<button type="button" class="btn btn-success" id="save">保存</button>
					<button type="button" class="btn btn-default" id="back">返回</button>
				</div>
			</div>
			
			<form class="form-horizontal" id="Jpa-edit-form">
				<formToken:formToken></formToken:formToken>
				<div class="modal-body form-body ms-controller" ms-controller="JpaEditModel">
					<input id="id" type="hidden" name="id" ms-attr-value="vo.id">
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><span class="required">*</span>名称:</label>
						<div class="col-sm-3">
							<input name="name"  style="display: inline; width: 94%;"
								class="form-control" type="text" ms-attr-value="vo.name" maxlength="255"/>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<script type="text/javascript">
			var id = "<%=id%>";
			var JpaEditModel = avalon.define({
				$id:"JpaEditModel",
				vo:{}
			});
			var JpaEdit = $("#Jpa-edit");
			var JpaEditForm = $("#Jpa-edit-form");
			$(function(){
				var getModel = function(){
					$.post(contextPath + "/jpa/get", {id:id}).done(function(result){
						if (result.success) {
							JpaEditModel.vo = result.data;
							avalon.scan();
						} else {
							JpaEditForm.message({
								type:'error',
								content:result.errorMessage
							});
						}
					});
				};
				
				if (!!id && id != 'null') {
					getModel();
				}
				
				JpaEditForm.validate({
					rules:{
						name:{
							required:true,
							maxlength:255
						}
					},
					messages:{
						name:{
							required:'名称不能为空',
							maxlength:'名称过长'
						}
					}
				});
				
				JpaEdit.find("#back").on({
					'click':function(){
						window.location.href=contextPath + "/jsp/jpa.jsp";
					}
				});
				
				JpaEdit.find("#save").on({
					'click':function(){
						if (!JpaEditForm.valid()) {
							return;
						}
						$.post(contextPath+"/jpa/edit",JpaEditForm.serialize()).done(function(result){
							if (result.success) {
								JpaEditForm.message({
									type:'success',
									content:'保存成功'
								});
								window.location.href=contextPath+"/jsp/jpa.jsp";
							} else {
								JpaEditForm.message({
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