﻿<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<#include "common.ftl">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
<#--    <link rel="Bookmark" href="favicon.ico" >
    <link rel="Shortcut Icon" href="favicon.ico" />-->
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

    <title>图片列表</title>
</head>
<body>
<#include "commonHead.ftl">


<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品轮播图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">

            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l"><#--<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>-->
                    <a class="btn btn-primary radius" onclick="picture_add('添加图片','${ctx}/chart/addPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a></span>
                <#--<span class="r">共有数据：<strong>54</strong> 条</span>--> </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="10"><input name="" type="checkbox" value=""></th>
                        <th width="10">序号</th>
                        <th width="80">图片</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if result.code==200>
                   <#list  result.result as item>
                    <tr class="text-c">
                        <td><input name="" type="checkbox" value=""></td>
                        <td>${item_index+1}</td>

                        <td><img   width="200" height="80"  src="${item.url}"></td>
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="chart_edit('编辑','${ctx}/chart/edit?id=${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a style="text-decoration:none" class="ml-5" onClick="img_del(this,'${item.url}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            &nbsp;
                            <span style="color: orangered;" onclick="SortUp('${item.id}')"><i class="Hui-iconfont" style="size:A1">&#xe679;</i></span>
                            &nbsp;

                                <span style="color: orangered;" onclick="SortDown('${item.id}')"><i class="Hui-iconfont" style="size: A1">&#xe674;</i></span>

                        </td>

                    </tr>
                    </#list>
                    </#if>
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
    $('.table-sort').dataTable({
        "aaSorting": [[ 0, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,3]}// 制定列不参与排序
        ]
    });



    /*轮播图链接改动*/
    function chart_edit(title,url,w,h){
        var index = layer.open({
            type: 2,
            area: ['50%', '20%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
            /*    end: function () {
                    location.reload();
                }*/
        });

    }




   function SortUp(id){

       $.ajax({
           type: 'GET',
           url: '${ctx}/chart/sort?sortCode=1&id='+id,
           dataType: 'json',
           success: function (result) {

               if(result.code==200){
                   window.location.reload();
               }

           }
       });




    }

    function SortDown(id){
        $.ajax({
            type: 'GET',
            url: '${ctx}/chart/sort?sortCode=2&id='+id,
            dataType: 'json',
            success: function (result) {

                if(result.code==200){
                    window.location.reload();
                }

            }
        });

    }



    /*图片-编辑*/
    function pictureList_edit(title,url){
        var index = layer.open({
            type: 2,
            area: ['80%', '80%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
            end: function () {
                location.reload();
            }
        });
       // layer.full(index);
    }



    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            area: ['90%', '90%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
            end: function () {
                location.reload();
            }
        });
       // layer.full(index);
    }
    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-审核*/
    function picture_shenhe(obj,id){
        layer.confirm('审核文章？', {
                    btn: ['通过','不通过'],
                    shade: false
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布', {icon:6,time:1000});
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                    $(obj).remove();
                    layer.msg('未通过', {icon:5,time:1000});
                });
    }
    /*图片-下架*/
    function picture_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!',{icon: 5,time:1000});
        });
    }

    /*图片-发布*/
    function picture_start(obj,id){
        layer.confirm('确认要发布吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!',{icon: 6,time:1000});
        });
    }
    /*图片-申请上线*/
    function picture_shenqing(obj,id){
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    }
    /*图片-编辑*/
    function picture_edit(title,url,id){
        var index = layer.open({
            type: 2,
            area: ['90%', '90%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
            end: function () {
                location.reload();
            }
        });
        //layer.full(index);
    }
    /*图片-删除*/
    function img_del(obj,url) {
          layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            type: 'POST',
            url: '${ctx}/chart/img/delete',
            data: {
                url: url
            },
            dataType: 'json',
            success: function (data) {
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {icon: 1, time: 1000});
                window.location.reload();
            },
            error: function (data) {
                console.log("删除失败");
            },
        });
    })
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>