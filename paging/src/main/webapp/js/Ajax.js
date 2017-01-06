if (!window.kjcs) {
	var kjcs = {};

};
kjcs.prompt = {
	showtype : false,
	message : ""
};

var Tool = {
	isArray : function(obj) {
		return this.type(obj) == "array";
	},
	isFun : function(obj) {
		return this.type(obj) == "function";
	},
	isStr : function(obj) {
		return this.type(obj) == "string";
	},
	log : function(msg) {
		this.info(msg);
	},
	info : function(msg) {
		if (window.console && window.console.info) {
			window.console.info(msg);
		}
	},
	error : function(msg) {
		if (window.console && window.console.error) {
			window.console.error(msg);
		}
	},
	infoMessage : function(msg) {
		if ($(".messagepopup").length == 0) {
			$("body")
					.append(
							"<div class=\"messagepopup\" id=\"messagepopup\" style=\"display:none\"><span></span></div>");
		}
		this.info(msg);
		/*
		 * if(!kjcs.prompt.showtype){ kjcs.prompt.showtype = true;
		 * kjcs.prompt.message=msg; $(".messagepopup").css("display","block");
		 * $(".messagepopup span").html(msg);
		 * setTimeout('Tool.closePrompt()',2500); }else{
		 *  }
		 */
	},
	errorMessage : function(msg) {
		if ($(".messagepopup").length == 0) {
			$("body")
					.append(
							"<div class=\"messagepopup\" id=\"messagepopup\" style=\"display:none\"><span></span></div>");
		}
		this.error(msg);
		if (!kjcs.prompt.showtype) {
			kjcs.prompt.showtype = true;
			kjcs.prompt.message = msg;
			$(".messagepopup").css("display", "block");
			$(".messagepopup span").html(msg);
			setTimeout('Tool.closePrompt()', 4000);
		} else {

		}
	},
	closePrompt : function() {
		kjcs.prompt.showtype = false;
		$(".messagepopup").css("display", "none");
		$(".messagepopup span").html("");
	},
	setCookie : function(name, value, time) {
		var _exp = new Date();
		time = time || 60000;
		_exp.setTime(_exp.getTime() + time);
		document.cookie = name + "=" + escape(value) + ";expires="
				+ _exp.toGMTString();
	},
	/**
	 * 读cookies
	 */
	getCookie : function(name) {
		var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
		if (arr = document.cookie.match(reg))
			return (arr[2]);
		else
			return null;
	},
	getUrlParam : function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = decodeURI(window.location.search.substr(1)).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	},
	setUrlParam : function(name, value) {
		var href = window.location.href;
		var _newParam = null;// "&"+name+"=" ;
		if (null != Tool.getUrlParam(name)) {
			_newParam = name + "=" + value;
			href = href.replace(name + "=" + Tool.getUrlParam(name), _newParam)
			return href;
		}
		if (window.location.search.substr(1).length == 0) {
			_newParam = "?" + name + "=" + value;
		} else {
			_newParam = "&" + name + "=" + value;
		}
		return href + _newParam;
	},

	/**
	 * 收索title分段
	 * 
	 * @param _title
	 */
	subsection : function(_title, keyWord) {
		var front_title = "";
		var back_title = "";
		var index = _title.indexOf(keyWord);
		front_title = _title.substr(0, index);
		back_title = _title.substr(index + keyWord.length);
		var result_title = {
			'front_title' : front_title,
			'back_title' : back_title
		}
		return result_title;
	},

	checkisRarFile : function(photoExt) {
		if (photoExt != '.rar' && photoExt != '.zip') {
			return true;
		} else {
			return false;
		}
	},

	checkRarFile : function(target, callback) {
		photoExt = target.value.substr(target.value.lastIndexOf("."))
				.toLowerCase();// 获得文件后缀名
		if (Tool.checkisRarFile(photoExt)) {
			callback.call({
				"code" : "401"
			});
			return;
		}
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		var fileSize = 0;
		if (isIE && !target.files) {
			var filePath = target.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		}
		var size = fileSize / 1024;
		if (size > 3 * 1000) {
			callback.call({
				"code" : "402"
			});
			return;
		} else {
			callback.call({
				"code" : "200"
			});
			return;
		}
	},
	checkImage : function(target, callback) {
		photoExt = target.value.substr(target.value.lastIndexOf("."))
				.toLowerCase();// 获得文件后缀名
		if (Tool.checkisImg(photoExt)) {
			callback.call({
				"code" : "401"
			});
			return;
		}

		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		var fileSize = 0;
		if (isIE && !target.files) {
			var filePath = target.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		}
		var size = fileSize / 1024;
		if (size > 1 * 1000) {
			callback.call({
				"code" : "402"
			});
			return;
		} else {
			callback.call({
				"code" : "200"
			});
			return;
		}
	},

	/**
	 * 检查是否是图片
	 * 
	 * @param photoExt
	 * @returns {Boolean}
	 */
	checkisImg : function(photoExt) {
		if (photoExt != '.jpg' && photoExt != '.png' && photoExt != '.jpeg'
				&& photoExt != '.bmp' && photoExt != '.gif') {
			return true;
		} else {
			return false;
		}
	},

	/**
	 * 检测文件上传大小 上传类型不是图片 401 文件过大 402
	 * 
	 * @param target
	 *            input this
	 * @param _size
	 *            大小单位M
	 * @param callback
	 *            回调函数
	 */
	checkFileSize : function(target, _size, callback) {
		photoExt = target.value.substr(target.value.lastIndexOf("."))
				.toLowerCase();// 获得文件后缀名
		if (Tool.checkisImg(photoExt)) {
			callback.call({
				"code" : "401"
			});
			return;
		}

		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		var fileSize = 0;
		if (isIE && !target.files) {
			var filePath = target.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		}
		var size = fileSize / 1024;
		if (size > _size * 1000) {
			callback.call({
				"code" : "402"
			});
			return;
		} else {
			callback.call({
				"code" : "200"
			});
			return;
		}
	},

	/**
	 * 页面打印传人需要打印的元素的id
	 */
	pagePrint : function(param) {
		$("#" + param).jqprint();
	},

	/**
	 * ajax 实现文件上传form 提交
	 * 
	 * @param obj
	 *            form表单id
	 * @param _url
	 *            提交的url
	 * @param callback
	 *            回掉函数
	 */
	submitFunc : function(obj, _url, callback) {
		var form = $(obj);
		var ajax_option = {
			url : _url,
			success : function(res) {
				callback.call(res);
			},
			error : function(res) {
				callback.call(res);
			}
		};
		form.ajaxSubmit(ajax_option);
	},
	/**
	 * 
	 */
	isIE : function() { // ie?
		if (!!window.ActiveXObject || "ActiveXObject" in window)
			return true;
		else
			return false;
	},

	serializeObject : function(obj) {
		var resultObj = new Object();
		$.each(obj.serializeArray(), function(index, param) {
			if (!(param.name in resultObj)) {
				if (param.value != undefined && param.value != '') {
					param.value = $.trim(param.value);
				}
				resultObj[param.name] = param.value;
			}
		});
		return resultObj;
	},

	jsonToParam : function(obj) {
		var param = "";
		for ( var key in obj) {
			// if(Tool.isStr(obj[key])){
			param += "&" + key + "=" + obj[key];
			// }
		}
		if (param.length) {
			param = param.substr(1);
		}
		return param;
	},
	stringify : function(obj) {
		var JSON = window.JSON;
		if (JSON) {
			return JSON.stringify(obj);
		}
		return Tool.jsonToParam(obj);
	},

	parseJSON : function(json) {
		if (typeof json != 'string')
			return json = json.replace(/^\s+|\s+$/g, '');
		var isValid = /^[\],:{}\s]*$/
				.test(json
						.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@")
						.replace(
								/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
								"]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""));
		if (!isValid)
			throw "Invalid JSON";
		var JSON = window.JSON;
		return JSON && JSON.parse ? JSON.parse(json) : (new Function("return "
				+ json))();
	},

	JsonToString : function(String) {
		return JSON.stringify(String);
	}

};

Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	}
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

