+function($){
	$.uploadImg = function(callback){
		/*$.get(contextPath + "/static/upload/uploadImg.jsp",function(data){
			
		});*/
		BootstrapDialog.show({
			title:"<h4>上传</h4>",
			page:{
				url:contextPath + '/static/upload/uploadImg.jsp',
				callback:function(){}
			},
			buttons:[
	            {
	            	label:'提交',
	            	cssClass: 'btn-sm btn-success',
	            	action:function(dialog){
	            		var form = dialog.getModalBody().find("#fileUploadId");
	            		var imageName = form.find("#file").val();
	            		if(!imageName || imageName.indexOf('.') < 0){
	            			alert("请上传图片");
	            			return;
	            		} else if (!isAcceptableImage(imageName.substring(imageName.lastIndexOf('.')))) {
	            			alert(图片格式不正确);
	            			return;
	            		}
	            		var ajax_option = {
	            			url : contextPath + "/upload/img",
	            			success : function(res) {
	            				dialog.close();
	            				callback.call(this,res);
	            			},
	            			error : function() {
	            				alert("图片上传失败");
	            			}
	            		};
	            		form.ajaxSubmit(ajax_option);
	            	}
	            },
	            {
	            	label:'关闭',
	            	cssClass: 'btn-sm btn-default',
	            	action: function(dialog) {
	    		        dialog.close();
	    		    }
	            }
            ],
            closable: false,
            size:'size-large',
            onshown:function(dialog){
            	
            }
		});
	}
	
	function isAcceptableImage(imageExt) {
		var imageExts = ['.jpg','.jpeg','.png'];
		if (imageExts.indexOf(imageExt.toLowerCase()) < 0 || !imageExt) {
			return false;
		} else {
			return true;
		}
	}
}(window.jQuery)