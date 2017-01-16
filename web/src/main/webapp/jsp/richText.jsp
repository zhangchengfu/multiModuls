<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
%>

<html>
	<head>
		<title></title>
		
		<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-1.11.0.min.js"></script>
		
	</head>
	
	<body>
		<form action="">
			<div>
				<textarea name="txt" id="txtId" style="display: inline; width: 94%;"
						rows="30" maxlength="10000">
					</textarea>
			
			</div>
		</form>
		<script type="text/javascript"  src="<%=contextPath%>/ueditor/ueditor.config.js"></script>
		<script type="text/javascript"  src="<%=contextPath%>/ueditor/ueditor.all.min.js"></script>
		
		<script type="text/javascript">
			var contextPath = "<%=contextPath%>";
		
			var toolbars = [[
			                 'fullscreen', 'source', '|', 'undo', 'redo', '|',
			                 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
			                 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
			                 'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
			                 'directionalityltr', 'directionalityrtl', 'indent', '|',
			                 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
			                 'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
			                 'simpleupload', 'emotion', 'scrawl', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
			                 'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
			                 'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
			                 'print', 'preview', 'searchreplace', 'help', 'drafts'
			             ]];
			
			var ue = UE.getEditor('txtId', {
				toolbars:toolbars
			});
		
			//自定义富文本上传
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
			    if (action == 'uploadimage') {
			    	//图片
			        return contextPath + "/richText/upload";
			    } else if (action == 'uploadfile') {
			    	//附件
			        return contextPath + "/richText/upload";
			    } else {
			        return this._bkGetActionUrl.call(this, action);
			    }
			}
			
			$(function(){
				ue.ready(function(){
					
					ue.setContent("初始化...");
				});
			});
		</script>		
	</body>
</html>