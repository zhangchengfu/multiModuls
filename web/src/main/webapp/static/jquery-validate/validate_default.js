/**
 * Created with IntelliJ IDEA.
 * User: gg
 * Date: 14-4-25
 * Time: 下午4:39
 * To change this template use File | Settings | File Templates.
 */

$.validator.setDefaults({
    errorElement: 'div',
    errorClass: 'error_style',
    focusInvalid: true,
    invalidHandler: function (event, validator) { //display error alert on form submit
        $('.alert-danger', $('.login-form')).show();
    },

    highlight: function (e) {
        $(e).parent().removeClass('has-info').addClass('has-error');
    },
    
    success: function (e) {
        $(e).parent().removeClass('has-error').addClass('has-info');
        $(e).remove();
    },

    errorPlacement: function (error, element) {
        if (element.is(':checkbox') || element.is(':radio')) {
            var controls = element.closest('div[class*="col-"]');
            if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
            else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
        }
        else if (element.is('.select2-hidden-accessible')) {
            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
        }
        else if (element.is('.chosen-select')) {
            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
        }
        else {
           var _getMessageContainer = function(element) {
                var $parent = element.parent();
                var cssClasses = $parent.attr('class');
                if (!cssClasses) {
                    return _getMessageContainer($parent);
                }
                cssClasses = cssClasses.split(' ');
                var n = cssClasses.length;
                for (var i = 0; i < n; i++) {
                    if (/^col-(xs|sm|md|lg)-\d+$/.test(cssClasses[i]) || /^col-(xs|sm|md|lg)-offset-\d+$/.test(cssClasses[i])) {
                        return $parent;
                    }
                }

                return _getMessageContainer($parent);
            }
           _getMessageContainer(element).append(error);
        }
    }
});
