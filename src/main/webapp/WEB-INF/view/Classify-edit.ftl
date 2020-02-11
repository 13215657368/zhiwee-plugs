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
  <#--  <link rel="Bookmark" href="favicon.ico" >
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

    <title>编辑标题</title>
    <link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
<#--    <input   type="hidden" id="imgUrl">-->
    <div class="form form-horizontal" id="form-picture-add" enctype="multipart/form-data" >
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${classify.thisSort}" id="thisSort" name="thisSort">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" readonly  value="${classify.id}"  id="id" name="id">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${classify.name}"  id="name" name="name">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input type="radio" name="state" value="1" <#if classify.state==1>checked</#if>> &nbsp;启用&nbsp;&nbsp;</label>
                <label><input type="radio" name="state" value="2" <#if classify.state==2>checked</#if>>&nbsp;禁用</label>

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">标题备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${classify.remake}"  id="remake" name="remake">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="classify_submit();" class="btn btn-primary radius" ><i class="Hui-iconfont">&#xe632;</i> 更新</button>
            </div>
        </div>

</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>

<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>

<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript">
    function classify_submit() {
        var id = $("#id").val();
        var name =$("#name").val();
        var remake =$("#remake").val();
        var thisSort =$("#thisSort").val();
        var state = $('input[name="state"]:checked').val();

        if(null==id||""==id.trim()||null==name||""==name.trim()){
            layer.msg("信息不全，请返回重新选择",{
                icon:2,
                time:2000,
                end:function () {
                    return;
                }
            })
        }
        $.ajax({
            type: 'POST',
            url:"${ctx}/classify/update",
            data:{
                id: id,
                name:name,
                remake:remake,
                state:state,
                thisSort:thisSort
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg('更新成功',{
                        icon:1,
                        time:1000,
                        end:function(){
                            //关闭除父级外的子页面
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);//关闭当前页
                            parent.location.reload();//刷新父级页面
                        }
                    })
                }else{
                    layer.msg("更新失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500
                    })

                }
            }
        })

    }

</script>
</body>
</html>