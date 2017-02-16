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
		
		<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	</head>
	
	
	<body>
		
		<form class="form-horizontal" id="uploadForm">
			<div class="form-group">
				<label class="col-sm-2 control-label">TEST</label>
				<div class="col-sm-10">
					<p class="form-control-static">TEST</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-2 control-label">图片:</label>
				<div class="col-lg-4">
					<div class="input-group" style="width: 100%;">
					    <input id="uploadID"  readonly type="text" class="form-control" style="width:100%;" placeholder="上传图片">
					    <input hidden="true" name="attachementId" id="attachmentIdID">
					    <span class="input-group-btn">
					    	<button class="btn btn-default" type="button" id="uploadImgBtnID">上传</button>
					    </span>
				    </div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-1"></div>
				<ul id = "image_ulID" class="col-lg-10" >
				</ul>
			</div>
		</form>
		
		
		<script type="text/javascript">
			var contextPath = "<%=contextPath%>";
			var form = $("#uploadForm");
			
			var UploadImg = {};
			UploadImg.removeImage = function(el) {
				$(el).parents("li").remove();
			}
			
			$(function(){
				form.find("#uploadImgBtnID").on('click',function(){
					var imgNum = form.find(".uploadImage").length;
					if(imgNum>=1){
						alert("最多上传1张");
						return;
					} else {
						$.uploadImg(imgCallback);
					}
				});
				
				var imgCallback = function(res){
					if (!!res) {
						var ightml = "<li class=\"col-lg-3\"  " + "><img "+" src='"+res+"' style='height:100px;width:200px;' ><br /><div style='text-align:center;'><a "+" onclick='UploadImg.removeImage(this)'>删除</a></div>";
						ightml += "<input class=\"uploadImage\" id='"+res+"' value='"+res+"' type=\"hidden\"/></li>";
						form.find("#image_ulID").append(ightml);
					}
				}
				
				//获取图片地址
				//form.find(".uploadImage").val();
				
			});
			
		</script>
	</body>
</html>