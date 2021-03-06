﻿<!DOCTYPE HTML>
<html>
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
<link href="${ctx}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->

<link href="${ctx}/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
<title>刊物图片展示</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	图片管理
	<span class="c-gray en">&gt;</span>
	图片展示
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
		<a class="btn btn-primary"><i>&#xe6df;</i>图片列表</a>
		</span>
	</div>



	<div class="portfolio-content">

		<ul class="cl portfolio-area">

			<#list  result.contentUrl as url >
			<li class="item">
				<div class="portfoliobox">
				<#--	<input class="checkbox" name="" type="checkbox" value="">-->
					<div class="picbox">
						<a href="${url}" data-lightbox="gallery" ><img src="${url}"></a>
					 <#--   <a onclick="imgdel('${url}')" class="btn btn-danger ">删除</a>-->
                        <#--<button ></button>-->
					</div>
				</div>
			</li>
			</#list>
		</ul>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/lightbox2/2.8.1/js/lightbox.min.js"></script>
<script type="text/javascript">

function imgdel(url) {
    //console.log(url);
    layer.confirm('确认要删除吗？',function(index){

    $.ajax({
        type: 'POST',
        url:"${ctx}/publication/img/delete",
        data:{
            url:url
        },
        dataType: 'json',
        success:function(result) {
            if(result.code==200){
                layer.msg('已删除!',{icon:1,time:1000});
                window.location.reload();
            }else{
                layer.msg('删除失败!',{icon:1,time:1000});
            }
        }
    });
    });

}

</script>
</body>
</html>