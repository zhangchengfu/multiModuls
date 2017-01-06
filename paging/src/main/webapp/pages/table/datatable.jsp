<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/meta.jsp" %>

<form ms-controller="dataModel">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="searchBox">
					<span>姓名：</span>
					<input type="text" name="userName" id="userName_id" class="form-control"/>	  
				</div>
				<div class="searchBox" style="text-align: right;">
					<button type="button" class="btn btn-primary fr" ms-click="reset">重置</button>
                 	<button type="button" class="btn btn-primary fr" ms-click="search">查询</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div id="table-toolbar" class="pl10">
					<div class="input-group input-group-sm">
						<button class="btn  btn-primary " id = "add" type="button" onclick="addUser()">增加记录</button>
					</div>
				</div>
			
				<div class="box-body table-responsive no-padding">
					<table id="dataTable">
	              	</table>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	TableInit.init({
		"datatable":$("#dataTable"),
		"endpoint":"/dataTable/search",
		"toolbar":"#table-toolbar",
		"columns":[
			{
				field: 'id',
		        title: 'id'
			},{
				field: 'userName',
				title: '姓名'
			},{
				field: 'age',
				title: '年龄'
			},{
				title: '操作',
				formatter:function(value,row,index) {
					return "<button class='btn btn-info btn-xs mr10' type='button' onclick='view(\""+row.id+"\")'>查看</button>"
						+ "<button class='btn btn-info btn-xs mr10' type='button' onclick='del(\""+row.id+"\")'>删除</button>"
						+ "<button class='btn btn-info btn-xs mr10' type='button' onclick='update(\""+row.id+"\")'>修改</button>";
				}
			}           
        ]
	});
	$(function(){
		
	});


	var vm = avalon.define({
		$id:"dataModel",
		vo:{},
		search : searchFunc,
		reset : resetFunc
	});
	avalon.scan();
	
	function searchFunc() {
		var params = JSON.stringify({"name":$("input[name='userName']").val()});
		TableInit.refresh({
			"formData" : params,
			"datatable":$("#dataTable"),
			"endpoint":"/dataTable/search"
		});
	}
	
	function resetFunc() {
		$("input[name='userName']").val("");
	}
	
	function view(id) {
		var winInfo = '<div class="box-body table-responsive no-padding">\
				<div class="form-group">\
				  	<label>id：</label>\
				  	<input type="text" readonly="true" id="v_id" />\
 				</div>\
 				<div class="form-group">\
				  	<label> 用户名：</label>\
				  	<input type="text" readonly="true" id="v_name" />\
 				</div>\
 				<div class="form-group">\
				  	<label> 密码：</label>\
				  	<input type="text" readonly="true" id="v_password" />\
 				</div>\
 				<div class="form-group">\
				  	<label> 年龄：</label>\
				  	<input type="text" readonly="true" id="v_age" />\
 				</div>\
			</div>';
		
		var url = contextPath + "/dataTable/show";
		var opt ={
			success:function(result){
				alert(result.info.id);
				$("#v_id").val(result.info.id);
				$("#v_name").val(result.info.userName);
				$("#v_password").val(result.info.password);
				$("#v_age").val(result.info.age);
			},
			data:{"id":id},
			endpoint:"",
			failure :function(){
				Tool.infoMessage("FAILURE!!!");
			}
		};
		Ajax.getRequest(url, opt);
		
		BootstrapDialog.show({
			title:"用户详情",
			closable:false,
			message:$(winInfo),
			onshown:function(){},
			buttons:[{
				label:"关闭",
				cssClass: 'btn-primary',
				action:function(dialogItself){
					dialogItself.close();
				}
			}]
		 });
	}
	
	function addUser() {
		skip("/pages/table/add.jsp",'','');
	}
	
	function update(id) {
		skip("/pages/table/add.jsp",'',id);
	}
	
	function del(id) {
		BootstrapDialog.confirm("你确定要删除吗？",function(result){
			if (result) {
				var opt = {
					success:function(result){
						var params = JSON.stringify({});
						TableInit.refresh({
							"formData" : params,
							"datatable":$("#dataTable"),
							"endpoint":"/dataTable/search"
						});
					},
					data:{'id':id},
					endpoint:"",
					failure :function(){
						BootstrapDialog.alert("删除失败");
					}
				};
				var url = contextPath + "/dataTable/del";
				Ajax.post(url, opt);
			}
		});
	}
</script>