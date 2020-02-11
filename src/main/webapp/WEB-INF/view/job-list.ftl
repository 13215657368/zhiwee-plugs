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

<title>人才招聘 - 职位管理 </title>
</head>
<body>
<#include "commonHead.ftl">
<#--<!--_header 作为公共模版分离出去&ndash;&gt;
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">admin</a>
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a>
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
						<a href="${ctx}/news/list" title="新闻发布">新闻发布</a>
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
			<dt><i class="Hui-iconfont">&#xe613;</i> 员工风采<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="${ctx}/active/list" title="活动管理">活动管理</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 人才招聘<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li>
						<a href="${ctx}/job/list" title="职位管理">职位管理</a>
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
		人才招聘
		<span class="c-gray en">&gt;</span>
		职位管理
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20">

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
			<#--	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>-->
				  <a class="btn btn-primary radius" data-title="添加职位"  onclick="article_add('添加职位','${ctx}/jobs/addPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加职位</a>

						<#--<a class="btn btn-primary radius" data-title="添加职位"  href="${ctx}/jobs/addPage"><i class="Hui-iconfont">&#xe600;</i> 添加职位</a>
-->

				</span>
				<#--<span class="r">共有数据：<strong>54</strong> 条</span>-->
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">序号</th>
							<th>职位</th>
							<th width="80">工作地点</th>
							<th width="80">学历</th>
							<th width="120">截止日期</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
					<#list jobList as item>
						<tr class="text-c">
							<#--jobList-->
							<td><input type="checkbox" value="" name=""></td>
							<td>${item_index+1}</td>
							<td>${item.role}</td>
							<td>${item.location}</td>
							<td><#if item.education =='1'>博士</#if><#if item.education =='2'>硕士</#if><#if item.education =='3'>本科</#if><#if item.education =='4'>高中及以下学历</#if></td>
							<td>${item.date}</td>
							<td class="f-14 td-manage">
								<a style="text-decoration:none" class="ml-5" onClick="jobinfo_edit('职位信息编辑','${ctx}/jobs/detail?id=${item.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration:none" class="ml-5" onClick="job_del(this,'${ctx}/jobs/delete?id=${item.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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


    $('.table-sort').dataTable({
        "aaSorting": [[ 0, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,1]}// 不参与排序的列
        ]
    });

/*资讯-添加*/
function article_add(title,url,w,h){
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
/*资讯-编辑*/
function jobinfo_edit(title,url){
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
/*资讯-删除*/
function job_del(obj,url){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: url,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

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




</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>