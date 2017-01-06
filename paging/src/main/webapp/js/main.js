var openTab = function($this) {
	var url = $this.attr("url");
	var headTitle = $this.attr("menu-name");
	$("#headTitle").html(
			headTitle + '<small id="headSmallName">'
					+ $this.attr("menu-smallName") + '</small>');
	var homeHtml = '<li><a href="javascript:skipHomePage();"><i class="fa fa-dashboard"></i> 首页</a></li>';
	var mHtml = '';
	$this.parents("li").each(
			function() {
				var $menu_a = $($(this).find("a")[0]);
				var menu_url = $menu_a.attr("url");
				if (menu_url) {
					mHtml = '<li><a menu-id="' + $menu_a.attr("id")
							+ '" href="javascript:;"> '
							+ $menu_a.attr("menu-name") + '</a></li>' + mHtml;
				} else {
					mHtml = '<li> ' + $menu_a.attr("menu-name") + '</li>'
							+ mHtml;
				}
			});
	$(".breadcrumb").html(homeHtml + mHtml);
	loadPage($("section.content"), url);
};

var sys_skipObj;
var skip = function(url, smallName, skipObj) {
	sys_skipObj = skipObj;
	setSmallName(smallName);
	loadPage($("section.content"), url);
};
var getSkipParam = function() {
	return sys_skipObj;
};

var setSmallName = function(smallName) {
	$("#headSmallName").html(smallName || '');
};

var removeDisplayDom = function() {
	$("body").removeClass('modal-open').css('padding-right', 0);
	$(".wrapper").siblings().remove();
};

var loadPage = function($dom, url) {
	setTimeout(function() {
		removeDisplayDom();
		$dom.load(contextPath + url, function(response, status, xhr) {
			if(xhr.status == 400){
				window.location.href= contextPath;
			}
		});
	}, 0);
}

function skipHomePage() {
	$("#headTitle").html('首页<small id="headSmallName"></small>');
	var homeHtml = '<li><a href="javascript:skipHomePage();"><i class="fa fa-dashboard"></i> 首页</a></li>';
	$(".breadcrumb").html(homeHtml);
	skip('/pages/common/home.jsp');
}

var TableInit = function() {
	var $datatable;
	var endpoint;
	var initChildTabel;
	var formData = JSON.stringify({});
	var init = function(opt) {
		$datatable = opt.datatable;
		endpoint = opt.endpoint;
		if (opt.formData) {
			formData = opt.formData;
		}
		var tableObj = {
			url : contextPath + endpoint, // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : opt.pagination || true, // 是否显示分页（*）
			sortable : opt.sortable || false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : this.queryParams,// 传递参数（*）
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : opt.pageSize || 10, // 每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
			strictSearch : true,
			clickToSelect : true, // 是否启用点击选中行
			// height : opt.height || 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "id", // 每一行的唯一标识，一般为主键列
			cardView : false, // 是否显示详细视图
			detailView : opt.detailView || false, // 是否显示父子表
			columns : opt.columns,
			showColumns : opt.showColumns || false,
			formatShowingRows : function(pageFrom, pageTo, totalRows) {
				if (opt.formatShowingRows === false) {
					return "";
				} else {
					return '显示第 ' + pageFrom + ' 到第 ' + pageTo + ' 条记录，总共 '
							+ totalRows + ' 条记录';
				}
			},
			// 注册加载子表的事件。注意下这里的三个参数！
			onExpandRow : function(index, row, $detail) {
				InitSubTable(index, row, $detail);
			},
			onLoadError : function(status, obj) {
				BootstrapDialog.alert("查询失败");
				console.log(obj);
			}
		};
		if (opt.toolbar) {
			tableObj.toolbar = opt.toolbar;
		}
		if (opt.height != 'false') {
			tableObj.height = opt.height || 550;
		}
		$datatable.bootstrapTable(tableObj);
	};

	var refresh = function(opt) {
		if (opt.formData) {
			formData = opt.formData;
		} else {
			formData = JSON.stringify({});
		}
		if (opt.datatable) {
			$datatable = opt.datatable;
		}
		if (opt.endpoint) {
			endpoint = opt.endpoint;
		}
		$datatable.bootstrapTable('refresh', {
			queryParams : this.queryParams
		});
	}

	var initQueryParams = function(params) {
		var start;
		if (params.offset == 0) {
			start = 0;
		} else {
			start = params.offset / params.limit;
		}
		return {
			length : params.limit, // 页面大小
			start : start, // 页码
			endpoint : endpoint,
			formData : formData,
			isPage : true
		};
	};

	// 得到查询的参数
	var queryParams = function(params) {
		var start;
		var sort;
		var order;
		if (params.offset == 0) {
			start = 0;
		} else {
			start = params.offset / params.limit;
		}
		var _data = JSON.parse(formData);
		var _options = $datatable.bootstrapTable('getOptions');
		if (params.sort && _options.sortable) {
			if (params.sort) {
				_data.sort = params.sort;
			}
			if (params.order) {
				_data.order = params.order;
			}
		}
		return {
			length : params.limit, // 页面大小
			start : start, // 页码
			endpoint : endpoint,
			formData : JSON.stringify(_data),
			isPage : true,
			sort : sort,
			order : order
		};
	};
	return {
		"init" : init,
		"queryParams" : queryParams,
		"initQueryParams" : initQueryParams,
		"refresh" : refresh
	};
}();

