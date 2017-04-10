<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
	
		<script type="text/javascript">
			//数组迭代方法
			//every():对数组中的每一项运行给定函数，如果该函数对每一项都返回true，则返回true
			//filter():对数组中的每一项运行给定函数，返回该函数会返回true的项组成的数组
			//forEach():对数组中的每一项运行给定函数，没有返回值
			//map():对数组中的每一项运行给定函数，返回每次函数调用的结果组成的数组
			//some()；对数组中的每一项运行给定函数，如果该函数对任一项返回true,则返回true
			var numbers2 = [1,2,3,4,5,4,3,2,1];
			var everyResult = numbers2.every(function(item,index,array){
				return item > 2;
			});
			//alert(everyResult);//false
			var someResult = numbers2.some(function(item,index,array){
				return item > 2;
			});
			//alert(someResult);//true
			var filterResult = numbers2.filter(function(item,index,array){
				return item > 2;
			});
			//alert(filterResult);//[3,4,5,4,3]
			var mapResult = numbers2.map(function(item,index,array){
				return item * 2;
			});
			//alert(mapResult);//[2,4,6,8,10,8,6,4,2]
			numbers2.forEach(function(item,index,array){
				//执行某些操作
			});
			//数组缩小方法，reduce(),reduceRight()
			var values = [1,2,3,4,5];
			var sum = values.reduce(function(prev,cur,index,array){
				return prev + cur;
			});
			//alert(sum);//15
			var sum2 = values.reduceRight(function(prev,cur,index,array){
				return prev + cur;
			});
			//alert(sum2);//15
			//日期
			var now = new Date();
			var someDate = new Date(Date.parse("yyyy-MM-dd HH:mm:ss"));
			var start = Date.now();//取得当前时间
			//正则表达式,RegExp,  var expression = /pattern/flags,flags:g,全局模式；i,不区分大小写；m,多行模式
			//字面量
			var pattern1 = /at/g;//匹配字符串中所有"at"的示例
			var pattern2 = /[bc]at/i;//匹配第一个”bat“或”cat“，不区分大小写
			var pattern3 = /.at/gi;//匹配所有以"at"结尾的3个字符的组合，不区分大小写
			//正则表达式的元字符：()[]{}\^$|?+.
			var pattern4 = /\[bc\]at/i;//匹配第一个”[bc]at“,不区分大小写
			var pattern5 = /\.at/gi;//匹配所有”.at“,不区分大小写
			//使用RegExp构造函数
			var pattern6 = new RegExp("[bc]at","i");
			//RegExp实例方法，exec()
			var text = "mom and dad and baby";
			var pattern7 = /mom( and dad( and baby)?)?/gi;
			var matches = pattern7.exec(text);
			//alert(matches.index);//0
			//alert(matches.input);//"mom and dad and baby"
			//alert(matches[0]);//"mom and dad and baby"
			//alert(matches[1]);//" and dad and baby"
			//alert(matches[2]);//" and baby"
			//RegExp实例方法，test()
			var text2 = "000-00-0000";
			var pattern8 = /\d{3}-\d{2}-\d{4}/;
			if (pattern8.test(text2)) {
				//alert("The pattern was matched.");
			}
			//Function
			//1,函数声明语法定义
			function sum(num1,num2) {
				return num1 + num2;
			}
			//2，函数表达式
			var sum2 = function(num1,num2) {
				return num1 + num2;
			}
			//3,Function构造函数
			var sum3 = new Function("num1","num2","return num1 + num2");//不推荐
			//作为值的函数,将一个函数作为另一个函数的结果返回
			function createComparisonFunction(propertyName) {
				return function(object1,object2){
					var value1 = object1[propertyName];
					var value2 = object2[propertyName];
					if (value1 < value2) {
						return -1;
					} else if (value1 > value2) {
						return 1;
					} else {
						return 0;
					}
				}
			}
			var data = [{name:"Zachary",age:28},{name:"Nicholas",age:29}];
			data.sort(createComparisonFunction("name"));
			//alert(data[0].name);//Nicholas
			data.sort(createComparisonFunction("age"));
			//alert(data[0].name);//Zachary
			//函数内部属性，arguments对象有callee属性，该属性是一个指针，指向拥有这个arguments对象的函数
			function factorial1(num) {
				if (num <= 1) {
					return 1;
				} else {
					return num * factorial1(num-1);
				}
			}
			function factorial2(num) {
				if (num <= 1) {
					return 1;
				} else {
					return num * arguments.callee(num - 1);
				}
			}
			//this,函数执行的环境对象
			window.color = "red";
			var o = {color:"blue"};
			function sayColor() {
				//alert(this.color);
			}
			sayColor();//"red"
			o.sayColor= sayColor;
			o.sayColor();//"blue"
			//caller,这个属性中保存着调用当前函数的函数的应用
			function outer(){
				inner();
			}
			function inner(){
				//alert(inner.caller);//或者，arguments.callee.caller
			}
			outer();
			//函数属性：length
			function sum(num1,num2) {
				return num1 + num2;
			}
			//alert(sum.length);//2
			//函数属性：prototype
			//每个函数都包含二个非继承而来的方法：apply()和call()。用途是在特定的作用域调用函数。apply()二个参数，一个是作用域，另一个是参数数组。call()第一个参数是this值，其余参数直接传递给函数
			function callSum1(num1,num2){
				return sum.apply(this,arguments);//传入arguments对象
			}
			function callSum2(num1,num2){
				return sum.apply(this,[num1,num2]);//传入数组
			}
			function callSum3(num1,num2) {
				return sum.call(this,num1,num2);
			}
			//扩充函数赖以运行的作用域
			var color = "red";
			var o = {color:"blue"};
			function sayColor(){
				//alert(this.color);
			}
			sayColor();//red
			sayColor.call(this);//red
			sayColor.call(window);//red
			sayColor.call(o);//blue
			//bind(),创建一个函数的实例，其this值会被绑定到传给bind()函数的值
			var objectSayHello = sayColor.bind(o);
			objectSayHello();//blue
			//Number
			//toFixed()按照指定的小数位返回数值的字符串表示
			var num = 10;
			//alert(num.toFixed(2));//"10.00"
			//toExponential(),指数表示法（e表示法）
			//alert(num.toExponential(1));//"1.0e+1"
			//toPrecision()
			var num = 99;
			//alert(num.toPrecision(1));//"1e+2"
			//alert(num.toPrecision(2));//"99"
			//alert(num.toPrecision(3));//"99.0"
			//String
			//charAt()
			var stringValue= "hello world";
			//alert(stringValue.charAt(1));//"e"
			//concat(),用于将一或多个字符串拼接起来，返回拼接得到的新字符串
			var stringValue = "hello ";
			var result = stringValue.concat("world");
			//alert(result);//"hello world"
			//alert(stringValue);//"hello"
			//slice(),substr(),substring()
			var stringValue = "hello world";
			//alert(stringValue.slice(3));//"lo world"
			//alert(stringValue.substring(3));//"lo world"
			//alert(stringValue.substr(3));//"lo world"
			//alert(stringValue.slice(3,7));//"lo w"
			//alert(stringValue.substring(3,7));//"lo w"
			//alert(stringValue.substr(3,7));//"lo worl"
			//indexOf(),lastIndexOf()
			//alert(stringValue.indexOf("o"));//4
			//alert(stringValue.lastIndexOf("o"));//7
			//trim()
			var stringValue = "   hello world   ";
			var trimmedStringValue = stringValue.trim();
			//alert(stringValue);//"   hello world   "
			//alert(trimmedStringValue);//"hello world"
			//字符串大小写转换方法，toLowerCase(),toUpperCase()
			//字符串的模式匹配方法
			//match
			var text = "cat,bat,sta,fat";
			var pattern = /.at/;
			//与pattern.exec(text)相同
			var matches = text.match(pattern);
			//alert(matches.index);//0
			//alert(matches[0]);//"cat"
			//alert(pattern.lastIndex);//0
			//search(),返回字符串第一个匹配项的索引；如果没有找到匹配项，则返回-1
			var pos = text.search(/at/);
			//alert(pos);//1
			//replace()方法
			var text = "cat,bat,sat,fat";
			var result = text.replace("at","ond");
			//alert(result);//"cond,bat,sat,fat"
			result = text.replace(/at/g,"ond");
			//alert(result);//"cond,bond,sond,fond"
			//replace()方法的第二个参数也可以是一个函数，在只有一个匹配项的情况下，会向这个函数传递3个参数：模式匹配项，模式匹配项在字符串中的位置和原始字符串
			function htmlEscape(text) {
				return text.replace(/[<>"&]/g, function(match,pos,originalText){
					switch(match) {
					case "<":
						return "&lt;";
					case ">":
						return "&gt;";
					case "&":
						return "&amp;";
					case "\"":
						return "&quot;";
					}
				});
			}
			//alert(htmlEscape("<p class=\"greeting\">Hello world!</p>"));
			//&lt;p class=&quot:greeting&quot;&gt;Hello world!&lt;/p&gt;
			//split()
			var colorText = "red,blue,green,yellow";
			var colors1 = colorText.split(",");//["red","blue","green","yellow"]
			var colors2 = colorText.split(",",2);//["red","blue"]
			var colors3 = colorText.split(/[^\,]/);//["",",",",",",",""]
			//单体内置对象:Global,Math
			//encodeURI(),encodeURIComponent()
			//encodeURI()主要用于整个URI，encodeURIComponent()主要用于URI中某一段进行编码
			//encodeURI()不会对本身属于URI的特殊字符进行编码，如冒号、正斜杠、问号和井字号
			//encodeURIComponent()对任何非标准字符进行编码
			//decodeURI(),decodeURIComponent()
			//eval()
			//eval("alert('hi')");  等价于alert("hi");
			//Math
			//min(),max()
			var max = Math.max(3,54,32,16);
			//alert(max);//54
			var min = Math.min(3,54,32,16);
			//alert(min);//3
			var values = [1,2,3,4,5,6,7,8];
			var max = Math.max.apply(Math,values);
			//舍入方法,Math.ceil(),Math.floor(),Math.round()
			//Math.ceil()向上舍入
			//Math.floor()向下舍入
			//Math.round()标准舍入
			//alert(Math.ceil(25.1));//26
			//alert(Math.round(25.1));//25
			//alert(Math.floor(25.9));//25
			
		</script>
	</body>
</html>