<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<div id="TreeListGrid">
			
		</div>
		
		<script type="text/javascript">
			var TreeListGrid = $("#TreeListGrid");
			
			var TreeList = {
				initGridPanel: function(){
					return TreeListGrid.grid({
						identity:"id",
						isShowPages: false,
						url:contextPath+"/treeList/get",
						columns:[
							{title:'名称',name:'name',width:'70%'},
							{title:'操作',width:'30%',render:function(rowdata,name,index){
								return "<a>操作</a>";
							}}
			            ],
			            tree:{
			            	column:'name'
			            }
					}).on({
						
					});
				}
			};
			
			TreeList.initGridPanel();
		</script>
	</body>
	
</html>