var downloadFile = function(attachName, attachPath) {
	var form = document.createElement("form");
	document.body.appendChild(form);
	var nameInput = document.createElement("input");
	nameInput.type = "text";
	nameInput.name = "attachName";
	nameInput.value = attachName;
	var pathInput = document.createElement("input");
	pathInput.type = "text";
	pathInput.name = "attachPath";
	pathInput.value = attachPath;
	form.appendChild(nameInput);
	form.appendChild(pathInput);
	form.method = "POST";
	form.action = contextPath + "/downloadFile";
	form.submit();
	document.body.removeChild(form);
}

var ajaxFileUpload = function(elId, callback) {
	$.ajaxFileUpload({
		url : contextPath + '/uploadFile.do',
		secureuri : false,
		fileElementId : elId,
		dataType : 'json',
		success : function(data, status) {
			if (data.hasErrors) {
				BootstrapDialog.alert(data.errorInfo);
				return;
			}
			callback(data);
		},
		error : function(data, status, e) {
			BootstrapDialog.alert('上传出错');
		}
	})
	return false;
}

var ajaxFileUploadNoClick = function(elId, callback) {
	new AjaxUpload('#' + elId, {
		action : contextPath + '/uploadFile.do',
		name : 'file',
		responseType : 'json',
		data : {
			elId : elId
		},
		onSubmit : function(file, ext) {

		},
		onComplete : function(file, response) {
			if (response.hasErrors) {
				BootstrapDialog.alert(response.errorInfo);
				return;
			}
			callback(response);
		}
	});
}

var ajaxFileUploadNoClickNotList = function(elId, wjlx, callback) {
	new AjaxUpload('#' + elId, {
		action : contextPath + '/uploadFile.do',
		name : 'file',
		responseType : 'json',
		data : {
			elId : elId,
			wjlx : wjlx
		},
		onSubmit : function(file, ext) {

		},
		onComplete : function(file, response) {
			if (response.hasErrors) {
				BootstrapDialog.alert(response.errorInfo);
				return;
			}
			callback(response);
		}
	});
}

var autoSetTrIndex = function(talbeId) {
	$("#" + talbeId + " tr").each(function(index) {
		if (index > 0) {
			var $tr = $(this);
			$tr.find("td").each(function(i) {
				if (i == 0) {
					$(this).html(index);
				}
			});
		}
	});
}

