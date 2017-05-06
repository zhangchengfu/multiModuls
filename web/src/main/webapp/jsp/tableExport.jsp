<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<!-- 
			tableExport.jquery.plugin
			
			Export HTML Table to
			.JSON
			.XML
			.PNG
			.CSV
			.TXT
			.SQL
			.MS-Word
			.MS-Excel
			.Ms-Powerpoint
			.PDF
			
			Installation
		 -->
		 <!-- jquery Plugin -->
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/tableExport.js"></script>
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/jquery.base64.js"></script>
		 <!-- PNG Export -->
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/html2canvas.js"></script>
		 <!-- PDF Export -->
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/jspdf/libs/sprintf.js"></script>
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/jspdf/jspdf.js"></script>
		 <script type="text/javascript" src="<%=contextPath%>/static/tableExport.jquery.plugin/jspdf/libs/base64.js"></script>
		 <!-- Usage -->
		 <!-- onClick ="$('#tableID').tableExport({type:'pdf',escape:'false'});" -->
		 <!-- Options -->
		 <!-- 
		 	separator: ','
			ignoreColumn: [2,3],
			tableName:'yourTableName'
			type:'csv'
			pdfFontSize:14
			pdfLeftMargin:20
			escape:'true'
			htmlContent:'false'
			consoleLog:'false' 
		  -->
	</head>
	<body>
		<input type="button" value="export" />
		<table id="exportTable" border="2">
			<tr>
				<td>head1</td><td>head2</td><td>head3</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
			<tr>
				<td>test</td><td>test</td><td>test</td>
			</tr>
		</table>
		
		<script type="text/javascript">
			$(function(){
				$(':button').on('click',function(){
					$("#exportTable").tableExport({type:'pdf',escape:'false'});
				});
				
			});
		</script>
	</body>
</html>