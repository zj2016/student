$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});

function rm(id){
	$.ajax({
        type: "get",
        url: "/student/student/remove/ad",
        data: {stuId: id},
        success: function (data) {
        	if(data.code != null){
        	if(data.code == 10000){
        		alert("删除成功");
        		$("button[name='refresh']").trigger('click');
        	}else{
        		alert("删除失败");
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

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_departments').bootstrapTable({
            url: '/student/student/list',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',              //工具按钮用哪个容器
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
            columns: [{
                field: 'stuId',
                title: '学号',
                width: 100
            }, {
                field: 'stuName',
                title: '姓名',
                width: 100
            }, {
                field: 'majoy',
                title: '专业',
                width: 100
            }, {
                field: 'clazz',
                title: '班级',
                width: 100
            }, {
            	field: 'stuId',
            	title: '操作',
            	width: 100,
            	formatter:function(value,row,index){
            		//通过formatter可以自定义列显示的内容
            		//value：当前field的值，即id
            		//row：当前行的数据
            		// &nbsp;<a href="javascript:;" onclick="rm(\''+value+'\')"><span class="glyphicon glyphicon-edit"></span> 删除</a>
            		var a = '<a class="button border-green button-little" href="/student/student/student_detail?stuId=' + value + '">详情</a>'
            			+'&nbsp;<a class="button border-blue button-little" href="/student/student/student_edit?stuId=' + value + '">修改</a>'
            			+'&nbsp;<a class="button border-yellow button-little" href="javascript:;" onclick="rm(\''+value+'\')">删除</a>';
            		return a;
            	}
            },{
            	field: 'stuId',
            	title: '功能',
            	width: 200,
            	formatter:function(value,row,index){
            		//通过formatter可以自定义列显示的内容
            		//value：当前field的值，即id
            		//row：当前行的数据
            		//<a class="button border-blue button-little" href="#">修改</a> <a class="button border-yellow button-little" href="#">删除</a>
            		var a = '&nbsp;<a href="/student/grade/grade_add?stuId=' +value+ '"><span class="glyphicon"></span>添加成绩</a>'
            			+ '&nbsp;&nbsp;<a href="/student/mark/mark_add?stuId=' +value+ '"><span class="glyphicon"></span>加/扣分</a>';
            		return a;
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