var fileUploadCallBack = function(data) {
	var elId = data.elId;
	var hrefstr = data.attachPath.replace('&amp;', '&');
	$('#' + elId + 'AttachName').val(data.attachName);
	$('#' + elId + 'Attach').val(hrefstr);
	$("#" + elId).addClass("hidden");
	$("#" + elId + "show").removeClass("hidden");
	$("#" + elId + "show").find(".file_download").html(data.attachName).attr(
			"href", hrefstr);
};

$(function() {
	$("body").on("click", ".file_delete", function() {
		var $this = $(this);
		BootstrapDialog.confirm("确认删除吗", function(result) {
			if (result) {
				var data_id = $this.attr("data-id");
				$("#" + data_id + "AttachName").val("");
				$("#" + data_id + "Attach").val("");

				$("#" + data_id).removeClass("hidden");
				$("#" + data_id + "show").addClass("hidden");
			} else {
				return;
			}
		});
	});
});

var initSingelFile = function(data) {
	$(".file_div").each(
			function() {
				var data_id = $(this).attr("id");
				if (data[data_id + "AttachName"]) {
					$("#" + data_id + "AttachName").val(
							data[data_id + "AttachName"]);
					$("#" + data_id + "Attach").val(data[data_id + "Attach"]);
					var $downDiv = $(this).next();
					$downDiv.find(".file_download").html(
							data[data_id + "AttachName"]).attr("href",
							data[data_id + "Attach"]);
					$downDiv.removeClass("hidden");
					$(this).addClass("hidden");
				}
			});
}
if(window.BootstrapDialog){
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '提示';
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '提示';
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '提示';
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '成功';
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '警告';
	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '错误';
	BootstrapDialog.DEFAULT_TEXTS['OK'] = '确定';
	BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '取消';
	BootstrapDialog.DEFAULT_TEXTS['CONFIRM'] = 'Confirmation';
}

(function($) {
	$.fn.ValidformCustom = function(option) {
		var opt = option || {};
		var datatypeCustom = {
			zh : /^[\u4E00-\u9FA5\uf900-\ufa2d]*$/,
			decimal : /^-?[1-9]+(\.\d+)?$|^-?0(\.\d+)?$|^-?[1-9]+[0-9]*(\.\d+)?$/,
			percent : function(gets, obj, curform, regxp) {
				var reg = /^-?[1-9]+(\.\d+)?$|^-?0(\.\d+)?$|^-?[1-9]+[0-9]*(\.\d+)?$/;
				if (!reg.test(gets)) {
					return false;
				}
				if (gets < 0 || gets > 100) {
					return false;
				}
				return true;
			}
		};
		var datatype = {};
		$.extend(datatype, datatypeCustom, opt.datatype || {});
		return this.Validform({
			ignoreHidden : opt.ignoreHidden || true,
			datatype : datatype,
			tiptype : function(msg, o, cssctl) {
				if (!o.obj.is("form")) {
					var objtip = o.obj.siblings(".Validform_checktip");
					cssctl(objtip, o.type);
					objtip.text(msg);
				} else {
					var objtip = o.obj.find("#msgdemo");
					cssctl(objtip, o.type);
					objtip.text(msg);
				}
			}
		});
	};
})(jQuery);

var ignoreValid = function($form, validform) {
	validform.unignore();
	$form.find("input:text").each(function() {
		if (!$(this).val()) {
			validform.ignore($(this));
		}
	});
	$form.find("textarea").each(function() {
		if (!$(this).val()) {
			validform.ignore($(this));
		}
	});
}

var getDictionaryByCode = function(code, callback) {
	var opt = {};
	var url = contextPath + "/platform/client.do";
	opt = {
		success : function(msg) {
			callback(msg);
		},
		data : code,
		endpoint : "/dictionary/getDictionaryByCode",
		failure : function(msg) {
			return null;
		}
	};
	Ajax.post(url, opt);
}
