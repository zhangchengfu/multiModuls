<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	
	<body>
		<div style="width:98%;margin-right:auto; margin-left:auto; padding-top: 15px;" >
			<div class="modal-body form-body">
				<div class="row" style="margin-bottom:10px;">
					<label class="col-sm-2 control-label">发布时间:</label>
					<div class="col-sm-3">
						<div class="input-group date form_datetime" style="width:80%;float:left;" id="startTimeDIV">
							<input type="text" class="form-control" readonly style="width:100%;"  name="releaseDateFormat" id="startTimeID"/>
	                		<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						</div>
					</div>
				</div>
				
				<div class="row" style="margin-bottom:10px;">
					<label class="col-sm-2 control-label">发布时间:</label>
					<div class="col-sm-3">
						<div class="input-group date form_datetime" id="startTimeStart">
							<input type="text" class="form-control" readonly="readonly"
										name="createDateStart" id="createDateStart" placeholder="请输入发布开始时间" />
							<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						</div>
					</div>
					
					<label class="col-sm-2 control-label">发布结束时间:</label>
					<div class="col-sm-3">
						<div class="input-group date form_datetime" id="startTimeEnd">
							<input type="text" class="form-control" readonly="readonly"
										name="createDateEnd" id="createDateEnd" placeholder="请输入发布结束时间" />
							<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$("#startTimeDIV").datetimepicker({
		        language: 'zh-CN',
		        format: "yyyy-mm-dd HH:ii:ss",
		        autoclose: true,
		        todayBtn: true,
		        minView: 0,
		        maxView: 1,
		        pickerPosition: 'bottom-left'
		    }).on('changeDate', function(){
		    	$("#startTimeDIV").datetimepicker("releaseDateFormat", new Date());
		    	$(this).removeClass('has-error');
		    	$("#releasetime-error").remove();
		    });
			
			DateTimePickerUtil.dateInterval($("#startTimeStart"), $("#startTimeEnd"));
		</script>
	</body>
</html>