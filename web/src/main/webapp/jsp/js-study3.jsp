<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>

<html>
	<head>
		<title></title>
	</head>
	<body>
		
		<script type="text/javascript">
			//数据属性:[[Configurable]],[[Enumerable]],[[Writable]],[[Value]]
			//修改属性默认的特性，Object.defineProperty(),接收三个参数：属性所在的对象，属性的名字和一个描述符对象。描述符为：configurable,enumerable,writable,value
			var person = {};
			Object.defineProperty(person,"name",{
				writable:false,
				value:"Nicholas"
			});
			//alert(person.name);//"Nicholas"
			person.name = "Greg";
			//alert(person.name);//"Nicholas"
			//访问器属性:[[Configurable]],[[Enumerable]],[[Get]],[[Set]]
			var book = {
					_year:2004,
					edition:1
			};
			Object.defineProperty(book,"year",{
				get:function(){
					return this._year;
				},
				set:function(newValue) {
					this._year = newValue;
					this.edition += newValue - 2004;
				}
			});
			book.year = 2005;
			//alert(book.edtion);//2
			//定义多个属性
			var book = {};
			Object.defineProperties(book,{
				_year:{
					value:2004
				},
				edition:{
					value:1
				},
				year:{
					get:function(){
						return this._year;
					},
					set:function(newValue){
						if (newValue > 2004) {
							this._year = newValue;
							this.edition += newValue - 2004;
						}
					}
				}
			});
			//Object.getOwnPropertyDescriptor(),二个参数：属性所在对象和属性名称，返回对象，访问器属性：configurable,enumerable,get,set;数据属性：configurable,enumerable,writable,value
			var descriptor = Object.getOwnPropertyDescriptor(book,"_year");
			//alert(descriptor.value);//2004
			//alert(descriptor.configurable);//false
			//alert(typeof descriptor.get);//"undefined"
			var descriptor = Object.getOwnPropertyDescriptor(book,"year");
			//alert(descriptor.value);//undefined
			//alert(descriptor.enumerable);//false
			//alert(typeof descriptor.get);//"function"
			//创建对象，1，工厂模式
			function createPerson(name,age,job) {
				var o = new Object();
				o.name = name;
				o.age = age;
				o.job = job;
				o.sayName = function(){
					//alert(this.name);
				};
				return o;
			}
			var person1 = createPerson("Nicholas",29,"Software Engineer");
			var person2 = createPerson("Greg",27,"Doctor");
			//2,构造函数模式
			function Person(name,age,job) {
				this.name = name;
				this.age = age;
				this.job = job;
				this.sayName = function(){
					//alert(this.name);
				};
			}
			var person1 = new Person("Nicholas",29,"Software Engineer");
			var person2 = new Person("Greg",27,"Doctor");
			//alert(person1.constructor == Person);//true
			//alert(person2.constructor == Person);//true
			//alert(person1 instanceof Object);//true
			//alert(person1 instanceof Person);//true
			//alert(person2 instanceof Object);//true
			//alert(person2 instanceof Person);//true
			//2.1,将构造函数当作函数
			//当作构造函数使用
			var person3 = new Person("Nicholas",29,"Software Engineer");
			person3.sayName();//"Nicholas"
			//作为普通函数调用
			Person("Greg",27,"Doctor");//添加到window
			window.sayName();//"Greg"
			//在另一个对象的作用域中调用
			var o = new Object();
			Person.call(o,"kristen",25,"Nurse");
			o.sayName();//"kristen"
			//3，原型模式
			function Person(){};
			Person.prototype.name = "Nicholas";
			Person.prototype.age = 29;
			Person.prototype.job = "Software Engineer";
			Person.prototype.sayName= function(){
				//alert(this.name);
			};
			var person1 = new Person();
			person1.sayName();//"Nicholas"
			var person2 = new Person();
			person2.sayName();//"Nicholas"
			//alert(person1.sayName() == person2.sayName());//true
			//3.1,理解原型对象
			//所有原型对象都会自动获得一个constructor(构造函数)属性，这个属性包含一个指向prototype属性所在函数的指针，Person.prototype.constructor指向Person
			//isPrototypeOf()确定对象和原型是否存在关联
			//alert(Person.prototype.isPrototypeOf(person1));//true
			//alert(Person.prototype.isPrototypeOf(person2));//true
			//Object.getPrototypeOf()返回实例的[[Prototype]]
			//alert(Object.getPrototypeOf(person1) == Person.prototype);//true
			//alert(Object.getPrototypeOf(person1).name);//"Nicholas"
			//读取对象属性，首先从对象实例本身开始，如果没有找到，则搜索指针指向原型对象
			//hasOwnProperty(),检测一个属性是存在于实例中，还是存在与原型中，存在于对象实例中时，才会返回true
			var person1 = new Person();
			var person2 = new Person();
			person2.name = "Greg";
			//alert(person1.hasOwnProperty("name"));//false
			//alert(person2.hasOwnProperty("name"));//true
			//原型与in操作符，二种方式使用in操作符：单独使用和在for-in循环中使用。in操作符会在通过对象能够访问给定属性时返回true,无论该属性存在于实例中还是原型中。
			var person1 = new Person();
			var person2 = new Person();
			//alert(person1.hasOwnProperty("name"));//false
			//alert("name" in person1);//true
			//同时使用hasOwnProperty()和in操作符，就可以确定该属性存在于对象中，还是存在于原型中
			function hasPrototypeProperty(object,name) {
				return !object.hasOwnProperty(name) && (name in object);
			}
			var person = new Person();
			//alert(hasPrototypeProperty(person,"name"));//true
			person.name = "Greg";
			//alert(hasPrototypeProperty(person,"name"));//false
			//枚举实例属性，Object.keys(),接收一个对象作为参数，返回一个包含所有可枚举属性的字符串数组
			var keys = Object.keys(Person.prototype);
			//alert(keys);////"name,age,job,sayName"
			var p1 = new Person();
			p1.name = "Rob";
			p1.age = 31;
			var p1Keys = Object.keys(p1);
			//alert(p1Keys);//"name,age"
			//得到所有实例属性，无论是否枚举，都可使用Object.getOwnPropertyNames()
			var keys = Object.getOwnPropertyNames(Person.prototype);
			//alert(keys);//"constructor,name,age,job,sayName"
			//更简单的原型方法,对象字面量重写原型对象
			function Person(){};
			Person.prototype={
					name:"Nicholas",
					age:29,
					job:"Software Engineer",
					sayName:function(){
						//alert(this.name);
					}
			};
			//例外：Person.prototype的constructor属性不再指向Person了，指向Object构造函数
			var friend = new Person();
			//alert(friend instanceof Object);//true
			//alert(friend instanceof Person);//true
			//alert(friend.constructor == Person);//false
			//alert(friend.constructor == Object);//true
			//如果constructor的值很重要，可以
			function Person(){};
			Person.prototype={
					constructor:Person,
					name:"Nicholas",
					age:29,
					job:"Software Engineer",
					sayName:function(){
						//alert(this.name);
					}
			};
			//但这样constructor属性[[Enumerable]]设为true,默认原生的constructor属性是不可枚举的。可以尝试Object.defineProperty()
			function Person(){};
			Person.prototype={
					constructor:Person,
					name:"Nicholas",
					age:29,
					job:"Software Engineer",
					sayName:function(){
						//alert(this.name);
					}
			};
			//重设构造函数，只适用与ECMAScript5兼容的浏览器
			Object.defineProperty(Person.prototype,"constructor",{
				enumerable:false,
				value:Person
			})
			//原型的动态性
			//对原型对象所做的任何修改都能够立即从实例上反映出来,即使是先创建了实例后修改原型
			var friend = new Person();
			Person.prototype.sayHi = function(){
				//alert("hi");
			};
			friend.sayHi();//"Hi"
			//重写整个原型对象，情况不一样。调用构造函数时会为实例添加一个指向最初原型的[[Prototype]]指针，而把原型修改为另外一个对象就等于切断了构造函数与最初原型之间的联系。实例中的指针仅指向原型，而不会指向构造函数
			function Person(){}
			var friend = new Person();
			Person.prototype = {
					constructor:Person,
					name:"Nicholas",
					age:29,
					job:"Software Engineer",
					sayName:function(){
						//alert(this.name);
					}
			};
			friend.sayName();//error    frind的[[prototype]]还是指向最初原型
			//原生对象的原型
			//alert(typeof Array.prototype.sort);//"function"
			//alert(typeof String.prototype.substring);//"function"
			//添加原生对象原型方法，给基本包装类型String添加了一个名为startsWith()的方法(不推荐)
			String.prototype.startsWith = function(text) {
				return this.indexOf(text) == 0;
			};
			var msg = "Hello World！";
			//alert(msg.startsWith("Hello"));//true
			//原型对象的问题,原型中属性包含引用类型，所有实例会共享
			function Person(){}
			var friend = new Person();
			Person.prototype = {
					constructor:Person,
					name:"Nicholas",
					age:29,
					job:"Software Engineer",
					friends:["Shelby","Court"],
					sayName:function(){
						//alert(this.name);
					}
			};
			var person1 = new Person();
			var person2 = new Person();
			person1.friends.push("Van");
			//alert(person1.friends);//"Shelby,Court,Van"
			//alert(person2.friends);//"Shelby,Court,Van"
			//alert(person1.friends == person2.friends);//true
			//组合使用构造函数模式和原型模式，创建自定义类型的最常见方式。
			function Person(name,age,job) {
				this.name = name;
				this.age = age;
				this.job = job;
				this.friends = ["Shelby","Court"];
			}
			Person.prototype = {
					constructor:Person,
					sayName:function(){
						//alert(this.name);
					}
			};
			//动态原型模式，所有信息都封装在构造函数中，在构造函数中初始化原型
			function Person(name,age,job) {
				this.name = name;
				this.age = age;
				this.job = job;
				//方法
				if (typeof this.sayName != "function") {
					Person.prototype.sayName = function(){
						//alert(this.name);
					};
				}
			}
			var friend = new Person("Nicholas",29,"Software Engineer");
			friend.sayName();
			//寄生构造函数模式。创建一个函数，该函数的作用仅仅是封装创建对象的代码，然后在返回新创建的对象。
			function Person(name,age,job){
				var o = new Object();
				o.name = name;
				o.age = age;
				o.job = job;
				o.sayName = function(){
					//alert(this.name);
				};
				return o;
			}
			var friend = new Person("Nicholas",29,"Software Engineer");
			friend.sayName();//"Nicholas"
			//这个模式可以在特殊的情况下用来为对象创建构造函数
			function SpecialArray(){
				//创建数组
				var values = new Array();
				
				//添加值
				values.push.apply(values,arguments);
				
				//添加方法
				values.toPipedString = function(){
					return this.join("|");
				};
				
				//返回数组
				return values;
			}
			var colors = new SpecialArray("red","blue","green");
			//alert(colors.toPipedString());//"red|blue|green"
			//稳妥构造函数模式,与寄生构造函数类似，但有二点不同：一是新创建对象的实例方法不引用this,二是不使用new操作符调用构造函数
			function Person(name,age,job){
				//创建要返回的对象
				var o = new Object();
				
				//可以在这里定义私有变量和函数
				
				//添加方法
				o.sayName = function(){
					//alert(naem);
				};
				
				//返回对象
				return o;
			}
			//原型链，原型链作为实现继承的主要方法。基本思想是利用原型让一个引用类型继承另一个引用类型的属性和方法.
			function SuperType(){
				this.property = true;
			}
			SuperType.prototype.getSuperValue = function(){
				return this.property;
			};
			function SubType(){
				this.subproperty = false;
			}
			//继承了SuperType
			SubType.prototype = new SuperType();
			SubType.prototype.getSubValue = function(){
				return this.subproperty;
			};
			var instance = new SubType();
			//alert(instance.getSuperValue());//true
			//确定原型和实例的关系，二种方式：1，instanceof   2,isPrototypeOf()
			//使用instanceof操作符
			//alert(instance instanceof Object);//true
			//alert(instance instanceof SuperType);//true
			//alert(instance instanceof SubType);//true
			//使用isPrototypeOf()
			//alert(Object.prototype.isPrototypeOf(instance));//true
			//alert(SuperType.prototype.isPrototypeOf(instance));//true
			//alert(SubType.prototype.isPrototypeOf(instance));//true
			//谨慎定义方法，子类添加或重写超类方法
			function SuperType(){
				this.property = true;
			}
			SuperType.prototype.getSuperValue = function(){
				return this.property;
			};
			function SubType(){
				this.subproperty = false;
			}
			//继承了SuperType
			SubType.prototype = new SuperType();
			SubType.prototype.getSubValue = function(){
				return this.subproperty;
			};
			//重写超类方法
			SubType.prototype.getSuperValue = function(){
				return false;
			};
			var instance = new SubType();
			//alert(instance.getSuperValue());//false
			//通过原型链实现继承时，不能使用对象字面量创建原型方法
			function SuperType(){
				this.property = true;
			}
			SuperType.prototype.getSuperValue = function(){
				return this.property;
			};
			function SubType(){
				this.subproperty = false;
			}
			//继承了SuperType
			SubType.prototype = new SuperType();
			//使用字面量添加新方法，会导致上一行代码无效
			SubType.prototype = {
					getSubValue : function(){
						return this.subproperty;
					},
					someOtherMethod:function(){
						return false;
					}
			};
			var instance = new SubType();
			//alert(instance.getSuperValue());//error
			//原型链的问题
			function SuperType(){
				this.colors = ["red","blue","green"];
			}
			function SubType(){
				
			}
			//继承了SuperType
			SubType.prototype = new SuperType();
			var instance1 = new SubType();
			instance1.colors.push("black");
			//alert(instance1.colors);//"red,blue,green,black"
			var instance2 = new SubType();
			//alert(instance2.colors);//"red,blue,green,black"
			//借用构造函数，有时候也叫伪造对象或经典继承，在子类型构造函数的内部调用超类构造函数
			function SuperType(){
				this.colors = ["red","blue","green"];
			}
			function SubType(){
				//继承了SuperType
				SuperType.call(this);
			}
			var instance1 = new SubType();
			instance1.colors.push("black");
			//alert(instance1.colors);//"red,blue,green,black"
			var instance2 = new SubType();
			//alert(instance2.colors);//"red,blue,green"
			//传递参数，可以在子类型构造函数中向超类型构造函数传递参数
			function SuperType(name) {
				this.name = name;
			}
			function SubType(){
				//继承了SuperType,同时还传递了参数
				SuperType.call(this,"Nicholas");
				
				//实例属性
				this.age = 29;
			}
			var instance = new SubType();
			//alert(instance.name);//"Nicholas"
			//alert(instance.age);//29
			//组合继承，有时也叫伪经典继承，是将原型链和借用构造函数的技术组合到一块。最常用的继承模式
			function SuperType(name){
				this.name = name;
				this.colors = ["red","blue","green"];
			}
			SuperType.prototype.sayName = function(){
				//alert(this.name);
			};
			function SubType(name,age){
				//继承属性
				SuperType.call(this,name);
				
				this.age = age;
			}
			//继承方法
			SubType.prototype = new SuperType();
			SubType.prototype.sayAge = function(){
				//alert(this.age);
			};
			var instance1 = new SubType("Nicholas",29);
			instance1.colors.push("black");
			//alert(instance1.colors);//"red,blue,green,black"
			instance1.sayName();//"Nicholas"
			instance1.sayAge();//29
			var instance2 = new SubType("Greg",27);
			//alert(instance2.colors);//"red,blue,green"
			instance2.sayName();//"Greg"
			instance2.sayAge();//27
			//原型式继承，道格拉斯.克罗福德在2006写的文章Prototypal Inheritance in JavaScript,基于已有的对象创建新对象，同时还不必创建自定义类型
			function object(o) {
				function F(){}
				F.prototype = o;
				return new F();
			}
			var person = {
					name:"Nicholas",
					friends:["Shelby","Court","Van"]
			};
			var anotherPerson = object(person);
			anotherPerson.name = "Greg";
			anotherPerson.friends.push("Rob");
			var yetAnotherPerson = object(person);
			yetAnotherPerson.name = "Linda";
			yetAnotherPerson.friends.push("Barbie");
			//alert(person.friends);//"Shelby,Court,Van,Rob,Barbie"
			//ECMAScript5新增Object.create()方法规范化了原型式继承。这个方法接收二个参数：一个用作新对象原型的对象和（可选的）一个为新对象定义额外属性的对象。在传入一个参数的情况下，Object.create()与object()相同
			var person = {
					name:"Nicholas",
					friends:["Shelby","Court","Van"]
			};
			var anotherPerson = Object.create(person);
			anotherPerson.name = "Greg";
			anotherPerson.friends.push("Rob");
			var yetAnotherPerson = Object.create(person);
			yetAnotherPerson.name = "Linda";
			yetAnotherPerson.friends.push("Barbie");
			//alert(person.friends);//"Shelby,Court,Van,Rob,Barbie"
			var otherPerson = Object.create(person,{
				name:{
					value:"John"
				}
			});
			//alert(otherPerson.name);//"John"
			//寄生式继承
			function createAnother(original) {
				var clone = object(original);//通过调用函数创建一个新对象
				clone.sayHi = function(){//以某种方式来增强这个对象
					//alert("hi");
				};
				return clone;//返回这个对象
			}
			var person = {
					name:"Nicholas",
					friends:["Shelby","Court","Van"]
			};
			var anotherPerson = createAnother(person);
			anotherPerson.sayHi();//"hi"
			//寄生组合式继承,引用类型最理想的继承范式
			function inheritPrototype(subType,superType) {
				var prototype = oject(superType.prototype);//创建对象
				prototype.constructor = subType;//增强对象
				subType.prototype = prototype;//指定对象
			}
			function SuperType(name) {
				this.name = name;
				this.colors = ["red","blue","green"];
			}
			SuperType.prototype.sayName = function(){
				//alert(this.name);
			};
			function SubType(name,age) {
				SuperType.call(this,name);
				this.age = age;
			}
			inheritPrototype(SubType,Supertype);
			SubType.prototype.sayAge = function(){
				//alert(this.age);
			};
			
			
		</script>
	</body>
</html>