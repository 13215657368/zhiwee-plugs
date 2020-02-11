<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
<#include "common.ftl">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>代理商</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<#include "commonHead.ftl">
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 代理商 <span class="c-gray en">&gt;</span> 格力电器经销商<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
			<#--<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">-->
				<#--<a href="javascript:;" onclick="del()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			     <a href="javascript:;" onclick="member_add('添加代理商','${ctx}/business/addPage')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加代理商</a>
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
				<input type="file" multiple name="file" class="input-file" multiple>
				</span>
                <button id="submitBtn"  onclick="sub()"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>批量导入</button>
                &nbsp;&nbsp;
				<button id="submitBtn"  class="btn btn-primary radius"  onclick="Export()" type="button" style="width: 130px;height: 30px; ">批量导出</button>-->

                <div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l">
				<a href="javascript:;" onclick="del()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a href="javascript:;" onclick="member_add('添加代理商','${ctx}/business/addPage')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加经销商</a>
				</span>
                    &nbsp;&nbsp;
                    <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
				<input type="file" multiple name="file" class="input-file" multiple>
				</span>
                    <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>批量导入</button>

                    &nbsp;&nbsp;
				<#--	<font style="color: #2e8ded">正在导入</font>-->
                    <button   class="btn btn-primary radius"  onclick="Export()" type="button" style="width: 130px;height: 30px; ">批量导出</button>
                </div>
				<div id="showTag" style="display: none"><MARQUEE  scrollAmount=2 scrollDelay=150 direction=right height=40><h4 style="color: #2e8ded;">正在导入,请稍后</h4></marquee></div>
			</form>

			<#---->
         <#--   <form id="fileForm2"  class="form form-horizontal" enctype="multipart/form-data">
				<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
				<input type="file" multiple name="file" class="input-file" multiple>
				</span>
				<button id="submitBtn"  onclick="sub()"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>批量导入</button>
				&nbsp;&nbsp;
			</form>

            <form id="fileForm3"  class="form form-horizontal" enctype="multipart/form-data">
				<span class="btn-upload form-group">
				 <label style="color: #cc0000;">格力电器:</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
				<input class="input-text upload-url" type="text" name="uploadfile2" id="uploadfile2" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
					<input type="file" multiple name="file" class="input-file" multiple>
				</span>
				<button id="submitBtn2"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>批量导入</button>
				&nbsp;&nbsp;
			</form>
                 &nbsp;&nbsp;
				<br>-->

			<#---->


		<#--	</div>-->


			<div class="mt-20">
				<table class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">授权编号</th>
							<th width="100">经营类型</th>
							<th width="100">公司名称</th>
							<th width="90">法人代表</th>
							<th width="150">电话</th>
							<th width="100">地址</th>
							<th width="130">网点星级</th>
							<th width="50">操作</th>
						</tr>
					</thead>
					<tbody>
                     <#list  result.result as item>
						<tr class="text-c">
							<td><input type="checkbox" value="${item.id}" name=""></td>
							<td>${item.authNum}</td>
						<#--	<#if item.type ==1>格力新闻</#if><#if item.type ==2>行业动态</#if><#if item.type ==3>最新活动</#if>-->
							<td><#if item.businessType ==1>卖场</#if>
								<#if item.businessType ==2>专卖店</#if>
								<#if item.businessType ==3>专营店</#if>
                                <#if item.businessType ==4>代理商</#if>
							</td>
							<td>${item.companyName}</td>
							<td>${item.represent}</td>
							<td>${item.tel}</td>
							<td class="text-l">${item.location}</td>
							<td>${item.level}</td>
							<td class="td-manage"> <a title="编辑" href="javascript:;" onclick="member_edit('编辑','${ctx}/business/edit?id=${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
					 </#list>
					</tbody>
				</table>
			</div>
		</article>
	</div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
	function Export(){
		window.location.href="${ctx}/business/export"
	}
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
		]
	});
	/*$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});*/
});
/*用户-添加*/
function member_add(title,url){
	//layer_show(title,url,w,h);
    var index = layer.open({
		type: 2,
		area: ['75%', '75%'],
		// offset: 'rb', //右下角弹出
		title:title,
		content: url,
		end: function () {
			location.reload();
		}
    });
    //layer.full(index);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}


/*用户-编辑*/
function member_edit(title,url){
    var index = layer.open({
		type: 2,
		area: ['75%', '75%'],
		// offset: 'rb', //右下角弹出
		title:title,
		content: url,
		end: function () {
		//	location.reload();   退出之后，页面重新刷星
		}
    });
   // layer.full(index);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){

        $.ajax({
            type: 'POST',
            url: '${ctx}/business/delete',
            data:{
                id: id
            },
            dataType: 'json',
            success: function(data){
                console.log(data);
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {icon: 1, time: 1000});
            },
            error:function(data) {
                console.log("删除失败");
            },
        });
	});
}

function del() {
    var selectList = jQuery(".table tbody input[type=checkbox]:checked").map(function () {
        return jQuery(this).val();

    }).get().join(',');

    //console.log(selectList);

    $.ajax({
        type: 'POST',
        url: '${ctx}/business/BatchDelete',
        data:{
            ids: selectList
        },
        dataType: 'json',
        success: function(data){
            console.log(data);
            layer.msg('已删除!', {icon: 1, time: 1000});
            window.location.reload();
        },
        error:function(data) {
            console.log("删除失败");
        },
    });

}
$("#submitBtn").click(function () {
   // alert("aa");
   // return;
    /*var a = 1.0;
    alert(a.toFixed(0));
    return;*/


    //显示提示图标
	$("#showTag").show();

    $.ajax({
        url: "${ctx}/business/importBsInfo",
        data: new FormData($("#fileForm")[0]),
        processData: false,
        contentType: false,
        type: "POST",
        dataType: "json",
        success:function (result) {
            if(result.code==200){
                layer.msg("导入成功",{
                    icon:1,
                    time:5000,
                });
                //alert("导入成功");
				//隐藏提示图标
				$("#showTag").hide();
				window.location.reload();

            }else {
                layer.msg("导入异常，请重新导入",{
                    icon:2,
                    time:5000,
                });
				$("#showTag").hide();
				window.location.reload();

            }

        }

    })

})
    /*格力中央空调数据导入*/
function sub() {
	//alert("aa");
    $.ajax({
        url: "${ctx}/business/importBsInfo",
        data: new FormData($("#fileForm2")[0]),
        processData: false,
        contentType: false,
        type: "POST",
        dataType: "json",
        success:function (result) {
            if(result.code==200){
                layer.msg("导入成功",{
                    icon:1,
                    time:1500,
                });
                //alert("导入成功");
            }
        }
    })
}



/*$("#submitBtn").click(function () {
    alert("a");
	$.ajax({
		url: "${ctx}/business/importBsInfo",
		data: new FormData($("#fileForm2")[0]),
		processData: false,
		contentType: false,
		type: "POST",
		dataType: "json",
		success:function (result) {
			if(result.code==200){
				layer.msg("导入成功",{
					icon:1,
					time:1500,
				});
				//alert("导入成功");
			}
		}
	})
})*/

	/*格力电器数据导入*/
    $("#submitBtn2").click(function () {
        $.ajax({
            url: "${ctx}/business/importBsInfo2",
            data: new FormData($("#fileForm3")[0]),
            processData: false,
            contentType: false,
            type: "POST",
            dataType: "json",
            success:function (result) {
                if(result.code==200){
                    layer.msg("导入成功",{
                        icon:1,
                        time:1500,
                    });
                    //alert("导入成功");
                }
            }
        })
    })



</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>