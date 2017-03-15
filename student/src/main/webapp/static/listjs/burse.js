
var TableInit = function (clazz) {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_departments').bootstrapTable({
            url: '/student/burse/list',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 6,                       //每页的记录行数（*）
            pageList: [6, 10, 15],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            classes: "table table-bordered",
            rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = "";
                if (index == 0) {
                    strclass = 'success';//还有一个active
                }
                else if (index >= 1 && index <= 3) {
                    strclass = 'info';
                }
                else if (index > 3 && index <= 9) {
                	strclass = 'warning';
                }
                else {
                	return {};
                }
                return { classes: strclass }
            },
            columns: [ {
                field: 'stuId',
                title: '学号',
            }, {
                field: 'stuName',
                title: '学生	姓名'
            }, {
                field: 'majoy',
                title: '专业'
            }, {
                field: 'clazz',
                title: '班级'
            }, {
                field: 'sumScore',
                title: '成绩积分'
            }, {
                field: 'id',
                title: '奖学金',
                formatter:function(value,row,index){
                	var strclass = "";
                    if (index == 0) {
                        strclass = '一等奖学金';
                    }
                    else if (index >= 1 && index <= 3) {
                        strclass = '二等奖学金';
                    }
                    else if (index > 3 && index <= 9) {
                    	strclass = '三等奖学金';
                    }
                    return strclass
            	}
            }]                          
        });                             
    };   
    
    //得到查询的                    } 参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val(),
            clazz: clazz
        };
        return temp;
    };
    return oTableInit;
};

var TableInitJX = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_lizhi').bootstrapTable({
            url: '/student/burse/listLZ',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 6,                       //每页的记录行数（*）
            pageList: [6, 10, 15],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            classes: "table table-bordered",
            columns: [ {
                field: 'stuId',
                title: '学号',
            }, {
                field: 'stuName',
                title: '学生	姓名'
            }, {
                field: 'majoy',
                title: '专业'
            }, {
                field: 'clazz',
                title: '班级'
            }, {
                field: 'sumScore',
                title: '成绩积分'
            }, {
                field: 'id',
                title: '奖学金',
                formatter:function(value,row,index){
                    return "励志奖学金";
            	}
            }]                          
        });                             
    }; 
    
    //得到查询的                    } 参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val()
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};