;(function($,window,document,undefined){
	
	//自定义echarts图表jQuery插件
	$.fn.myEcharts = function(param){
		return this.each(function(){
			
			var $this = $(this);
			if (param.type == "bar") {// 柱状图
				// 路径配置
				require.config({
					paths: {
						echarts: "../static/js/echarts-2.2.7/build/dist"
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
						//柱状图option
						var barOption = {
							title:{},
							tooltip: {
		                        show: true
		                    },
		                    legend: {
		                        data:[]
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
		                    xAxis : [],
		                    yAxis : [],
		                    series : []
						};
						// 基于准备好的dom，初始化echarts图表
						var myChart1 = ec.init(document.getElementById($this.attr("id")));
						myChart1.setTheme("sccomunity");
						//转换数据
						if (null != param.content.series && param.content.series.length > 0 && 
								null != param.content.series[0].data && param.content.series[0].data.length > 0) {
							var _series = param.content.series;
							for (var i = 0; i < _series.length; i++) {
								var _serie = _series[i];
								var serie = {data:[]};
								serie.name = _serie.name;
								serie.type = "bar";
								var xAxis = {data:[]};
								xAxis.type = "category";
								var _legend = _serie.name;
								barOption.legend.data.push(_legend);//图例
								var yAxis = {type : 'value'};
								barOption.yAxis.push(yAxis);//纵轴数组
								for (var j = 0; j < _serie.data.length; j++) {
									var _data = _serie.data[j];
									xAxis.data.push(_data.name);
									serie.data.push(_data.value);
								}
								barOption.xAxis.push(xAxis);
								barOption.series.push(serie);
							}
							//标题
							if (null != param.content.title) {
								$.extend(barOption.title, param.content.title);
							}
							//自定义option
							if (null != param.option) {
								if (null != param.option.theme) {
									myChart1.setTheme(param.option.theme);// 主题
								}
								$.extend(true, barOption, param.option);
							}
							
							myChart1.setOption(barOption);
						}
					}
				);
			}
			
			if (param.type == "line") {// 折线图
				// 路径配置
				require.config({
					paths: {
						echarts: "../static/js/echarts-2.2.7/build/dist"
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
						//折线图option
						var lineOption = {
							title:{},
							tooltip:{
		                		trigger:'axis'
		                	},
		                	legend: {
		                        data:[]
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
	                	    xAxis : [],
	                	    yAxis : [],
	                	    series : []
						};
						// 基于准备好的dom，初始化echarts图表
						var myChart2 = ec.init(document.getElementById($this.attr("id")));
						myChart2.setTheme("sccomunity");
						//转换数据
						if (null != param.content.series && param.content.series.length > 0 && 
								null != param.content.series[0].data && param.content.series[0].data.length > 0) {
							var _series = param.content.series;
							for (var i = 0; i < _series.length; i++) {
								var _serie = _series[i];
								var serie = {data:[]};
								serie.name = _serie.name;
								serie.type = "line";
								var xAxis = {data:[]};
								xAxis.type = "category";
								xAxis.boundaryGap = false;
								var _legend = _serie.name;
								lineOption.legend.data.push(_legend);//图例
								var yAxis = {type : 'value'};
								lineOption.yAxis.push(yAxis);//纵轴数组
								for (var j = 0; j < _serie.data.length; j++) {
									var _data = _serie.data[j];
									xAxis.data.push(_data.name);
									serie.data.push(_data.value);
								}
								lineOption.xAxis.push(xAxis);
								lineOption.series.push(serie);
							}
							//标题
							if (null != param.content.title) {
								$.extend(lineOption.title, param.content.title);
							}
							//自定义option
							if (null != param.option) {
								if (null != param.option.theme) {
									myChart2.setTheme(param.option.theme);// 主题
								}
								$.extend(true, lineOption, param.option);
							}
							
							myChart2.setOption(lineOption);
						}
					}
				);
			}
			
			if (param.type == "pie") {// 饼图
				// 路径配置
				require.config({
					paths: {
						echarts: "../static/js/echarts-2.2.7/build/dist"
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
						//饼图option
						var pieOption = {
							title:{
								x:'center'
							},
							tooltip:{
		                		trigger:'item',
		                		formatter: "{a} <br/>{b} : {c} ({d}%)"
		                	},
		                	legend : {
		                		orient : 'vertical',
	                	        x : 'left',
	                	        data:[]
		                	},
		                	toolbox: {
	                	        show : true,
	                	        feature : {
	                	            mark : {show: true},
	                	            dataView : {show: true, readOnly: false},
	                	            restore : {show: true},
	                	            saveAsImage : {show: true}
	                	        }
	                	    },
	                	    calculable:false,
	                	    series : []
						};
						// 基于准备好的dom，初始化echarts图表
						var myChart3 = ec.init(document.getElementById($this.attr("id")));
						myChart3.setTheme("sccomunity");
						//转换数据
						if (null != param.content.series && param.content.series.length > 0 && 
								null != param.content.series[0].data && param.content.series[0].data.length > 0) {
							var _series = param.content.series;
							for (var i = 0; i < _series.length; i++) {
								var _serie = _series[i];
								var serie = {data:[]};
								serie.name = _serie.name;
								serie.type = "pie";
								serie.radius = '55%';
								serie.center = ['50%,60%'];
								for (var j = 0; j < _serie.data.length; j++) {
									var _data = _serie.data[j];
									pieOption.legend.data.push(_data.name);
									serie.data.push({value:_data.value, name:_data.name});
								}
								pieOption.series.push(serie);
							}
							//标题
							if (null != param.content.title) {
								$.extend(pieOption.title, param.content.title);
							}
							//自定义option
							if (null != param.option) {
								if (null != param.option.theme) {
									myChart3.setTheme(param.option.theme);// 主题
								}
								$.extend(true, pieOption, param.option);
							}
							
							myChart3.setOption(pieOption);
							
							var ecConfig = require('echarts/config');
							myChart3.on(ecConfig.EVENT.CLICK, clk);
							function clk(p){
								
								var seriesCli = param.content.series[p.seriesIndex];
								var itemCli = seriesCli.data[p.dataIndex];
								if (undefined != itemCli.child && itemCli.child.length > 0) {
									var s = myChart3.getSeries();
									pieOption.series[0].data = itemCli.child;
									var l = [];
									for (var k = 0; k < itemCli.child.length; k++) {
										var n = itemCli.child[k];
										l.push(n.name);
									}
									pieOption.legend.data = l;
									myChart3.clear();
									myChart3.setOption(pieOption);
									myChart3.refresh();
									var _da = itemCli.child;
									param.content.series[0].data = _da;
								}
							}
						}
					}
				);
			}
		});
	};
})(jQuery,window,document);
