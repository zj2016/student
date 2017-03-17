$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_grade').bootstrapTable({
            url: '/student/grade/list',         //请求后台的URL（*）
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
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            searchOnEnterKey: true,
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            //clickToSelect: true,                //是否启用点击选中行
            //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            classes: "table table-bordered",
            rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = "";
                if (row.score >= 60) {
                    strclass = 'success';//还有一个active
                }
                else if (row.score < 60) {
                    strclass = 'danger';
                }
                else {
                    return {};
                }
                return { classes: strclass }
            },
            columns: [{
                field: 'stuId',
                title: '学号'
            }, {
                field: 'stuName',
                title: '学生姓名'
            }, {
                field: 'couName',
                title: '课程'
            }, {
            	field: 'score',
            	title: '分数',
            	editable:true
            }],
            onEditableSave: function (field, row, oldValue, $el) {
            	//四个参数field, row, oldValue, $el分别对应着当前列的名称、当前行数据对象、更新前的值、编辑的当前单元格的jQuery对象。
            	$.ajax({
                    type: "post",
                    url: "/student/grade/update/ad",
                    data: {gradeId: row.gradeId, score: row.score},
                    success: function (data) {
                    	if(data.code != null){
                    	if(data.code == 10000){
                    		alert("更新成功");
                    	}else{
                    		alert(data.info);
                    	}
                    }else{
                		alert(data);
                	}
                    },
                    error: function () {
                        alert("失败，网络异常");
                    },
                    complete: function () {

                    }

                });
            }
        });                             
    };   
                                       
    //得到查询的                    } 参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val(),
            stuId: params.search
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