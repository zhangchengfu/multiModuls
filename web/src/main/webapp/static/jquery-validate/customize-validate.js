//默认校验规则
//(1)required:true               必输字段
//(2)remote:"check.php"          使用ajax方法调用check.php验证输入值
//(3)email:true                  必须输入正确格式的电子邮件
//(4)url:true                    必须输入正确格式的网址
//(5)date:true                   必须输入正确格式的日期 日期校验ie6出错，慎用
//(6)dateISO:true                必须输入正确格式的日期(ISO)，例如：2009-06-23，1998/01/22 只验证格式，不验证有效性
//(7)number:true                 必须输入合法的数字(负数，小数)
//(8)digits:true                 必须输入整数
//(9)creditcard:                 必须输入合法的信用卡号
//(10)equalTo:"#field"           输入值必须和#field相同
//(11)accept:                    输入拥有合法后缀名的字符串（上传文件的后缀）
//(12)maxlength:5                输入长度最多是5的字符串(汉字算一个字符)
//(13)minlength:10               输入长度最小是10的字符串(汉字算一个字符)
//(14)rangelength:[5,10]         输入长度必须介于 5 和 10 之间的字符串")(汉字算一个字符)
//(15)range:[5,10]               输入值必须介于 5 和 10 之间
//(16)max:5                      输入值不能大于5
//(17)min:10                     输入值不能小于10

$(function(){

	//自定义验证 lx
	//身份证号验证
	jQuery.validator.addMethod("idCard",function(value,element){
		return this.optional(element) ||  $.isIdCardNo(value);
	},"请正确输入身份证号码")
	
	// 字符验证
	jQuery.validator.addMethod("string", function(value, element){
		return this.optional(element) ||$.isSafeString(value);
	}, "不允许包含特殊符号!");
	
	// 手机号码验证      
	jQuery.validator.addMethod("isMobile", function(value, element) {       
	    var length = value.length;   
	    var mobile = /^[1][0-9]{10}$/;   
	    return this.optional(element) || (length == 11 && mobile.test(value));       
	}, "请正确填写您的手机号码");   
	
	// 电话号码验证   
	jQuery.validator.addMethod("telephone", function (value, element){
	    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
	    return this.optional(element) || (tel.test(value));
	}, "请正确填写电话号码(区号-号码)");
	
	// 电话号码包括手机号验证   
	jQuery.validator.addMethod("phone", function (value, element){
		var tel = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(1\d{10}$)/;
		return this.optional(element) || (tel.test(value));
	}, "请正确填写电话号码");
	
	// 正数验证 
	jQuery.validator.addMethod("positiveNum", function (value, element){
		var posNum = /^(?:\d+|-?\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/;
		return this.optional(element) || (posNum.test(value));
	}, "请输入正数");
	
	// 12位整数，保留两位小数
	jQuery.validator.addMethod("tKeepTwo", function (value, element){
		var code = /(^\d{1,12}(\.\d{1,2})?$)/;
		return this.optional(element) || (code.test(value));
	}, "最多输入12位整数，并保留两位小数");
	
	$.isSafeString = function isSafeString(value){
		var notSafeString = new Array("<",">","^","~","!","|","&");
		for(var i = 0;i<notSafeString.length;i++){
			if(value.indexOf(notSafeString[i])>=0){
				return false;
			}
		}
		return true;
	}
	
	$.isIdCardNo = function isIdCardNo(num) {
		var len = num.length;
		var re;
		if(len==15){
			re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{2})(\w)$/);
		}else if(len==18){
			re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/);
		}else{
			return false;
		}
		var a = num.match(re);
		if(a!=null){
			if(len==15){
				var D = new Date("19"+a[3]+"/"+a[4]+"/"+a[5]); 
			    var B = D.getYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5]; 
			}else{
				var D = new Date(a[3]+"/"+a[4]+"/"+a[5]); 
			    var B = D.getFullYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5];
			}
			if(!B){
				return false;
			}
		}
		if(!re.test(num)){
			return false;
		}
		return true;
	}
})
