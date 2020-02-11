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
<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />
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
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>管理员列表 - 管理员列表</title>
</head>
<body>
<#include "commonHead.ftl">
<div class="dislpayArrow hidden-xs"> <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a> </div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		管理员管理
		<span class="c-gray en">&gt;</span>
		管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
	<div class="Hui-article">
		<article class="cl pd-20">

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
					<a href="javascript:;" onclick="admin_add('添加管理员','${ctx}/admin/addPage','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a>
				</span>
				     &nbsp;
				   <#-- <a href="javascript:;" onclick="permission_add('管理员授权','${ctx}/admin/permissionPage','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 管理员授权</a> </span>
-->
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="12">管理员列表</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="40">序号</th>
						<th width="150">登录名</th>
						<th width="150">邮箱</th>
						<th width="80">角色</th>
						<th width="80">性别</th>
						<th width="130">加入时间</th>
						<th width="130">备注</th>
						<th width="100">是否已启用</th>
						<th width="100">操作</th>
						<th width="100">修改密码</th>
						<th width="50">授权</th>
					</tr>
				</thead>
				<tbody>
				 <#list list   as  item>
					<tr class="text-c">
						<td><input type="checkbox" value="${item.id}" name=""></td>
						<td>${item_index+1}</td>
						<td>${item.username}</td>
						<td>${item.email}</td>
						<td>
							<#if item.role==1>超级管理员</#if>
							<#if item.role==2>普通管理员</#if>
						</td>
						<td>
						    <#if item.sex==1>男</#if>
							<#if item.sex==2>女</#if>
						</td>
						<td>${item.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
						<td><#if item.remark??>${item.remark}</#if></td>
						<td class="td-status">
							<#if item.state==1><span class="label label-success radius">已启用</span></#if>
							<#if item.state==2><span class="label radius">已停用</span></#if>
						</td>
						<td class="td-manage">
							<#if item.state==1><a style="text-decoration:none" onClick="admin_stop(this,'${item.username}','2')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> </#if>
							<#if item.state==2><a style="text-decoration:none" onClick="admin_start(this,'${item.username}','1')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a> </#if>
							<a title="编辑" href="javascript:;" onclick="admin_edit('编辑','${ctx}/admin/editPage/${item.id}','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除" href="javascript:;" onclick="admin_del(this,'${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>

						</td>
						 <td>
							 <a title="编辑" href="javascript:;" onclick="changPasswd_page('修改密码','${ctx}/admin/changPwdPage/${item.id}'+'-'+'${item.username}','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
						 </td>

						<td>
							<a href="javascript:;" onclick="permission_add('管理员授权','${ctx}/admin/permissionPage','800','500','${item.username}','${item.id}')" class="btn btn-primary radius"> 管理员授权</a> </span>
						</td>
					</tr>

				 </#list>
				</tbody>
			</table>
		</article>
	</div>
	  <input type="hidden" id="hId">
	 <input type="hidden" id="hUsername">
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
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}

function getUserId(id,username) {

	$("#hId").val(id);
	$("#hUsername").val(username);

  // console.log(id);
}


function  permission_add(title,url,w,h,username,id) {
     username+="-"+id;
     url = url+"/?username="+username;
     //console.log(url);
	layer_show(title,url,w,h);




	
}



/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index) {
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
			type: "post",
			url: "${ctx}/admin/delete",
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
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	//console.log(url);
	layer.open({
		type: 2,
		area: ['90%', '90%'],
		fix: false, //不固定
		maxmin: true,
		// shade:0.4,
		title: title,
		content: url
	});
}
/*管理员-停用*/
function admin_stop(obj,username,state){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……

		$.ajax({
			type:"post",
			url:"${ctx}/admin/state",
			data:{
				username:username,
				state:state
			},
			dataType: 'json',
			success: function(data){
			/*	$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
				$(obj).remove();*/
				layer.msg('已停用!',{
					icon: 5,
					time:1000,
					end:function(){
						window.location.reload();
					}
				});
			}
		})
	});
}

/*管理员-启用*/
function admin_start(obj,username,state){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理…

		$.ajax({
			type:"post",
			url:"${ctx}/admin/state",
			data:{
				username:username,
				state:state
			},
			dataType: 'json',
			success: function(data){
				/*$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();*/
				layer.msg('已启用!', {
					icon: 6,
					time:1000,
					end:function(){
						window.location.reload();
					}
				});
			}

		})

	});
}


//跳转到修改密码页面
function  changPasswd_page(title,url,id,w,h){
	//console.log(url);
	layer.open({
		type: 2,
		area: ['90%', '90%'],
		fix: false, //不固定
		maxmin: true,
		// shade:0.4,
		title: title,
		content: url
	});
}


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>