<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>

<html>
	<head>
		<title></title>
	</head>
	
	<body>
	
		<script type="text/javascript">
			//函数表达式
			<!---->var functionName = function(arg0,arg1,arg2){
				//函数体
			};
			//不要这样做
			var condition = false;
			if(condition) {
				function sayHi(){
					//alert("Hi!");
				}
			} else {
				function sayHi(){
					//alert("Yo!");
				}
			}
			//可以这样做
			var sayHi;
			if (condition) {
				sayHi = function(){
					//alert("Hi!");
				};
			} else {
				sayHi = function(){
					//alert("Yo!");
				};
			}
			//递归
			function factorial(num) {
				if (num <= 1) {
					return 1;
				} else {
					return num * factorial(num-1);
				}
			}
			//函数表面看没什么问题，但下面代码却可能导致它出错
			var anotherFactorial = factorial;
			factorial = null;
			alert(anotherFactorial(4));//出错
			//arguments.callee是一个指向正在执行的函数的指针
			function factorial(num) {
				if (num <= 1) {
					return 1;
				} else {
					return num * arguments.callee(num-1);//严格模式下，arguments.callee会导致错误
				}
			}
			//使用函数表达式来达成相同的结果
			var fatorial = (function f(num){
				if (num <= 1){
					return 1;
				} else {
					return num * f(num-1);
				}
			});
			//闭包
			//闭包是指有权访问另一个函数作用域中变量的函数。创建闭包的常见方式，就是在一个函数内部创建另一个函数。
			//闭包与变量，闭包只能取得包含函数中任何变量的最后一个值。闭包保存的是整个变量对象，而不是某个特殊的变量。
			function createFunctions(){
				var result = new Array();
				for (var i=0;i<10;i++){
					result[i] = function(){
						return i;
					};
				}
				return result;
			}
			//强制让闭包的行为符合预期
			function createFunctions(){
				var result = new Array();
				for (var i=0;i<10;i++){
					result[i] = function(num){
						return function(){
							return num;
						}
					}(i);
				}
				return result;
			}
			//this对象
			var name = "The Window";
			var object = {
					name:"My Object",
					getNameFunc:function(){
						return function(){
							return this.name;
						}
					}
			};
			//alert(object.getNameFunc());//"The Window"
			//把外部作用域中的this对象保存在一个闭包能够访问到的变量里，就可以让闭包访问该对象了
			var name = "The Window";
			var object = {
					name:"My Object",
					getNameFunc:function(){
						var that = this;
						return function(){
							return that.name;
						}
					}
			};
			//alert(object.getNameFunc());//"My Object"
			//内存泄漏
			function assignHandler(){
				var element = document.getElementById("someElement");
				element.onclick = function(){
					//alert(element.id);
				};
			}
			//改写代码，解决内存回收
			function assignHandler(){
				var element = document.getElementById("someElement");
				var id = element.id;
				element.onclick = function(){
					//alert(id);
				};
				element = null;
			}
			//模仿块级作用域,匿名函数可以用来模仿块级作用域（通常称为私有作用域）
			(function(){
				//这里是块级作用域
			})();
			//以上代码定义并立即调用了一个匿名函数。将函数声明包含在一对圆括号中，表示它实际上是一个函数表达式。而紧随其后的另一对圆括号会立即调用这个函数。
			function outputNumbers(count) {
				(function(){
					for (var i = 0;i<count;i++){
						//alert(i);
					}
				})();
				//alert(i);//error
			}
			(function(){
				var now = new Date();
				if (now.getMonth() == 0 && now.getDate() == 1) {
					//alert("Happy new year!");
				}
			})();
			//私有变量，包括函数的参数、局部变量和在函数内部定义的其他函数
			//把有权访问私有变量和私有函数的公有方法称为特权方法。
			//第一种，在构造函数中定义特权方法
			function MyObject(){
				//私有变量和私有函数
				var privateVariable = 10;
				function privateFunction(){
					return false;
				}
				
				//特权方法
				this.publicMethod = function(){
					privateVariable++;
					return privateFunction();
				};
			}
			function Person(name){
				this.getName = function(){
					return name;
				};
				this.SetName = function(value){
					name = value;
				}
			}
			var person = new Person("Nicholas");
			//alert(person.getName());//"Nicholas"
			person.setName("Greg");
			//alert(person.getName());//"Greg"
			//静态私有变量
			(function(){
				//私有变量和私有函数
				var privateVariable = 10;
				function privateFunction(){
					return false;
				}
				
				//构造函数
				MyObject = function(){};
				
				//公有/特权方法
				MyObject.prototype.publicMethod = function(){
					privateVariable++;
					return privateFunction();
				};
			})();
			(function(){
				var name = "";
				Person = functio(value){
					name = value;
				};
				Person.prototype.getName = function(){
					return name;
				};
				Person.prototype.setName = function(value){
					name = value;
				};
			})();
			var person1 = new Person("Nicholas");
			//alert(person1.getName());//"Nicholas"
			person1.setName("Greg");
			//alert(person1.getName());//"Greg"
			var person2 = new Person("Michael");
			//alert(person1.getName());//"Michael"
			//alert(person2.getName());//"Michael"
			//模块模式,为单例创建私有变量和特权方法。单例是只有一个实例的对象。JavaScript是以对象字面量的方式来创建单例对象的
			var singleton = function(){
				//私有变量和私有函数
				var privateVariable = 10;
				function privateFunction(){
					return false;
				}
				
				//特权/公有方法和属性
				return {
					publicProperty:true,
					publicMethod:function(){
						privateVariable++;
						return privateFunction();
					}
				};
			}();
			//下面简单的创建了一个用于管理组件的application对象
			function BaseComponent(){}
			var application = function(){
				//私有变量和函数
				var components = new Array();
				
				//初始化
				components.push(new BaseComponent());
				
				//公共
				return {
					getComponentCount:function(){
						return components.length;
					},
					registerComponent:function(component){
						if (typeof component == "object") {
							components.push(component);
						}
					}
				};
			}();
			//增强的模块模式
			function CustomType(){}
			var singleton = function(){
				//私有变量和私有函数
				var privateVariable = 10;
				function privateFunction(){
					return false;
				}
				
				//创建对象
				var object = new CustomType();
				
				//添加特权/公有属性和方法
				object.publicProperty = true;
				
				object.publicMethod = function(){
					privateVariable++;
					return privateFunction();
				};
				
				//返回这个对象
				return object;
			}();
			
			
		</script>
	</body>
</html>