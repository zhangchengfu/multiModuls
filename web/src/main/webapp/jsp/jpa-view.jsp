<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<% 
	String id = request.getParameter("id");
%>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<div id="Jpa-view">
			<div class="modal-header form-header">
				<h4 style="display: inline-block">查看</h4>
				<div class="pull-right">
					<button type="button" class="btn btn-default" id="back">返回</button>
				</div>
			</div>
			
			<form class="form-horizontal" id="Jpa-view-form">
				<div class="modal-body form-body ms-controller" ms-controller="JpaEditModel">
					<div class="form-group">
						<label class="col-lg-2 control-label">名称:</label>
						<div class="col-lg-10">
							<p class="form-control-static">{{vo.name}}</p>
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
			var JpaView = $("#Jpa-view");
			var JpaViewForm = $("#Jpa-view-form");
			$(function(){
				JpaView.find("#back").on({
					'click':function(){
						window.location.href=contextPath+"/jsp/jpa.jsp";
					}
				});
				
				$.post(contextPath + "/jpa/get", {id:id}).done(function(result){
					if (result.success) {
						JpaEditModel.vo = result.data;
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