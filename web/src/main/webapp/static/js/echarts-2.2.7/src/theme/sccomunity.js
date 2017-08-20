define(function() {

var theme = {
    // 默认色板
    color: [
        '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#27727B'          // 主标题文字颜色
        }
    },

    // 值域
    dataRange: {
        x:'right',
        y:'center',
        itemWidth: 5,
        itemHeight:25,
        color:['#C1232B','#FCCE10']
    },

    toolbox: {
        color : [
            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD'
        ],
        effectiveColor : '#ff4500'
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(50,50,50,0.5)',     // 提示背景颜色，默认为透明度为0.7的黑色
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#27727B',
                type: 'dashed'
            },
            crossStyle: {
                color: '#27727B'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: 'rgba(181,195,52,0.3)',            // 数据背景颜色
        fillerColor: 'rgba(181,195,52,0.2)',   // 填充颜色
        handleColor: '#27727B'    // 手柄颜色
    },

    // 网格
    grid: {
        borderWidth:0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#27727B'
            }
        },
        splitLine: {           // 分隔线
            show: false
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        splitArea : {
            show: false
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#ccc'],
                type: 'dashed'
            }
        }
    },


    timeline : {
        lineStyle : {
            color : '#27727B'
        },
        controlStyle : {
            normal : { color : '#27727B'},
            emphasis : { color : '#27727B'}
        },
        symbol : 'emptyCircle',
        symbolSize : 3
    },

    // 折线图默认参数
    line: {
        itemStyle: {
            normal: {
                borderWidth:2,
                borderColor:'#fff',
                lineStyle: {
                    width: 3
                }
            },
            emphasis: {
                borderWidth:0
            }
        },
        symbol: 'circle',  // 拐点图形类型
        symbolSize: 3.5           // 拐点图形大小
    },



    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#27727B'
                }
            }
        }
    },
    
    // 饼图默认参数
    pie: {
        center : ['50%', '50%'],    // 默认全局居中
        radius : [0, '75%'],
        clockWise : false,          // 默认逆时针
        startAngle: 90,
        minAngle: 0,                // 最小角度改为0
        selectedOffset: 10,         // 选中是扇区偏移量
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                label: {
                    show: true,
                    position: 'outer'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                labelLine: {
                    show: true,
                    length: 20,
                    lineStyle: {
                        // color: 各异,
                        width: 1,
                        type: 'solid'
                    }
                }
            },
            emphasis: {
                // color: 各异,
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                label: {
                    show: false
                    // position: 'outer'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                labelLine: {
                    show: false,
                    length: 20,
                    lineStyle: {
                        // color: 各异,
                        width: 1,
                        type: 'solid'
                    }
                }
            }
        }
    },


    gauge : {
        center:['50%','80%'],
        radius:'100%',
        startAngle: 180,
        endAngle : 0,
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#B5C334'],[0.8, '#27727B'],[1, '#C1232B']],
                width: '40%'
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 2,   // 每份split细分多少段
            length: 5,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#fff'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#fff',
                fontWeight:'bolder'
            }
        },
        splitLine: {           // 分隔线
            length: '5%',         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: '#fff'
            }
        },
        pointer : {
            width : '40%',
            length: '80%',
            color: '#fff'
        },
        title : {
          offsetCenter: [0, -20],       // x, y，单位px
          textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            color: 'auto',
            fontSize: 20
          }
        },
        detail : {
            offsetCenter: [0, 0],       // x, y，单位px
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto',
                fontSize: 40
            }
        }
    },

    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

    return theme;
});
