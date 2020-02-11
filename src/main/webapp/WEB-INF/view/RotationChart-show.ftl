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
</head>
<body>
<div class="cl">
  <dl style="margin-left:80px; color:#fff"  >
      <dt><span  id="title" class="f-18"></span></dt>
  </dl>
</div>
<div class="pd-20">
    <div class="formControls col-xs-8 col-sm-9">
        <div class="row cl">
            <label class="form-label col-xs-4">图片链接：</label>
            <div class="formControls col-xs-8 col-sm-9">
               <span>
                   <input type="hidden" id="id" value="${rotationchart.id}">
                   <input  type="text" class="input-text"  value="<#if rotationchart.clickUrl??>${rotationchart.clickUrl}</#if>"   placeholder="例如./pages/search/search-dq.html,此项非必填项，可填写可不填写"  id="clickUrl" name="clickUrl"  >
                    <button  id="sub"  onClick="infoUpdate();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>更新</button>
               </span>

            </div>
        </div>

    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<script type="text/javascript">



    function infoUpdate() {
        var  id = $("#id").val();
        var  cilckUrl= $("#clickUrl").val();
        $.ajax({
            type: 'POST',
            url: '${ctx}/chart/update',
            data:{
                id:id,
                clickUrl:cilckUrl
            },
            dataType: 'json',
            success: function(result){
                if(result.code==200){
                    layer.msg("更新成功",{
                        icon:1,
                        time:1500,
                        end:function(){
                            //关闭除父级外的子页面
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);//关闭当前页
                            //parent.location.reload();//刷新父级页面
                        }

                    })
                }
            },

        });

    }


</script>

</body>
</html>