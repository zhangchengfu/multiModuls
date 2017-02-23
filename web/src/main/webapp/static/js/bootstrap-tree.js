(function (root, factory) {

    "use strict";

    // CommonJS module is defined
    if (typeof module !== 'undefined' && module.exports) {
        var isNode = (typeof process !== "undefined");
        var isElectron = isNode && ('electron' in process.versions);
        if (isElectron) {
            root.BootstrapTree = factory(root.jQuery);
        } else {
            module.exports = factory(require('jquery'), require('bootstrap'));
        }
    }
    // AMD module is defined
    else if (typeof define === "function" && define.amd) {
        define("BootstrapTree", ["jquery", "bootstrap"], function ($) {
            return factory($);
        });
    } else {
        // planted over the root!
        root.BootstrapTree = factory(root.jQuery);
    }

}(this, function ($){
    var BootstrapTree = function (option) { //use constructor
        this.allocations = option;
        this.result = {};
        this.displayLevel = [];
        this.pageContext = "";
        this.checkChild = option.checkChild?option.checkChild:false;
        if(typeof(pageContext) != "undefined"){
            this.pageContext = pageContext+"/"
        }
    };
    BootstrapTree.prototype = {
        hasChild:function(obj){
            return (!!obj[this.allocations.children])||(!!obj[this.allocations.haschild]);
        },
        addResult:function(obj,parent){
            this.result[obj[this.allocations.key]] = obj;
            obj.parent = parent;
        },
        delResult:function(obj){
            delete this.result[obj[this.allocations.key]];
        },
        on:function(element,status){
            var tree = this;
            if(status === "show"){
                element.click(function(){
                    tree.addHideNode(element.parent());
                    element.nextAll("ul").hide(300);
                    element.remove();
                })
            }else{
                element.click(function(){
                    tree.addShowNode(element.parent());
                    element.nextAll("ul").show(300);
                    element.remove();
                })
            }
        },
        addShowNode:function(ele){
            var showNode = this.createShowNode();
            ele.prepend(showNode);
            this.on(showNode,"show");
        },
        createShowNode:function(){
            var partentNode = $("<div class='treeOpen'></div>");
            partentNode.css("background",'url("'+ this.pageContext +'static/images/tree/minus.png") no-repeat');
            return partentNode;
        },
        addHideNode:function(ele){
            var hideNode = this.createHideNode();
            ele.prepend(hideNode);
            this.on(hideNode,"hide");
        },
        createHideNode:function(){
            var partentNode = $("<div class='treeClose'></div>");
            partentNode.css("background",'url("'+ this.pageContext +'static/images/tree/plus.png") no-repeat');
            return partentNode;
        },
        createLoading:function(){
            return "加载中...";
        },
        ajaxRequest:function(parent,hideNode,obj,level){
            var tree = this;
            hideNode.click(function(){
                tree.addShowNode(element.parent());
                element.remove();
                var ajaxData = {};
                ajaxData[tree.allocations.key] = obj[tree.allocations.key];
                parent.append(tree.createLoading());
                $.post(tree.allocations.url,ajaxData,function(json){
                    parent.append(tree.createChild(json[tree.allocations.getdata],obj,level,true))
                })
            })
        },
        addAjaxHideNode:function(ele,level){
            var hideNode = this.createHideNode();
            ele.prepend(hideNode);
            this.ajaxRequest(ele,hideNode,level);
        },
        objClone:function(obj){
            return $.extend(true,{},obj);
        },
        check: function (element,status,obj,parent) {
            var tree = this;
            if(status === "check"){
                element.click(function(){
                    if(!!tree.allocations.checkLimit){
                        var treeLength = 0;
                        for(var i in tree.result) treeLength++;
                        if(treeLength < tree.allocations.checkLimit){
                            tree.addCheckNode(element.next(),obj);
                            tree.addResult(obj,parent);
                            element.remove();
                        }else{
                            tree.allocations.limitCallback("超过选择上限，最多可选"+tree.allocations.checkLimit+"个")
                        }
                    }else{
                        tree.addCheckNode(element.next(),obj);
                        tree.addResult(obj,parent);
                        element.remove();
                    }
                })
            }else{
                element.click(function(){
                    tree.addDischeckNode(element.next(),obj,parent);
                    tree.delResult(obj);
                    element.remove();
                })
            }
        },
        addDischeckNode:function(ele,obj,parent){
            var discheckNode = this.createDischeckNode();
            ele.before(discheckNode);
            this.check(discheckNode,"check",obj,parent);
        },
        createDischeckNode: function () {
            var discheckNode = $("<div class='tree-unchecked unchecked'></div>");
            discheckNode.css("background",'url("'+ this.pageContext +'static/images/tree/uncheck.png") no-repeat');
            return discheckNode
        },
        addCheckNode:function(ele,obj){
            var checkNode = this.createCheckNode();
            ele.before(checkNode);
            this.check(checkNode,"uncheck",obj);
        },
        createCheckNode: function () {
            var checkNode = $("<div class='tree-check check' aria-hidden='true'></div>");
            checkNode.css("background",'url("'+ this.pageContext +'static/images/tree/checked.png") no-repeat');
            return checkNode
        },
        getTree:function(){
            return this.$treeDom;
        },
        createChild:function(array,parent,level,line,close){
            var treeUl = $("<ul></ul>");
            if(close && level != 1){
                treeUl.css("display","none");
            }
            if(line){
                treeUl.css("background",'url("'+ this.pageContext +'static/images/tree/line_conn.gif") 0 0 repeat-y');
            }
            if(!!this.allocations.selectKey){
                var selectKey = this.allocations.selectKey.split(",")
            }
            if(!!this.allocations.selectValue){
                var selectValue = this.allocations.selectValue.split(",")
            }
            for (var i= 0;i <array.length;i++) {
                if(!!parent){
                    array[i].parent = parent;
                }
                var $parent = $("<li></li>");
                if(!this.hasChild(array[i])){
                    $parent = $("<li class='notHasChildren'></li>")
                }
                var $msg = $("<label>"+array[i][this.allocations.value]+"</label>");
                $parent.append($msg);
                if(!this.judeDisplayLevel(level)&&!(this.checkChild&&this.hasChild(array[i]))){
                    var select = false;
                    if(!!this.allocations.selectKey){
                        for(var j in selectKey){
                            if(selectKey[j] === array[i][this.allocations.key]){
                                select = true;
                                break;
                            }
                        }
                    }
                    if(!!this.allocations.selectValue && !select){
                        for(var j in selectValue){
                            if(selectValue[j] === array[i][this.allocations.value]){
                                select = true;
                                break;
                            }
                        }
                    }
                    if(!!this.allocations.checked&&!select){
                        if(array[i][this.allocations.checked]){
                            select = true;
                        }
                    }
                    if(select){
                        this.result[array[i][this.allocations.key]] = array[i];
                        this.addCheckNode($msg,array[i]);
                    }else{
                        this.addDischeckNode($msg,array[i],parent);
                    }
                }
                if(this.hasChild(array[i])){
                    if(!this.allocations.ajax){
                        if(i == array.length-1)
                            $parent.append(this.createChild(array[i][this.allocations.children],array[i],level+1,false,close));
                        else
                            $parent.append(this.createChild(array[i][this.allocations.children],array[i],level+1,true,close));
                        if(close){
                            this.addHideNode($parent);
                        }else{
                            this.addShowNode($parent);
                        }
                    }else{
                        this.addAjaxHideNode($parent,level+1);
                    }
                }
                treeUl.append($parent);
            }
            this.level = this.level+1;
            return treeUl;
        },
        createTree:function(){
            var $tree = $("<div class='BootstrapTree'></div>");
            if(!!this.allocations.displayLevel){
                this.displayLevel = this.allocations.displayLevel.split(",");
            }
            if(typeof (this.allocations.collapse) == "undefined"){
                this.allocations.collapse = false;
            }
            $tree.append(this.createChild(this.allocations.treeData,null,1,false,this.allocations.collapse));
            this.$treeDom = $tree;
            return $tree;
        },
        judeDisplayLevel:function(level){
            var display = false;
            for(var i=0;i<this.displayLevel.length;i++){
                if(this.displayLevel[i] == level.toString()){
                    display = true;
                    break;
                }
            }
            return display;
        },
        open: function () {
            var tree = this.createTree();
            if(!!this.allocations.$id){
                $("#"+this.allocations.$id).append(tree);
            }
            if(!!this.allocations.element){
                this.allocations.element.append(tree);
            }
            return this;
        },
        refresh:function(option){
            if(!!this.allocations.$id){
                $("#"+this.allocations.$id).remove();
            }
            if(!!this.allocations.element){
                this.allocations.element.remove();
            }
            if(!!option.$id || !!option.element){
                this.allocations.$id = null;
                this.allocations.element = null;
            }
            $.extend(this.allocations,option);
            this.result = {};
            this.open();
        },
        allSelect:function(){
            $.each($(".BootstrapTree .unchecked"),function(){
                $(this).trigger("click");
            });
        },
        clearSelect:function(){
            $.each($(".BootstrapTree .check"),function(){
                $(this).trigger("click");
            });
        },
        closeAll:function(){
            this.getTree().find(".treeOpen").trigger("click");
        },
        openAll:function(){
            this.getTree().find(".treeClose").trigger("click");
        },
        //获取父级
        getParent:function(x){
            var resultObj = this.result;
            var parentObj;
            var tree = this;
            for(var i=0;i<x;i++){
                parentObj = {};
                $.each(resultObj,function(name,value){
                    if(!!value.parent){
                        parentObj[value.parent[tree.allocations.key]] = value.parent
                    }
                });
                resultObj = parentObj;
            }
            return resultObj;
        },
        getParentAll:function(x){
            var array = [];
            var result = this.getParent(x);
            for(var key in result){
                array.push(result[key])
            }
            return array
        },
        getParentKeys:function (x){
            var result = this.getParent(x);
            var keys = "";
            for(var key in result){
                keys += key+","
            }
            keys = keys.substring(0,keys.length-1);
            return keys
        },
        getParentValues:function (x){
            var result = this.getParent(x);
            var values = "";
            for(var key in result){
                values += $.trim(result[key][this.allocations.value])+","
            }
            values = values.substring(0,values.length-1);
            return values
        },
        getAll:function(){
            var array = [];
            var result = this.result;
            for(var key in result){
                array.push(result[key])
            }
            return array;
        },
        getKeys:function(){
            var keys = "";
            var result = this.result;
            for(var key in result){
                keys += key+","
            }
            keys = keys.substring(0,keys.length-1);
            return keys
        },
        getValues:function(){
            var values = "";
            var result = this.result;
            for(var key in result){
                values += $.trim(result[key][this.allocations.value])+","
            }
            values = values.substring(0,values.length-1);
            return values
        }

    };
    BootstrapTree.show = function(option){
        return new BootstrapTree(option).open();
    };
    return BootstrapTree;
}));