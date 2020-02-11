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

	<title>视频</title>
</head>
<body>
<#include "commonHead.ftl">

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span>登录日志<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a href="javascript:;" onclick="del()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <#--<span class="r">共有数据：<strong>54</strong> 条</span>-->
			</div>


			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="80">序号</th>
						<th width="17%">状态</th>
						<th width="17%">用户名</th>
						<th width="120">客户端IP</th>
						<th width="120">时间</th>
						<th width="70">操作</th>
					</tr>
					</thead>
					<tbody>

					<#if list??>
						<#list list as item>
					<tr class="text-c">
						<td><input type="checkbox" value="${item.id}" name=""></td>
						<td>${item_index+1}</td>
						<td><font color="#32cd32">登录成功</font></td>
						<td>${item.loginUser}</td>
						<td>${item.remoteIp}</td>
						<td>${item.time?string('yyyy-MM-dd HH:mm:ss')}</td>
						<td>
							<a title="删除" href="javascript:;" onclick="system_log_del(this,'${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
							</#list>
                    </#if>
					</tbody>
				</table>
			</div>
		</article>

		<#--   <video src="D:/IdeaProjects/zhiweeProject/CompanyWebPage/src/main/webapp/upload/video.mp4" controls="controls">
           </video>
   -->
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
			//  {"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{"orderable":false,"aTargets":[0,4]}// 制定列不参与排序
		]
	});


	function del() {
		var selectList = jQuery(".table tbody input[type=checkbox]:checked").map(function () {
			return jQuery(this).val();

		}).get().join(',');

		//console.log(selectList);

		layer.confirm('确认要删除吗？',function(index) {

			$.ajax({
				type: 'POST',
				url: '${ctx}/log/branchDelete',
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
		})



	}




	function system_log_del(obj,id){
		layer.confirm('确认要删除吗？',function(index) {
			//此处请求后台程序，下方是成功后的前台处理……
			$.ajax({
				type: "post",
				url: "${ctx}/log/delete",
				data: {
					id: id
				},
				dataType: 'json',
				success: function (data) {
					layer.msg('删除成功!', {
						icon: 1,
						time: 1000,
						end: function () {
							$(obj).parents("tr").remove();
						}
					});
				}
			});
		})
	}


</script>
</body>
</html>