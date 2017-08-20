<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@include file="/jsp/header.jsp" %> --%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>

<html>
	
	<head>
		<meta charset="utf-8">
		<title>ECharts</title>
	</head>
	
	<body>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    	<div id="main" style="height:400px"></div>
    	<div id="main2" style="height:400px"></div>
    	<div id="main3" style="height:400px"></div>
    	
    	<!-- ECharts单文件引入 -->
    	<script src="<%=contextPath%>/static/js/echarts-2.2.7/build/dist/echarts.js"></script>
    	<!-- <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script> -->
    	<script type="text/javascript">
	    	// 路径配置
	        require.config({
	            paths: {
	                echarts: "<%=contextPath%>/static/js/echarts-2.2.7/build/dist"
	            }
	        }); 
	    	
	    	
	     	// 使用
	     	require(
	            [
	                'echarts',
	                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
	                'echarts/chart/line',
	                'echarts/chart/pie'
	            ],
	            function (ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main')); 
	                
	                var option = {
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['销量']
	                    },
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"销量",
	                            "type":"bar",
	                            "data":[5, 20, 40, 10, 10, 20]
	                        }
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	                
	                var myChart2 = ec.init(document.getElementById('main2'));
	                var option2 = {
	                	title:{
	                		text:'未来一周天气变化',
	                		subtext:'纯属虚构'
	                	},
	                	tooltip:{
	                		trigger:'axis'
	                	},
	                	legend:{
	                		data:['最高气温']
	                	},
	                	toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable:true,
                	    xAxis:[
                	    	{
                	    		type : 'category',
                	            boundaryGap : false,
                	            data : ['周一','周二','周三','周四','周五','周六','周日']
                	    	}       
                	    ],
                	    yAxis:[
                	    	{
                	    		type:'value'
                	    	}       
                	    ],
                	    series:[
                	        {
	                	    	name:'最高气温',
	                	    	type:'line',
	                	    	data:[11, 11, 15, 13, 12, 13, 10]
                	        }
                	    ]
	                };
	                myChart2.setOption(option2);
	                
	                var myChart3 = ec.init(document.getElementById('main3'));
	                var option3 = {
	                	title:{
	                		text:'某站点用户访问来源',
	                		subtext:'纯属虚构',
	                		x:'center'
	                	},
	                	tooltip:{
	                		trigger:'item',
	                		formatter: "{a} <br/>{b} : {c} ({d}%)"
	                	},
	                	legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series:[
                	    	{
                	    		name:'访问来源',
                	    		type:'pie',
                	    		radius:'55%',
                	    		center:['50%,60%'],
                	    		data:[
                	    			{value:335, name:'直接访问', child:[{value:10,name:'搜狗'},{value:90,name:'百度'},{value:10,name:'谷歌'}]},
                	                {value:310, name:'邮件营销'},
                	                {value:234, name:'联盟广告'},
                	                {value:135, name:'视频广告'},
                	                {value:1548, name:'搜索引擎'}
                	    		]
                	    	}        
                	    ]
	                };
	                
	                myChart3.setOption(option3);
	                var ecConfig = require('echarts/config');
	                var myChart31;
	                myChart3.on(ecConfig.EVENT.CLICK, function(param){
	                	debugger;
	                	var child = param.data.child;
	                	option3.data = child;
	                	var zrender = myChart3.getZrender();
	                	//myChart3 = ec.init(document.getElementById('main3')).setOption(option3);
	                	//myChart3.refresh();
	                	//myChart3 = ec.init(document.getElementById('main3'));
	                	//myChart3.setOption(option3);
	                });
	            }
	        );
	        
	     	/* // 基于准备好的dom，初始化echarts图表
	        var myChart = echarts.init(document.getElementById('main')); 
	        var option = {
                tooltip: {
                    show: true
                },
                legend: {
                    data:['销量']
                },
                xAxis : [
                    {
                        type : 'category',
                        data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        "name":"销量",
                        "type":"bar",
                        "data":[5, 20, 40, 10, 10, 20]
                    }
                ]
            };
	        myChart.setOption(option); */
    	</script>
	</body>
</html>