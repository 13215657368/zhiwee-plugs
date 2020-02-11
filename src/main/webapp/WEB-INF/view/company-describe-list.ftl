<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<#include "common.ftl">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<#--<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />-->
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}lib/respond.min.js"></script>
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

<title>新闻管理</title>

</head>
<body>
<#include "commonHead.ftl">
<#--<!--_header 作为公共模版分离出去&ndash;&gt;
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="aboutHui.shtml">admin</a>
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="aboutHui.shtml"></a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs"></span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>超级管理员</li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
							<li>
								<a href="#">切换账户</a>
							</li>
							<li>
								<a href="#">退出</a>
							</li>
						</ul>
					</li>
					<li id="Hui-msg">
						<a href="#" title="消息">
						<span class="badge badge-danger">1</span>
						<i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover">
						<a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li>
								<a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
							</li>
							<li>
								<a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="green" title="绿色">绿色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="red" title="红色">红色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
							</li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<!--/_header 作为公共模版分离出去&ndash;&gt;

<!--_menu 作为公共模版分离出去&ndash;&gt;
<aside class="Hui-aside">
	
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt class="selected"><i class="Hui-iconfont">&#xe616;</i> 新闻管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul>
					<li class="current">
						<a href="${ctx}/news/list" title="新闻管理">新闻管理</a>
					</li>
				</ul>
			</dd>
		</dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe616;</i> 产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="${ctx}/pro/list" title="产品管理">产品发布</a></li>
                </ul>
            </dd>
        </dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i>员工风采<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="${ctx}/active/list" title="图片管理">活动管理</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 人才招聘<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="/jobs/list" title="职位管理">职位管理</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 公司刊物<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="${ctx}/publication/list" title="刊物管理">刊物管理</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 专卖店<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="${ctx}/shops/list" title="专卖店管理">专卖店管理</a></li>

                </ul>
            </dd>
		</dl>

		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="system-base.html" title="密码修改">密码修改</a>
					</li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!--/_menu 作为公共模版分离出去&ndash;&gt;-->


<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		公司描述
		<span class="c-gray en">&gt;</span>
		列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>

	<#--aaaaaaaaaaaa-->
	<div class="Hui-article">
		<article class="cl pd-20">

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
<#--				<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>-->
				<button class="btn btn-primary radius" id="fabu" data-title="发布新闻"  onClick="article_add()" href="Javascript:;"><i class="Hui-iconfont">&#xe600;</i>发布</button>
				</span>
				<#--<span class="r">共有数据：<strong>54</strong> 条</span>-->
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="5"><input type="checkbox" name="" value=""></th>
							<th width="5">序号</th>
							<th width="300">更新时间</th>
							<th width="20">操作</th>
						</tr>
					</thead>
					<tbody>

                  <#--  <tr class="text-c">
                        <td><input type="checkbox" value="" name=""></td>
                        <td>01</td>
                        <td>01</td>
                        <td class="text-l"><u style="cursor:pointer" class="text-primary"  title="查看">01</u></td>
                        <td>01</td>
                        <td>2014-6-11 11:11:42</td>
                        <td class="f-14 td-manage">
                            <a style="text-decoration:none" class="ml-5" onClick="article_edit('新闻编辑','${ctx}/news/detail','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                        </td>
                    </tr>
-->
					<#list  list as item >
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td>${item_index+1}</td>
							<td>${item.createtime?string('yyyy-MM-dd HH:mm:ss')}</td>
							<td class="f-14 td-manage">
                                <a style="text-decoration:none" class="ml-5" onClick="article_edit('编辑','${ctx}/companyDescribe/content?id='+'${item.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${item.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
						</tr>
					</#list>
					</tbody>
				</table>
			</div>
		</article>
	</div>


	<#--aaaaaaaaa-->

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
            {"orderable":false,"aTargets":[0,1]}// 制定列不参与排序
        ]
    });


    /*新闻-内容*/
    function article_content(title,url,w,h){
       /* var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);*/

        var index = layer.open({
            type: 2,
            area: ['80%', '80%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
        /*    end: function () {
                location.reload();
            }*/
        });

    //    layer_show(title,url,w,h);
    }

	$(function () {
		check();
	})

    function check() {
    	$.ajax({
			type: 'POST',
			url: '${ctx}/companyDescribe/check',
			dataType: 'json',
			success: function(result){
			  if(result.length>=1){
               $("#fabu").attr("disabled",'disabled');
			  }
			}


		})

	}


/*资讯-添加*/
function article_add(){
	var url='${ctx}/companyDescribe/addPage';
	var index = layer.open({
		type: 2,
		area: ['90%', '90%'],
		// offset: 'rb', //右下角弹出
		title:"增加",
		content: url,
		end: function () {
			location.reload();
		}
	});
	//layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url){
	var index = layer.open({
		type: 2,
		area: ['90%', '90%'],
		// offset: 'rb', //右下角弹出
		title:"修改",
		content: url,
		end: function () {
			location.reload();
		}

	});
	//layer.full(index);
	//layer.full(index);
}
/*资讯-删除*/
function article_del(obj,number){
	layer.confirm('确认要删除吗？',function(index){
	    /*console.log(obj);
	    alert(index);*/
	   // alert(id);
		$.ajax({
            type: 'POST',
			url: '${ctx}/companyDescribe/delete/'+number,
			success: function(data){
			   // if(data.code==200) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
            //    }
			},
			error:function(data) {
				layer.msg('删除失败!', {icon: 2, time: 1000});
			},
		});		
	});
}



/*新闻信息-批量删除*/

/*新闻信息回显*/





/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>