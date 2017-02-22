 var DateTimePickerUtil = function(){
	var dateTimePicker = function(dateTimeInput,date){
        dateTimeInput.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd HH:ii:00",
            autoclose: true,
            todayBtn: true,
            minView: 0,
            maxView: 1,
            pickerPosition: 'bottom-left'
        });
        if(!!date){
            dateTimeInput.datetimepicker("setStartDate",date);
        }
    };
    
    var datePicker = function(dateInput,date){
        dateInput.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            minView: 2,
            maxView: 1,
            pickerPosition: 'bottom-left'
        });
        if(!!date) {
            dateInput.datetimepicker("setStartDate", date);
        }
    };
    
    var dateTimeInterval = function(startTime,endTime,date){
        startTime.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd HH:ii:00",
            autoclose: true,
            todayBtn: true,
            minView: 0,
            maxView: 1,
            pickerPosition: 'bottom-left'
        }).on('changeDate', function(ev){
            endTime.datetimepicker('setStartDate', $(ev.target).find("input").val());
        });
        if(!!date) {
            startTime.datetimepicker("setStartDate", date);
        }
        endTime.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd HH:ii:00",
            autoclose: true,
            todayBtn: true,
            minView: 0,
            maxView: 1,
            pickerPosition: 'bottom-left'
        }).on('changeDate', function(ev){
            startTime.datetimepicker('setEndDate', $(ev.target).find("input").val());
        })
    };
    
    var dateInterval = function(startTime,endTime,date){
        startTime.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            minView: 2,
            maxView: 1,
            pickerPosition: 'bottom-left'
        }).on('changeDate', function(ev){
            endTime.datetimepicker('setStartDate', $(ev.target).find("input").val());
        });
        if(!!date) {
            startTime.datetimepicker("setStartDate", date);
        }
        endTime.datetimepicker({
            language: 'zh-CN',
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            minView: 2,
            maxView: 1,
            pickerPosition: 'bottom-left'
        }).on('changeDate', function(ev){
            startTime.datetimepicker('setEndDate', $(ev.target).find("input").val());
        })
    };
    
    return{
        dateTimePicker:dateTimePicker,
        datePicker:datePicker,
        dateTimeInterval:dateTimeInterval,
        dateInterval:dateInterval
    }
    
}();