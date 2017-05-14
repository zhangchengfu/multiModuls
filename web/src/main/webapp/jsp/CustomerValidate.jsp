<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>自定义验证</title>
		<style type="text/css">
			.form-error-border{
				border: 1px solid rgba(247, 158, 20, 0.5)!important;
				box-shadow: 0 0 2px rgba(242, 29, 12, 0.8);
			  	-webkit-box-shadow: 0 0 2px rgba(242, 29, 12, 0.8);
			  	-moz-box-shadow: 0 0 2px rgba(242, 29, 12, 0.8);
			  	-ms-box-shadow: 0 0 2px rgba(242, 29, 12, 0.8);
			  	-o-box-shadow: 0 0 2px rgba(242, 29, 12, 0.8);
				animation:errorBorder 0.2s 3 alternate;
				-webkit-animation:errorBorder 0.2s 3 alternate;
				-moz-animation:errorBorder 0.2s 3 alternate;
				-ms-animation:errorBorder 0.2s 3 alternate;
				-o-animation:errorBorder 0.2s 3 alternate;
			}
		</style>
	</head>
	<body>
		<div>
			<!-- form表单 -->
			<form id="test">
				<div class="row">
					<label class="col-sm-2 control-label"><span class="required">*</span>名称:</label>
					<div class="col-sm-3">
						<input name="name"  style="display: inline;" autocomplete="off"
							class="form-control" type="text"  maxlength="255"/>
					</div>
					<!-- autocomplete="off"：不能由于双击而弹出以前有输入的记录 -->
					<label class="col-sm-2 control-label"><span class="required">*</span>数字:</label>
					<div class="col-sm-3">
						<input name="num"  style="display: inline;"
							class="form-control" type="text"  maxlength="255"/>
					</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2 control-label"><span class="required">*</span>邮政编码:</label>
					<div class="col-sm-3">
						<input name="post"  style="display: inline;"
							class="form-control" type="text"  maxlength="255"/>
					</div>
					
					<label class="col-sm-2 control-label"><span class="required">*</span>电话:</label>
					<div class="col-sm-3">
						<input name="phone"  style="display: inline;"
							class="form-control" type="text"  maxlength="255"/>
					</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2 control-label"><span class="required">*</span>电子邮件:</label>
					<div class="col-sm-3">
						<input name="email"  style="display: inline;"
							class="form-control" type="text"  maxlength="255"/>
					</div>
					
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon">时间：</span>
							<div >
					            <div class="input-group date form_datetime" style="width:100px;float:left;" id="pubTimeStart">
					                <input type="text" class="form-control" style="width:100px;" name="startDateFormat" id="createDateStartID" readonly="readonly">
					                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
					            </div>
					            <div style="float:left; width:10px; margin-left:auto; margin-right:auto;">&nbsp;-&nbsp;</div>
					            <div class="input-group date form_datetime" style="width:120px;float:left;" id="pubTimeEnd">
					                <input type="text" class="form-control" style="width:120px;" name="endDateFormat" id="createDateEndID" readonly="readonly" >
					                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
					            </div>
				       		</div>
						
		                </div>
					</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2 control-label">审核是否通过:</label>
					<div class="col-lg-9">
						<input id="approveID" name="isApprove" style="margin-top: 12px;" type="radio" value="true" checked="checked">  通过</input>
						<input id="rejectID" name="isApprove" style="margin-top: 12px;" type="radio" value="false">  驳回</input>
						<input id="approve" type="hidden" name="approve" />
					</div>
				</div>
				
				<div class="row">	
					<label class="col-lg-2 control-label">审核意见:</label>
					<div class="col-lg-6"  id="approveResultDivID">
						<input name="approveResult" style="display:inline; width:100%;" class="form-control"  type="text" id="approveResultID" maxlength="50"/>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-9">
											
					</div>
					<div class="col-sm-3">
						<button id="save" type="button" class="btn btn-primary  ">
								<span class="glyphicon glyphicon-search"></span>查询
						</button>	
					</div>
				</div>
				
				<div class="error-tip" style="margin-top:-16px;display:none">
	                <p class="error"></p>
	            </div>
			</form>
		</div>
		<script type="text/javascript">
			$.validator.addMethod("phoneCheck",function(value,element,params){
				var checkPhone = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[0-9])|(18([0-3]|[5-9])))\d{8}$/;
				var checkTel = /^(0\d{2}-\d{8}(-\d{1,4})?)|(0\d{3}-\d{7,8}(-\d{1,4})?)$/;
				return this.optional(element)||(checkPhone.test(value)||(checkTel.test(value)));
			},"联系电话格式有误！");
			
			jQuery.validator.addMethod("positiveNum", function (value, element){
				var posNum = /^(?:\d+|-?\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/;
				return this.optional(element) || (posNum.test(value));
			}, "请输入正数");
		
			var form = $("#test");
			form.validate({
				rules:{
					name:{
						required:true
					},
					num:{
						required:true,
						positiveNum:true
					},
					post:{
						required:true,
						postcode:true
					},
					phone:{
						required:true,
						phoneCheck:true
					},
					email:{
						required:true,
						email:true
					},
					startDateFormat:{
						required:true
					},
					endDateFormat:{
						required:true
					}
				},
				errorPlacement: function(error, element) {
		            if ($("p.error").find("label:visible").length <= 0) {
		                error.appendTo(form.find("p.error"));
		            }
		        },
		        highlight: function(element, errorClass) {
		            $(element).addClass("form-error-border");
		        },

		        unhighlight: function(element, errorClass) {
		            $(element).removeClass("form-error-border");
		        }
			});
			
			$("#pubTimeStart").datetimepicker({
				language: 'zh-CN',
	            format: "yyyy-mm-dd",//"yyyy-mm-dd HH:ii:00"
	            autoclose: true,
	            todayBtn: true,
	            minView: 2,
	            maxView: 1,
	            pickerPosition: 'bottom-left'
			}).on('changeDate', function(ev){
				$("#pubTimeEnd").datetimepicker('setStartDate', $(ev.target).find("input").val());
			});
			$("#pubTimeEnd").datetimepicker({
				language: 'zh-CN',
	            format: "yyyy-mm-dd",
	            autoclose: true,
	            todayBtn: true,
	            minView: 2,
	            maxView: 1,
	            pickerPosition: 'bottom-left'
			}).on('changeDate', function(ev){
				$("#pubTimeStart").datetimepicker('setEndDate', $(ev.target).find("input").val());
			});
			form.find("#save").on("click",function(event){
				if (!form.valid()) {
					return;
				}
			});
			form.find("#approveID").on('click',function(event){
				if(this.checked){
					form.find("#approveResultID").rules("remove","required");
		    		form.find("#approveResultID").valid();
		    		$("#approveResultDivID").removeClass('has-error')
				}
			});
			form.find("#rejectID").on('click',function(event){
				if (this.checked){
					form.find("#approveResultID").rules("add",{required:true});
				}
			});
			
		</script>
	</body>
</html>