(function($) {
	$.fn.serializeJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		var str = this.serialize();
		$(array).each(
				function() {
					if (serializeObj[this.name]) {
						if ($.isArray(serializeObj[this.name])) {
							serializeObj[this.name].push(this.value);
						} else {
							serializeObj[this.name] = [
									serializeObj[this.name], this.value ];
						}
					} else {
						serializeObj[this.name] = this.value;
					}
				});
		return serializeObj;
	};
})(jQuery);

var Ajax = function() {
	function defSuccess() {
	}
	;
	function defFailure(code) {
		Tool.infoMessage(code);
		// Tool.log("requset failure: status" + code);
	}
	;
	/**
	 * 默认get，not timely 请求 对 fileRespectSource 进行解析
	 * 
	 * @param url
	 * @param opt
	 */
	function request(url, opt) {
		var async = opt.async !== false, timely = opt.timely !== false, method = opt.method
				|| 'GET', data = opt.data || null, success = opt.success
				|| defSuccess, failure = opt.failure || defFailure, header = opt.header
				|| {}, method = method.toUpperCase(), timestamp = "", endpoint = opt.endpoint;

		var _data = {};

		_data.formData = Tool.JsonToString(data);
		_data.paginationData = Tool.JsonToString({
			page : opt.page,
			size : opt.size
		});
		_data.endpoint = endpoint;

		if (method == 'GET' && timely) {
			url += (url.indexOf('?') == -1 ? '?' : '&') + "timestamp="
					+ new Date().getTime();
		}
		/*
		 * if(method =='GET' && _data){ url += (url.indexOf('?') == -1 ? '?' :
		 * '&') + _data; }
		 */
		$.ajax({
			type : method,
			url : url,
			data : _data || {},
			async : async,
			dataType : 'json',
			success : function(msg) {
				success(msg);
				/*if (msg.success) {
					success(msg.data)
				} else if (msg && !msg.success && msg.filterFlag == 1) {
					window.location.href = contextPath;
				} else {
					failure(msg.errorMessage);
				}*/

			},
			error : function(textStatus) {
				failure(textStatus);
			}
		});
	}
	;

	function get(url, opt) {
		var _opt = {};
		_opt.async = opt.async !== false, _opt.timely = true,
				_opt.method = 'GET', _opt.data = opt.data || null,
				_opt.success = opt.success || defSuccess,
				_opt.failure = opt.failure || defFailure,
				_opt.page = opt.page || 0, _opt.size = opt.size || 0,
				_opt.endpoint = opt.endpoint;
		request(url, _opt);

	}
	;
	function post(url, opt) {
		var _opt = {};
		_opt.async = opt.async !== false, _opt.timely = true,
				_opt.method = 'POST', _opt.data = opt.data || null,
				_opt.success = opt.success || defSuccess,
				_opt.failure = opt.failure || defFailure,
				_opt.page = opt.page || 0, _opt.size = opt.size || 0,
				_opt.endpoint = opt.endpoint;
		request(url, _opt);
	}
	;

	/**
	 * opt ={formObj,failurl,success}
	 */
	function submitFile(url, opt) {
		var async = opt.async !== false, method = 'POST', success = opt.success
				|| defSuccess, failure = opt.failure || defFailure, formObj = opt.formObj, page = opt.page || 0, extendObj = opt.data
				|| {}
		size = opt.size || 0, token = "", endpoint = opt.endpoint;
		var _url = url;

		var form = formObj;
		if (form.children("[token=token]").length == 1) {
			token = form.children("[token=token]").val();
		}
		var formJson = form.serializeJson();
		delete formJson.headToken;
		var formData = {};
		$.extend(formData, formJson, extendObj);
		var data = {};
		data.headToken = token;
		data.formData = Tool.JsonToString(formData);
		data.paginationData = Tool.JsonToString({
			page : page,
			size : size
		});
		data.endpoint = endpoint;

		$.ajax({
			type : method,
			url : _url,
			data : data || {},
			async : async,
			dataType : 'json',
			success : function(msg) {
				if (msg.success) {
					success(msg);
				} else if (msg && !msg.success && msg.filterFlag == 1) {
					window.location.href = contextPath;
				} else {
					if (!!msg.token) {
						if (form.children("[token=token]").length == 1) {
							form.children("[token=token]").val(
									Tool.JsonToString(msg.token));
						}
					}
					failure(msg.errorMessage);
				}
			},
			error : function(textStatus) {
				failure(textStatus);
			}
		});
	};

	return {
		"getRequest" : get,
		"post" : post,
		"search" : get,
		"submitForm" : submitFile
	};

}();
