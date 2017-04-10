<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		
		
		
		<script type="text/javascript">
			function test(){
				var messages = "hi";//局部变量
				//mes = "hi";//全局变量
			}
			//alert(messages);//error
			
			
			var message="hi",found=false,age=29;
			
			
			//5种简单数据类型（也称基本数据类型）:undefined,null,boolean,number,string
			//1种复杂数据类型:object
			//alert(typeof(d1));//undefined
			var d2=null;
			//alert(typeof(d2));//object
			var d3=false;
			//alert(typeof(d3));//boolean
			var d4=123;
			//alert(typeof(d4));//number
			var d5="123";
			//alert(typeof(d5));//string
			//alert(typeof(test));//function
			var d6 = {};
			//alert(typeof(d6));//object
			var d7;
			//alert(d7 == undefined);//true
			//Number类型
			var d8 = "hello";
			var d8AsBoolean = Boolean(d8);
			//alert(d8AsBoolean);//true
			//数据类型			转换为true的值					转换为false的值
			//Boolean		true						false
			//String		非空字符串						""(空字符串)
			//Number		任何非零数字值（包括无穷大）			0和NaN
			//Object		任何对象						null
			//Undefined		n/a							undefined
			//Number类型
			var intNum = 55;//整数
			var octalNum1 = 070;//八进制56
			var octalNum2 = 079;//无效的八进制数值——解析为79
			var hexNum1 = 0xA;//十六进制的10
			var floatNum1 = 1.1;//浮点数1.1
			var floatNum = 3.125e7;//等于31250000
			//数值范围
			//最小数  Number.MIN_VALUE 5E-324
			//最大数值 Number.MAX_VALUE 1.79766931348623157e+308
			//-Infinity负无穷     Infinity正无穷    isFinite()确定一个数值是不是无穷
			var result = Number.MAX_VALUE + Number.MAX_VALUE;
			//alert(isFinite(result));//false
			//NaN   Not a Number
			//alert(NaN == NaN);//false
			//alert(isNaN(NaN));//true
			//alert(isNaN(10));//false
			//alert(isNaN("10"));//false
			//alert(isNaN("blue"));//true
			//alert(isNaN(true));//false
			//数值转换
			//Number(),parseInt(),parseFloat()
			//var num1 = Number("Hello world!");//NaN
			//var num2 = Number("");//0
			//var num3 = Number("000011");//11
			//var num4 = Number(true);//1
			//var num1 = parseInt("1234blue");//1234
			//var num2 = parseInt("");//NaN
			//var num3 = parseInt("0xA");//10(十六进制)
			//var num4 = parseInt("22.5");//22
			//var num5 = parseInt("070");//56(八进制)
			//var num6 = parseInt("70");//70(十进制)
			//var num7 = parseInt("0xf");//15(十六进制)
			//指定基数
			//var num1= parseInt("10",2);//2(二进制)
			//var num2 = parseInt("10",8);//8(八进制)
			//var num3 = parseInt("10",10);//10(十进制)
			//var num4 = parseInt("10",16);//16(十六进制)
			//parseFloat()只解析十进制
			//var num1 = parseFloat("1234blue");//1234(整数)
			//var num2 = parseFloat("0xA");//0
			//var num3 = parseFloat("22.5");//22.5
			//var num4 = parseFloat("22.34.5");//22.34
			//var num5 = parseFloat("0908.5");//908.5
			//var num6 = parseFloat("3.125e7");//31250000
			//函数参数
			function doAdd(num1,num2) {
				if (arguments.length == 1) {
					alert(arguments[0] + 10);
				} else if (arguments.length == 2) {
					alert(arguments[0] + arguments[1]);
				}
			}
			//doAdd(10);//20
			//doAdd(30,20);//50
			//函数，参数是按值传递的
			function setName(obj) {
				obj.name = "Nicholas";
				obj = new Object();
				obj.name = "Greg";
			}
			var person = new Object();
			setName(person);
			//alert(person.name);//"Nicholas"
			//alert(person instanceof Object);//true
			//alert(person instanceof Function);//false
			//alert(person instanceof Array);//false
			//alert(person instanceof RegExp);//false
			//alert(setName instanceof Function);//true
			var color = "blue";
			function changeColor(){
				if (color === "blue") {
					color = "red";
				} else {
					color = "blue";
				}
			}
			changeColor();
			//alert("Color is now " + color);
			//创建Object实例二种方式
			//使用new操作符后跟Object构造函数
			var person2 = new Object();
			person2.name = "Nicholas";
			person2.age = 29;
			//使用对象字面量
			var person3 = {
					name:"Nicholas",
					age:29
			};
			//或者
			var person4={};
			person4.name = "Nicholas";
			person4.age = 29;
			function displayInfo(args) {
				var output='';
				if (typeof args.name == "string") {
					output += "Name:" + args.name + "\n";
				}
				if (typeof args.age == "number") {
					output += "Age:" + args.age + "\n";
				}	
				//alert(output);
			}
			displayInfo({
				name:"Nicholas",
				age:29
			});
			displayInfo({
				name:"Greg"
			});
			//访问对象，点表示法
			//alert(person4.name);
			//访问对象，方括号表示法
			//alert(person4["name"]);
			//创建Array,一使用构造函数
			var colors1 = new Array();
			var colors2 = new Array(20);
			var colors3 = new Array("red","blue","green");
			//创建Array,二使用字面量表示法
			var colors4 = [];//创建一个空数组
			var colors5 = ["red","blue","green"];
			//检测数组
			colors5 instanceof Array;
			Array.isArray(colors5);
			//每种对象都具有toLocaleString(),toString(),valueOf()
			//alert(colors5.toString());//red,blue,green
			//alert(colors5.valueOf());//red,blue,green
			//alert(colors5);//red,blue,green
			//alert(colors5.join(","));//red,blue,green
			//alert(colors5.join("||"));//red||blue||green
			//数组栈方法，后进先出，push(),pop()
			var colors6 = new Array();
			colors6.push("red","green");
			//alert(colors6.length);//2
			//alert(colors6[0]);//red
			//alert(colors6.pop());//green
			//数组队列方法，先进先出，push(),shift()
			var colors7 = [];
			colors7.push("red","blue");
			colors7.push("green");
			//alert(colors7.shift());
			//数组反方向模拟队列，unshift(),pop()
			var colors8 = [];
			colors8.unshift("red","blue");
			//alert(colors8[0]);//red
			colors8.unshift("green");
			//alert(colors8.pop());//blue
			//reverse()反序，sort()升序
			//colors8.reverse();
			colors8.sort();
			//alert(colors8);
			//自定义排序
			function compare(value1,value2) {
				if (value1 - value2 < 0) {
					return -1;
				} else if (value1 - value2 > 0) {
					return 1;
				} else {
					return 0;
				}
			}
			var values = [0,1,5,10,15];
			function compare2(value1,value2) {
				return value1 - value2;
			}
			//values.sort(compare);
			values.sort(compare2);
			//alert(values);//0,1,5,10,15
			//concat
			var colors9 = ["red","blue","green"];
			var colors10 = colors9.concat("yellow",["black","brown"]);
			//alert(colors10);//red,blue,green,yellow,black,brown
			var colors11 = ["red","blue","green","yellow","black","brown"];
			var colors12 = colors11.slice(1);
			var colors13 = colors11.slice(1,4);
			//alert(colors12);
			//alert(colors13);
			//splice
			//1,删除，2个参数：第一项的位置和删除的项数
			//2，插入，3个参数：起始位置，0（要删除的项数），要插入的项，插入多项，再传入多个参数
			//3,替换，3个参数，起始位置，要删除的项数，要插入的项
			var colors14 = ["red","blue","green"];
			var removed1 = colors14.splice(0,1);//删除第一项
			//alert(removed1);//red
			//alert(colors14);//blue,green
			var removed2 = colors14.splice(1,0,"yellow","orange");//从位置1插入2项
			//alert(removed2);//空数组
			//alert(colors14);//blue,yellow,orange,green
			var removed3 = colors14.splice(1,1,"red","purple");//插入二项，删除一项
			//alert(removed3);//yellow
			//alert(colors14);//blue,red,puple,orange,green
			//位置方法，indexOf(),lastIndexOf()
			var numbers = [1,2,3,4,5,2];
			//alert(numbers.indexOf(2));//1
			//alert(numbers.lastIndexOf(2));//5
			
			
		</script>
	</body>
</html>