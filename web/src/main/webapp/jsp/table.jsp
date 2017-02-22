<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
%>

<html>
	<head>
		<title></title>
		
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap-dialog.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery.form.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/avalon.modern.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/upload/uploadImg.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/static/js/koala-ui.plugin.js"></script>
		
		<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=contextPath%>/static/css/koala.css" rel="stylesheet" type="text/css" />
		
	</head>

	<body>
		
		<div style="width: 100%">
			<form id="searchForm" class="form-horizontal">
				<div class="row" style="margin-bottom:10px;">
					<div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon">姓名：</span>
							<input name="userName" class="form-control" type="text" id="userName"  style="display:inline;" />
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:10px;">
					<div class="col-sm-10"></div>
				 	<div class="col-sm-2">
						<button id="search" type="button" class="btn btn-primary  ">
								<span class="glyphicon glyphicon-search"></span>查询
						</button>
						<button id="reset" type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-search"></span>重置
						</button>
					</div>
				</div>
			</form>
		
			<form name="gridForm" id="gridForm" target="_self" class="form-horizontal">
				<div id="gridList"></div>
			</form>
		</div>
		
		
		<script type="text/javascript">
			var contextPath = "<%=contextPath%>";
			
			var searchForm = $("#searchForm");
			var gridForm = $("#gridForm");
			var gridList = $("#gridList");
			
			var table = {
				initSearchPanel:function(){
					
				},
				initGridPanel:function(columns){
					return gridList.grid({
						identity:"id",
						buttons:[
							{content: '<button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-plus"><span>添加</button>', action: 'add'},
							{content: '<button class="btn btn-danger" type="button"><span class="glyphicon glyphicon-remove"><span>删除</button>', action: 'delete'}   
			            ],
			            url:contextPath+"/table/page",
			            dataFilter:function(result){
							if (result.success) {
								return result.data;
							}else {
								$("body").message({
									type : 'error',
									content : '查询失败'
								});
							}
						},
						columns:columns
					}).on({
						add : function(){
							window.location.href=contextPath+"/jsp/user-edit.jsp";
						},
						'delete': function(event, data){
							var indexs = data.item;
							var $this = $(this);
							if(indexs.length == 0){
								$this.message({
	                                   type: 'warning',
	                                   content: '请选择要删除的记录'
	                            });
	                            return;
							}
							var users = [];
							for (var i = 0; i < indexs.length; i++) {
								var index = indexs[i];
								users.push(index.id);
							}
							var ids = users.join();
							$this.confirm({
								content:'确定要删除所选记录吗?',
								callBack:function(){
									$.post(contextPath + "/table/del",{ids:ids}).done(function(result){
										if (result.success) {
											gridList.getGrid().search();
	                            			$this.message({
	    										type: 'success',
	    										content: '删除成功'
	    									});
										} else {
											$this.message({
	     	                                   type: 'error',
	     	                                   content: result.errorMessage
	     	                            	});
										}
									});
								}		
							});
						}
					});
				},
				edit : function(params){
					window.location.href=contextPath + "/jsp/user-edit.jsp?id=" + params.id;
				},
				view : function(params){
					window.location.href=contextPath + "/jsp/user-view.jsp?id=" + params.id;
				},
				del : function(params){
					gridList.confirm({
						content:'确定要删除所选记录吗？',
						callBack:function(){
							$.post(contextPath + "/table/delete", params).done(function(result){
								if (result.success) {
									//gridList.data('koala.grid').refresh();
									//gridList.getGrid().search();
									gridList.getGrid().refresh();
									gridList.message({
										type: 'success',
										content: '删除成功'
									});
								} else {
									gridList.message({
										type:'error',
										content:result.errorMessage
									});
								}
							});
						}
					});
				}
			};
			
			var columns = [
				{title:'姓名',name:'userName',width:'40%'},
				{title:'年龄',name:"age",width:'40%'},
				{title:'操作',width:'20%',render:function(rowdata,name,index){
					var h = "<a href='javascript:void(0);' data-id='" + rowdata.id + "' class='click-btn-view'>详情</a> ";
					h += "<a href='javascript:void(0);' data-id='"+rowdata.id+"' class='click-btn-edit'>编辑</a> ";
					h += "<a href='javascript:void(0);' data-id='"+rowdata.id+"' class='click-btn-del'>删除</a> ";
					return h;
				}}
            ];
			
			table.initGridPanel(columns);
			
			gridForm.on({
				"click":function(event){
					var thiz = $(this);
					var params = {
						id:thiz.data("id")
					};
					table.view(params);
				}
			},".click-btn-view");
			
			gridForm.on({
				"click":function(){
					var thiz = $(this);
					var params = {
							id:thiz.data("id")
						};
					table.edit(params)
				}
			},".click-btn-edit");
			
			gridForm.on({
				"click":function(){
					var thiz = $(this);
					var params = {
							id:thiz.data("id")
					};
					table.del(params)
				}
			},".click-btn-del");
			
			searchForm.find("#search").on({
				'click':function(){
					var params = {};
					searchForm.find('input').each(function(){
						var $this = $(this);
						var name = $this.attr('name');
						if (name) {
							params[name] = $this.val();
						}
					});
					searchForm.find('select').each(function(){
						var $this = $(this);
						var name = $this.attr('name');
						if (name) {
							params[name] = $this.val();
						}
					});
					gridList.getGrid().search(params);
				}
			});
			
			searchForm.find("#reset").on({
				'click':function(){
					searchForm.find('input').val("");
					searchForm.find('select').each(function(){
						$(this).find('option:first').prop("selected", "selected");
					});
				}
			});
			
		</script>
	</body>
</html>