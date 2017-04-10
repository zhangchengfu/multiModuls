<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
	<head>
		<title></title>
	</head>
	
	<body>
	
		<script type="text/javascript">
			var age = 29;
			window.color= "red";
			//在IE<9时抛出错误，在其他所有浏览器中都返回false
			delete window.age;
			//在IE<9时抛出错误，在其他所有浏览器中都返回true
			delete window.color;//return true
			//alert(window.age);//29
			//alert(window.color);//undefined
			//尝试访问未声明的变量会抛出错误，但通过查询window对象，可以知道某个可能未声明的变量是否存在
			//var newValue = oldValue;//error,因为oldValue未定义
			var newValue = window.oldValue;//不会抛错，这是一次属性查询，newValue的值是undefined
			//如果页面包含框架，每个框架都拥有自己的window对象，并且保存在frames集合中
			//取得页面视口的大小
			var pageWidth = window.innerWidth,
				pageHeight = window.innerHeight;
			
			if (typeof pageWidth != "number") {
				if (document.compatMode == "CSS1Compat") {
					pageWidth = document.documentElement.clientWidth;
					pageHeight = document.documentElement.clientHeight;
				} else {
					pageWidth = document.body.clientWidth;
					pageHeight = document.body.clientHeight;
				}
			}
			//window.open()导航到一个特定的URL，也可以打开一个新的浏览器窗口。接收四个参数：URL，窗口目标，一个特性字符串以及一个表示新页面是否取代浏览器历史记录中当前加载页面的布尔值
			//window.open("http://www.baidu.com","_blank");
			//特殊的窗口名称：_self,_parent,_top,_blank
			//第三个参数是一个用逗号分隔的设置字符串
			//fullscreen,yes或no,表示浏览器窗口是否最大化，仅限IE
			//height,数值，表示新窗口的高度，不能小于100
			//left,数值,表示新窗口的左坐标，不能是负值
			//location,yes或no,表示是否在浏览器窗口中显示地址栏
			//menubar,yes或no,表示是否在浏览器窗口中显示菜单栏，默认为no
			//resizable,yes或no,表示是否可以通过拖动浏览器窗口的边框改变其大小，默认为no
			//scrollbars,yes或no,表示如果内容在视口中显示不下，是否容许滚动，默认为no
			//status,yes或no,表示是否在浏览器窗口显示状态栏，默认为no
			//toolbar,yes或no,表示是否在浏览器窗口显示工具栏,默认为no
			//top,数值，表示新窗口的上坐标，不能是负值
			//width,数值，表示新窗口的宽度，不能小于100
			//window.open("http://www.baidu.com","_blank","height=400,width=400,top=10,left=10,resizable=yes");
			//var win = window.open("http://www.baidu.com","_blank","height=400,width=400,top=10,left=10,resizable=yes");
			//调整大小
			//win.resizeTo(500,500);
			//移动位置
			//win.moveTo(100,100);
			//关闭新打开的窗口
			//win.close();
			//新创建的window对象有一个opener属性，其中保存着打开它的原始窗口对象。这个属性只在弹出窗口中的最外层window对象（top）中有定义，而且指向调用window.open()的窗口和框架
			//var win = window.open("http://www.baidu.com","_blank","height=400,width=400,top=10,left=10,resizable=yes");
			//alert(win.opener == window);//true
			//弹出窗口屏蔽程序
			//如果是浏览器内置的屏蔽程序阻止的弹出窗口，那么window.open（）很可能会返回null，此时，检测返回的值就可以确定弹出窗口是否被屏蔽
			//if(win==null){alert("The popup was blocked");}
			//准确检测弹出窗口是否被屏蔽，将window.open()封装在try-catch块中
			var blocked = false;
			try {
				var win = window.open("http://www.baidu.com","_blank");
				if (win == null) {
					blocked = true;
				}
			} catch (ex) {
				blocked = true;
			}
			if (blocked) {
				//alert("The popup was blocked");
			}
			//间歇调用和超时调用
			//超时调用window.setTimeout(),接收二个参数：要执行的代码和以毫秒表示的时间
			//不建议传递字符串
			//setTimeout("alert('Hello world!')",1000);
			//推荐的调用方式
			var timeoutId = setTimeout(function(){
				//alert("Hello world!");
			},1000);
			//取消
			clearTimeout(timeoutId);
			//间歇调用，setInterval()
			var num = 0;
			var max = 10;
			var intervalId = null;
			function incrementNumber(){
				num++;
				//如果执行次数达到了max设定的值，则取消后续尚未执行的调用
				if (num == max) {
					clearInterval(intervalId);
					//alert("Done");
				}
			}
			intervalId = setInterval(incrementNumber,500);
			//系统对话框，alert(),confirm(),prompt()
			if (confirm("Are you sure?")) {
				alert("I'm so glad you're sure!");
			} else {
				alert("I'm sorry to hear you're not sure");
			}
			//prompt()方法接收二个参数：文本提示和默认值（可以是一个空字符串）
			var result = prompt("What is your name?","");
			if (result != null) {
				//alert("Welcome," + result);
			}
			
			//location对象
			//location即是window对象的属性，也是document对象的属性
			//下面列出了location对象的所有属性（省略了每个属性前面的location前缀）
			//属性名			例子								说明
			//hash			"#contents"						返回URL中的hash（#号后跟零或多个字符）,如果URL中不包含散列，则返回空字符串
			//host			"www.baidu.com:80"				返回服务器名称和端口号（如果有）
			//hostname		"www.baidu.com"					返回不带端口号的服务器名称
			//href			"http://www.baidu.com"			返回当前加载页面的完整URL，而location对象的toString（）方法也返回这个值
			//pathname		"/abc/"							返回URL中的目录和（或）文件名
			//port			"8080"							返回URL中指定的端口号，如果URL中不包含端口号，则这个属性返回空字符串
			//protocol		"http:"							返回页面使用的协议，通常是http:或https
			//search		"?q=javascript"					返回URL的查询字符串，这个字符串以问号开头
			//查询字符串参数
			function getQueryStringArgs(){
				//取得查询字符串并去掉开头的问号
				var qs = (location.search.length > 0 ? location.search.substring(1) : "");
				
				//保存数据的对象
				var args = {};
				
				//取得每一项
				var items = qs.length ? qs.split("&") : [];
				var item = null,name=null,value=null;
				
				//在for循环中使用
				var i = 0,len = items.length;
				
				//逐个将每一项添加到args对象中
				for (i = 0; i < len; i++) {
					item = items[i].split("=");
					name = decodeURIComponent(item[0]);
					value = decodeURIComponent(item[1]);
					if (name.length) {
						args[name] = value;
					}
				}
				return args;
			}
			//浏览器位置操作
			location.assign("http://www.sina.com");
			//下列二行代码与显示调用assign（)方法的效果一样
			window.location = "http://www.sina.com";
			location.href = "http://www.sina.com";
			//修改location对象的其他属性也可以改变当前加载的页面
			//假设初始URL为：http://www.baidu.com
			
			//将URL修改为:http://www.baidu.com#section1
			location.hash = "#section1";
			
			//将URL修改为:http://www.baidu.com?q=javascript
			location.search = "?q=javascript";
			
			//将URL修改为:http://www.sina.com
			location.hostname = "www.sina.com"
			
			//将URL修改为:http://www.sina.com:8080
			location.port = 8080;
			
			//每次修改location的属性（hash除外），页面都会以新URL重新加载
			
			//在调用replace（）方法之后，用户不能回到前一个页面
			location.replace("http://www.baidu.com");
			
			//重新加载当前显示的页面
			location.reload();//重新加载（有可能从缓存中加载）
			location.reload(true);//重新加载（从服务器重新加载）
			
			//navigator对象,识别客户端浏览器的事实标准
			//属性或方法			说明
			//cookieEnabled		表示cookie是否启用
			//javaEnabled()		表示当前浏览器是否启用了java
			//mimeTypes			在浏览器中注册的MIME类型数组,每个MimeType对象有4个属性：description,enabledPlugin,suffixes,type
			//plugins			浏览器中安装的插件信息的数组，包含属性：name:插件名称；description：插件描述；filename:插件的文件名；length:插件所处理的MIME类型数量
			
			//检测插件（在IE中无效）
			function hasPlugin(name) {
				name = name.toLowerCase();
				for (var i = 0;i < navigator.plugins.length;i++){
					if (navigator.plugins[i].name.toLowerCase().indexOf(name) > -1) {
						return true;
					}
				}
				return false;
			}
			//检测Flash
			//alert(hasPlugin("Flash"));
			//检测QuickTime
			//alert(hasPlugin("QuickTime"));
			
			//检测IE中的插件
			function hasIEPlugin(name) {
				try {
					new ActiveXObject(name);
					return true;
				} catch (e) {
					return false;
				}
			}
			//检测Flash
			alert(hasIEPlugin("ShockwaveFlash.ShockwaveFlash"));
			//检测QuickTime
			alert(hasIEPlugin("QuickTime.QuickTime"));
			
			//检测所有浏览器中的Flash
			function hasFlash(){
				var result = hasIEPlugin("Flash");
				if (!result) {
					result = hasIEPlugin("ShockwaveFlash.ShockwaveFlash");
				}
				return result;
			}
			//检测所有浏览器中的QuickTime
			function hasQuickTime(){
				var result = hasIEPlugin("QuickTime");
				if (!result) {
					result = hasIEPlugin("QuickTime.QuickTime");
				}
				return result;
			}
			//检测Flash
			alert(hasFlash());
			//检测QuickTime
			alert(hasQuickTime());
			
			
			//注册处理程序，registerContentHandler(),registerProtocolHandler(),
			//registerContentHandler()接收三个参数：要处理的MIME类型，可以处理该MIME类型的页面的URL以及应用程序的名称
			//下面例子，将一个站点注册为处理RSS源的处理程序
			navigator.registerContentHandler("application/rss+xml",
					"http://www.somereader.com?feed=%s","Some Reader");
			//registerProtocolHandler()接收三个参数:要处理的协议（如：mailto,ftp）,处理该协议的页面的URL和应用程序的名称
			navigator.registerProtocolHandler("mailto",
					"http://www.somemailclient.com?cmd=%s","Some Mail Client");
			
			//history对象
			//后退一页
			//history.go(-1);
			
			//前进一页
			//history.go(1);
			
			//前进两页
			//history.go(2);
			
			//跳转到最近的wrox.com页面
			//history.go("wrox.com");
			
			//后退一页
			//history.back();
			
			//前进一页
			//history.forward();
			
			if (history.length == 0) {
				//用户打开窗口后的第一个页面
			}
			
			//检测任何对象的某个特性是否存在
			function isHostMethod(object,property){
				var t = typeof object[property];
				return t=='function' || (!!(t == 'object' && object[property])) || t=='unknown';
			}
			
			//确定浏览器是否支持Netscape风格的插件
			var hasNSPlugins = !!(navigator.plugins && navigator.plugins.length);
			
			//确定浏览器是否具有DOM1级规定的能力
			var hasDOM1 = !!(document.getElementById && document.createElement && document.getElementsByTagName);
			
			//使用模块增强模式来封装检测脚本
			var client = function(){
				var engine = {
					//呈现引擎
					ie:0,
					gecko:0,
					webkit:0,
					khtml:0,
					opera:0,
					
					//具体的版本号
					ver:null
				};
				var browser = {
					//浏览器
					ie:0,
					firefox:0,
					safari:0,
					konq:0,
					opera:0,
					chrome:0,
					//具体的版本
					ver :null
				};
				//平台、设备和操作系统
				var system = {
						win:false,
						mac:false,
						x11:false,
						
						//移动设备
						iphone:false,
						ipod:false,
						ipad:false,
						ios:false,
						android:false,
						nokiaN:false,
						winMobile:false,
						
						//游戏系统
						wii:false,
						ps:false
				};
				
				//检测呈现引擎和浏览器
				var ua = navigator.userAgent;
				//第一步，识别Opera
				if (window.opera) {
					engine.ver = browser.ver = window.opera.version();
					engine.opera = browser.opera = parseFloat(engine.ver);
				} else if (/AppleWebKit\/(\S+)/.test(ua)) {
					//第二位检测的呈现引擎是WebKit
					engine.ver = RegExp["$1"];
					engine.webkit = parseFloat(engine.ver);
					
					//确定是Chrome还是Safari
					if (/Chrome\/(\S+)/.test(ua)) {
						browser.ver = RegExp["$1"];
						browser.chrome = parseFloat(browser.ver);
					} else if (/Version\/(\S+)/.test(ua)) {
						browser.ver = RegExp["$1"];
						browser.safari = parseFloat(browser.ver);
					} else {
						//近似地确定版本号
						var safariVersion = 1;
						if (engine.webkit < 100) {
							safariVersion = 1;
						} else if (engine.webkit < 312) {
							safariVersion = 1.2;
						} else if (engine.webkit < 412) {
							safariVersion = 1.3;
						} else {
							safariVersion = 2;
						}
						browser.safari = browser.ver = safariVersion;
					}
				} else if (/KHTML\/(\S+)/.test(ua) || /Konqueror\/([^;]+)/.test(ua)) {
					//第三步测试的呈现引擎是KHTML
					engine.ver = browser.ver = RegExp["$1"];
					engine.khtml = browser.konq = parseFloat(engine.ver);
				} else if (/rv:([^\)]+)\) Gecko\/\d{8}/.test(ua)) {
					//第四步检测Gecko
					engine.ver = RegExp["$1"];
					engine.gecko = parseFloat(engine.ver);
					
					//确定是不是Firefox
					if (/Firefox\/(\S+)/.test(ua)) {
						browser.ver = RegExp["$1"];
						browser.firefox = parseFloat(browser.ver);
					}
				} else if (/MSIE ([^;]+)/.test(ua)){
					//最后检测的呈现引擎IE
					engine.ver = browser.ver = RegExp["$1"];
					engine.ie = browser.ie = parseFloat(engine.ver);
				}
				
				//检测浏览器
				browser.ie = engine.ie;
				browser.opera = engine.opera;
				
				//检测平台
				var p = navigator.platform;
				system.win = p.indexOf("Win") == 0;
				system.mac = p.indexOf("Mac") == 0;
				system.x11 = (p.indexOf("X11") == 0) || (p.indexOf("Linux") == 0);
				
				//检测Windows操作系统
				if (system.win) {
					if (/Win(?:dows )?([^do]{2})\s?(\d+\.\d+)?/.test(ua)) {
						if (RegExp["$1"] == "NT") {
							switch(RegExp["$2"]) {
							case "5.0":
								system.win = "2000";
								break;
							case "5.1":
								system.win = "xp";
								break;
							case "6.0":
								system.win = "Vista";
								break;
							case "6.1":
								system.win = "7";
								break;
							default:
								system.win = "NT";
								break;
							}
						} else if (RegExp["$1"] == "9x") {
							system.win = "ME";
						} else {
							system.win = RegExp["$1"];
						}
					}
				}
				
				//移动设备
				system.iphone = ua.indexOf("iPhone") > -1;
				system.ipod = ua.indexOf("iPod") > -1;
				system.ipad = ua.indexOf("ipad") > -1;
				system.nokiaN = ua.indexOf("NokiaN") > -1;
				
				//windows mobile
				if (system.win == "CE") {
					system.winMobile = system.win;
				} else if (system.win == "Ph") {
					if (/Windows Phone OS (\d+.\d+)/.test(ua)) {
						system.win = "Phone";
						system.winMobile = parseFloat(RegExp["$1"]);
					}
				}
				
				//检测ios版本
				if (system.mac && ua.indexOf("Mobile") > -1) {
					if (/CPU (?:iPhone )?OS (\d+_\d+)/.test(ua)) {
						system.ios = parseFloat(RegExp.$1.replace("_","."));
					} else {
						system.ios = 2;//不能真正检测出来，所以只能猜测
					}
				}
				
				//检测Android版本
				if (/Android (\d+\.\d+)/.test(ua)) {
					system.android = parseFloat(RegExp.$1);
				}
				
				//游戏系统
				system.wii = ua.indexOf("Wii") > -1;
				system.ps = /playstation/i.test(ua);
				
				return {
					engine:engine,
					browser:browser,
					system:system
				};
			}();
			
			if (client.engine.ie) {//如果是IE，client.ie的值应该大于0
				//针对IE的代码
			} else if (client.engine.gecko > 1.5) {
				if (client.engine.ver == "1.8.1") {
					//针对这个版本执行某些操作
				}
			}
			
			//识别浏览器
			if (client.engine.webkit) {//if it's WebKit
				if (client.browser.chrome) {
					//执行针对Chrome的代码
				} else if (client.browser.safari) {
					//执行针对Safari的代码
				}
			} else if (client.engine.gecko) {
				if (client.browser.firefox) {
					//执行针对Firefox的代码
				} else {
					//执行针对其他Gecko浏览器的代码
				}
			}
			
			//识别平台，三大主流平台：Windows,Mac,Unix
			
			
		</script>
	</body>
</html>