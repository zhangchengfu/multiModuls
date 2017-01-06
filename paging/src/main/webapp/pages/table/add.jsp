<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/meta.jsp" %>

<form ms-controller="userModel">
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">
        		<div class="form-group col-md-4">
        			<div class="form-group">
        				<label>ID</label>
                        <p class="text-muted">
                        	<span class="Validform_checktip"></span>
                        	<input id="user_id" type="text" placeholder="" ms-attr-value="vo.id" readonly="readonly"/>
                        </p>
        			</div>
        		</div>
        		<div class="form-group col-md-4">
        			<div class="form-group">
        				<label>用户名</label>
                        <p class="text-muted">
                        	<span class="Validform_checktip"></span>
                        	<input id="userName_id" type="text" placeholder="" ms-attr-value="vo.userName" />
                       	</p>
        			</div>
        		</div>
        		<div class="form-group col-md-4">
                </div>
        	</div>
        	<div class="row">
        		<div class="form-group col-md-4">
        			<div class="form-group">
        				<label>密码</label>
                        <p class="text-muted">
                        	<span class="Validform_checktip"></span>
                        	<input id="password_id" type="text" placeholder="" ms-attr-value="vo.password" />
                        </p>
        			</div>
        		</div>
        		<div class="form-group col-md-4">
        			<div class="form-group">
        				<label>年龄</label>
                        <p class="text-muted">
                        	<span class="Validform_checktip"></span>
                        	<input id="age_id" type="text" placeholder="" ms-attr-value="vo.age" />
                       	</p>
        			</div>
        		</div>
        		<div class="form-group col-md-4">
                </div>
        	</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="searchBox" style="text-align: right;">
					<button type="button" class="btn btn-primary fr" ms-click="goback" id="goback_id">返回</button>
					<button type="button" class="btn btn-primary fr" ms-click="save">保存</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	var id = getSkipParam();
	
	
	var vm = avalon.define({
		$id : "userModel",
		vo : {
	
		},
		goback:gobackfunc,
		save:saveFunc
	});
	avalon.scan();
	
	$(function(){
		if ($.trim(id) != "") {
			var opt = {};
			var url = contextPath + "/dataTable/show";
			opt ={
					success:function(result){
						vm.vo = result.info;
						avalon.scan();
				},
				data:{id:id},
				endpoint:"",
				failure :function(){
					Tool.infoMessage("FAILURE!!!");
				}
			};
			Ajax.getRequest(url, opt);
		
		}
	});
	
	
	function gobackfunc() {
		skip("/pages/table/datatable.jsp",'');
	}
	
	function saveFunc() {
		var opt = {};
		var url = contextPath + "/dataTable/save";
		var param = {};
		if ($.trim($("#user_id").val()) == "") {
			param.id = 0;
		} else {
		
			param.id = $("#user_id").val();
		}
		param.userName = $("#userName_id").val();
		param.password = $("#password_id").val();
		param.age = $("#age_id").val();
		opt ={
				success:function(result){
					if(result.rst == 0) {
						BootstrapDialog.alert(result.msg);
					} else {
						skip("/pages/table/datatable.jsp",'','');
					}
			},
			data:param,
			endpoint:"",
			failure :function(){
				Tool.infoMessage("FAILURE!!!");
			}
		};
		Ajax.getRequest(url, opt);
	}
</script>