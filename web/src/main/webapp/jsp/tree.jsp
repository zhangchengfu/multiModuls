<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		
	</head>
	<body>
		<div class="row" style="margin-bottom:10px;">
			<label class="col-sm-2 control-label">分类:</label>
			<div class="col-lg-3" style="position:relative;">
				<div class="input-group">
					<input type="text" name="treeName" id="treeName" style="display:inline;width:100%;" class="form-control" readonly="readonly" />
					<input type="hidden" name="treeCode" id="treeCode" />
					<span class="input-group-btn"><button class="btn btn-default" type="button" id="chose">选择</button></span>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$("#chose").on({
				'click':function(){
					var tree;
					$.post(contextPath + "/tree/get").done(function(result){
						
						if (result.success) {
							BootstrapDialog.show({
								title: '选择分类',
								buttons:[{
									label:'确定',
									cssClass:'btn-success',
									action:function(dialog){
										$("#treeName").val(tree.getValues().trim());
										$("#treeCode").val(tree.getKeys().trim());
										dialog.close();
									}
								}],
								onshown:function(dialog){
									tree = BootstrapTree.show({
										element:dialog.getModalBody(),
										treeData:result.data,
										collapse:false,
										checkLimit:5,//最多选择5个
										key:"code",
										selectKey:$("#treeCode").val(),//隐藏域值
										value:"name",//显示值
										children:"children",
										displayLevel:"0",//0为第一级,1为第二级
										limitCallback:function(error){
											dialog.getModalBody().message({
												type:'error',
												content:error
											});
										}
									});
								}
							});
						} else {
							$('body').message({
								type:'error',
								content:result.errorMessage
							});
						}
					});
				}
			});
		</script>
	</body>
</html>