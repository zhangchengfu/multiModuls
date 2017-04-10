<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/jsp/header.jsp" %>
<!DOCTYPE html>

<html>
	<head>
		<title></title>
	</head>
	<body>
	
		<div id="d" test="test" class="u" title="lis" lang="en" dir="ltr"><p></p><p></p><ul></ul></div>
		<ul id="u"><li name="item1">item 1</li><li name="item2">item 2</li><li  name="item3">item 3</li></ul>	
		<ul>
			<li>
				<input type="radio" value="red" name="color" id="colorRed" />
				<label for="colorRed">Red</label>
			</li>
			<li>
				<input type="radio" value="green" name="color" id="colorGreen" />
				<label for="colorGreen">Green</label>
			</li>
			<li>
				<input type="radio" value="blue" name="color" id="colorBlue" />
				<label for="colorBlue">Blue</label>
			</li>
		</ul><br/>
		<p id="haha">haha</p>
		<script type="text/javascript">
			document.writeln("<strong>" + (new Date()).toString() + "</strong>");
		</script>	
			
		
	
		<script type="text/javascript">
			//文档节点是每个文档的根节点。文档节点只有一个子节点，即<html>元素，称之为文档元素。
			//12种节点类型，继承Node类型，每个节点都有一个nodeType属性，表明节点类型。Node定义12数值常量表示
			//Node.ELEMENT_NODE(1)
			//Node.ATTRIBUTE_NODE(2)
			//Node.TEXT_NODE(3)
			//Node.CDATA_SECTION_NODE(4)
			//Node.ENTITY_REFERENCE_NODE(5)
			//Node.ENTITY_NODE(6)
			//Node.PROCESSING_INSTRUCTION_NODE(7)
			//Node.COMMENT_NODE(8)
			//Node.DOCUMENT_NODE(9)
			//Node.DOCUMENT_TYPE_NODE(10)
			//Node.DOCUMENT_FRAGMENT_NODE(11)
			//Node.NOTATION_NODE(12)
			if (document.getElementById("d").nodeType == Node.ELEMENT_NODE) {//在ID中无效
				//alert("Node is an element.");
			}
			if (document.getElementById("d").nodeType == 1) {//适用与所有浏览器
				//alert("Node is an element.");
			}
			//nodeName和nodeValue属性
			if (document.getElementById("d").nodeType == 1) {
				var nodeName = document.getElementById("d").nodeName;//nodeName的值是元素的标签名
				var nodeValue = document.getElementById("d").nodeValue;//nodeValue为null
				//alert("nodeName:" + nodeName);
				//alert("nodeValue:" + nodeValue);
			}
			//每个节点都有一个childNodes属性，其中保存一个NodeList对象
			var _div = document.getElementById("d");
			var firstChild = _div.childNodes[0];
			var secondChild = _div.childNodes.item(1);
			var count = _div.childNodes.length;
			//alert("firstChild:" + firstChild.nodeName);//P
			//alert("secondChild:" + secondChild.nodeName);//P
			//alert("count:"+ count);//3
			var arrayOfNodes = Array.prototype.slice.call(_div.childNodes,0);
			//alert(arrayOfNodes);
			function converToArray(nodes) {
				var array = null;
				try {
					array = Array.prototype.slice.call(nodes,0);//针对非IE浏览器
				} catch (e) {
					array = new Array();
					for (var i = 0, len = nodes.length; i < len; i++) {
						array.push(nodes[i]);
					}
				}
				return array;
			}
			//每个节点parentNode属性指向父节点，previousSibling访问前一个节点，如没有返回null,nextSibling访问后一个节点，如没有，返回null
			//alert(firstChild.previousSibling == null);//true
			//alert(firstChild.nextSibling.nodeName);//P
			//父节点的firstChild和lastChild属性分别指向childNodes列表中第一个和最后一个节点。在只有一个子节点的情况下，firstChild和lastChild指向同一个节点。如果没有子节点，firstChild和lastChild都为null
			//alert(_div.firstChild.nodeName);//P
			//alert(_div.lastChild.nodeName);//UL
			//hasChildNodes()有子节点返回true
			//alert(_div.hasChildNodes());//true
			//节点属性ownerDocument指向表示整个文档的文档节点
			//alert(_div.ownerDocument == document);//true
			//操作节点
			//appendChild(),向childNodes列表末尾添加一个节点，返回新增的节点
			var append = _div.appendChild(_div.firstChild);
			//alert(append == _div.lastChild);//true
			//insertBefore(),接受二个参数：要插入的节点和作为参照的节点。插入节点后，被插入的节点会变成参照节点的前一个同胞节点（previousSibling）,同时被方法返回，如果参照节点是null，则inserBefore()与appendChild()执行相同操作
			var inserBefore = _div.insertBefore(_div.lastChild,_div.childNodes.item(0));
			//alert(inserBefore.nodeName);//P
			//alert(converToArray(_div.childNodes));//
			//替换节点，replaceChild(),方法接受二个参数：要插入的节点和要替换的节点，要替换的节点将由这个方法返回并从文档树移除，由插入的节点占据其位置
			//var returnNode = _div.replaceChild(newNode,_div.firstChild);//替换第一个节点
			//移除节点，removeChild(),移除的节点成为方法的返回值
			//var firstChild = _div.removeChild(_div.firstChild);
			//cloneNode(),创建节点的一个副本。方法接受一个布尔值参数，true深复制，复制节点及其整个子节点树；false为浅复制，只复制节点本身
			var myList = document.getElementById("u");
			var deepList = myList.cloneNode(true);
			//alert(deepList.childNodes.length);//3
			var shallowList = myList.cloneNode(false);
			//alert(shallowList.childNodes.length);//0
			//normalize(),处理文档树中文本节点
			
			//Document类型
			//document对象是HTMLDocument(继承自Document类型)的一个实例，表示整个HTML页面，document对象是window对象的一个属性，因此可以将其作为全局对象访问
			//Document节点具有下列特征
			//nodeType的值为9
			//nodeName的值为"#document"
			//nodeValue的值为null
			//parentNode的值为null
			//ownerDocument的值为null
			//其子节点可能是一个DocumentType(最多一个)、Element(最多一个)、ProcessiongInstruction或Comment
			//二个内置访问子节点快捷方式，第一个是documentElement属性，该属性始终指向HTML页面中的<html>元素，另一个通过childNodes访问文档元素
			var html = document.documentElement;//取得对<html>的引用
			//alert(html == document.childNodes[0]);//true
			//alert(html == document.firstChild);//true
			//document对象有一个body属性，直接指向<body>元素
			var body = document.body;//取得对<body>的引用
			//Document另一个可能的子节点是DocumentType,doctype访问<!DOCTYPE>
			var doctype = document.doctype;//取得对<!DOCTYPE>的引用
			//取得文档标题
			var oTitle = document.title;
			//设置文档标题
			document.title = "New page title";
			//URL,domain,referrer，这些请求都存在于请求的HTTP头部
			//URL属性包含页面完整的URL（即地址栏中显示的URL）
			//domain属性只包含页面的域名
			//referrer属性保存着链接到当前页面的那个页面的URL
			//取得完整的URL
			var url = document.URL;
			//alert(url);//http://localhost:7080/web/jsp/js-dom.jsp
			//取得域名
			var domain = document.domain;
			//alert(domain);//localhost
			//取得来源页面的URL
			var referrer = document.referrrer;
			//alert(referrer);//undefined
			
			//查找元素，getElementById(),getElementByTagName()
			var div = document.getElementById("d");
			var lis = document.getElementsByTagName("li");//返回HTMLCollection对象
			//alert(lis.length);//3
			//alert(lis[0].innerHTML);//item 1
			//alert(lis.item(0).innerHTML);//item 1
			//HTMLCollection对象方法namedItem(),通过元素的name特性取得集合中的项
			var item1 = lis.namedItem("item1");
			//alert(item1.innerHTML);//item 1
			//对命名的项还可使用方括号语法来访问
			var item2 = lis["item2"];
			//alert(item2.innerHTML);//item 2
			//取得文档中的所有元素，可以向getElementsByTagName()传入"*"
			var allElements = document.getElementsByTagName("*");
			//getElementsByName(),返回给定name特性的所有元素,最常使用getElementsByName()的是取得单选按钮
			var radios = document.getElementsByName("color");
			//alert(radios[1].value);//green
			
			//特殊集合
			//document.anchors,包含文档中所有带name特性的<a>元素
			//document.forms,包含文档中所有<form>元素，与document.getElementsByTagName("form")得到的结果相同
			//document.images,包含文档中所有的<img>元素，与document.getElementsByTagName("img")得到的结果相同
			//document.links,包含文档中所有带href特性的<a>元素
			
			//DOM一致性检测，DOM1级只为document.implementation规定了一个方法，hasFeature(),接受二个参数：要检测的DOM功能的名称及版本号
			
			//文档写入，write(),writeln(),open(),close(),write()原样写入，writeln()在字符串末尾加一个换行符(\n)
			
			
			//Element类型
			//Element节点具有以下特征：
			//nodeType的值为1
			//nodeName的值为元素的标签名
			//nodeValue的值为null
			//parentNode可能是Document或Element
			//其子节点可能是Element,Text,Comment,ProcessingInstruction,CDATASection或EntityReference
			//访问元素的标签名，nodeName属性，tagName属性都可使用
			//alert(_div.tagName == _div.nodeName);//true
			//alert(_div.tagName.toLowerCase() == "div");
			
			//html元素，由HTMLElement类型表示
			//id,元素在文档中的唯一标识符
			//title,有关元素的附加说明信息，一般通过工具条显示出来
			//lang,元素内容的语言代码，很少使用
			//dir,语言的方向，值为"ltr"(left-to-right,从左至右)，"rtl"(right-to-left,从右至左)
			//className,与元素的class特性对应，即为元素指定的css类
			//alert(_div.id);//d
			//alert(_div.className);//u
			//alert(_div.title);//lis
			//alert(_div.lang);//en
			//alert(_div.dir);//ltr
			//修改特性
			_div.id="c";
			_div.className="v";
			_div.title = "div";
			_div.lang = "cn";
			_div.dir = "rtl";
			//alert(_div.id);//c
			//alert(_div.className);//v
			//alert(_div.title);//div
			//alert(_div.lang);//cn
			//alert(_div.dir);//rtl
			//所有HTML元素都是有HTMLElement或者更具体的子类型表示的
			//元素			类型
			//BODY			HTMLBodyElement
			//BR			HTMLBRElement
			//BUTTON		HTMLButtonElement
			//DIV			HTMLDivElement
			//FORM			HTMLFormElement
			//HEAD			HTMLHeadElement
			//HTML			HTMLHtmlElement
			//SELECT		HTMLSelectElement
			//TABLE			HTMLTableElement
			
			//操作特性的DOM方法有三个：getAttribute(),setAttribute(),removeAttribute()
			//alert(_div.getAttribute("id"));//c
			//alert(_div.id);//公认特性，可直接访问
			//alert(_div.test);//undefined,自定义特性不能这么访问
			//alert(_div.getAttribute("test"));//test
			_div.setAttribute("dir","ltr");
			//alert(_div.getAttribute("dir"));//ltr
			_div.setAttribute("test","_test");
			//alert(_div.getAttribute("test"));//_test
			_div.removeAttribute("test");
			//alert(_div.getAttribute("test"));//null
			//attributes属性
			//遍历元素特性
			function outputAttributes(element) {
				var pairs = new Array,
					attrName,
					attrValue,
					i,
					len;
				for (i=0,len=element.attributes.length;i<len;i++) {
					attrName = element.attributes[i].nodeName;
					attrValue = element.attributes[i].nodeValue;
					if (element.attributes[i].specified) {
						pairs.push(attrName + "=\"" + attrValue + "\"");
					}
				}
				return pairs.join("  ");
			}
			//alert(outputAttributes(_div));//id="c" class="v" title="div" lang="cn" dir="ltr"
			
			//创建元素
			//document.createElement()
			//var div = document.createElement("div");
			//div.id = "myNewDiv";
			//div.className="box";
			//元素的子节点
			for (var i =0,len = div.childNodes.length;i<len;i++) {
				if (div.childNodes[i].nodeType == 1) {//元素节点
					//todo
				}
			}
			
			//文本节点
			//nodeType的值为3
			//nodeName的值为"#text"
			//nodeValue的值为节点所包含的文本
			//parentNode是一个Element
			//没有子节点
			//appendData(text);将text添加到节点的末尾
			
			
		</script>
	</body>
</html>