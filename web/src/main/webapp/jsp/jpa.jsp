<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		
	</head>
	<body>
		<div style="width: 100%">
			<form id="searchForm" class="form-horizontal">
				<div class="row" style="margin-bottom:10px;">
					<div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon">名称：</span>
							<input name="name" class="form-control" type="text" id="name"  style="display:inline;" />
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
							{content: '<button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-plus"><span>添加</button>', action: 'add'}
			            ],
			            url:contextPath+"/jpa/page",
			            //url:contextPath + "/jpa/get",
			            //searchCondition:{id:"1"},//增加初始查询条件
			            dataFilter:function(result){
			            	if (result.success) {
			            		return result.data;
			            	} else {
			            		$("body").message({
									type : 'error',
									content : '查询失败'
								});
			            	}
			            },
			            columns:columns
					}).on({
						add : function(){
							window.location.href=contextPath+"/jsp/jpa-edit.jsp";
						}
					});
				},
				edit : function(params){
					window.location.href=contextPath + "/jsp/jpa-edit.jsp?id=" + params.id;
				},
				view : function(params){
					window.location.href=contextPath + "/jsp/jpa-view.jsp?id=" + params.id;
				},
				del : function(params){
					gridList.confirm({
						content:'确定要删除所选记录吗？',
						callBack:function(){
							$.post(contextPath + "/jpa/delete",params).done(function(result){
								if (result.success) {
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
			    {title:'名称',name:'name',width:'60%'},
			    {title:'创建日期',name:'createDateFormat',width:'20%'},
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