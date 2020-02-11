<!DOCTYPE HTML>
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
<link href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<title>文章内容</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
  <dl style="margin-left:80px; color:#fff"  >
      <dt><span  id="title" class="f-18"></span></dt>
  </dl>
</div>
<div class="pd-20">
    <div class="formControls col-xs-8 col-sm-9">
				<#--<textarea  id="area"  style="width:178%;height:400px;" class="span12 ckeditor"   >

				</textarea>-->
                 <#--  <button  type="button"  onclick="getContent()">aaa</button>-->
                    <div id="area"></div>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<script type="text/javascript">

    //预加载
$(function () {
    getContent();
})

    function getContent() {
        $.ajax({
            type: 'POST',
            url: '${ctx}/news/show/content',
            data:{
                id: ${id}
            },
            dataType: 'json',
            success: function(data){
               $("#area").append(data.content);
               $("#title").html(data.title);
            },

        });

    }


</script>

</body>
</html>