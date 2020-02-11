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

    <title>编辑分类</title>
    <link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
<#--    <input   type="hidden" id="imgUrl">-->
    <div class="form form-horizontal" id="form-picture-add" enctype="multipart/form-data" >



      <#--  <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>经销商类型：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="type" id="type" class="select"  onclick="checkByType(this.value)" onchange="changeType(this.selectedIndex)" ><option  value="0">请选择类别</option>
					<option   value="1" <#if background.type==1>selected</#if> >格力中央空调</option>
					<option   value="2" <#if background.type==2>selected</#if>>格力电器</option>
				</select>
				</span>
            </div>
        </div>-->



        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属类型：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="dealerType" id="dealerType"  <#--onclick=" checkByDealerType(this.value)"--> class="select">
					<option  value="0">请选择类别</option>
					<option   <#if background.dealerType==1>selected</#if> value="1">格力电器-卖场</option>
					<option   <#if background.dealerType==2>selected</#if>  value="2">格力电器-专卖店</option>
                    <option   <#if background.dealerType==3>selected</#if>  value="3">格力电器-专营店</option>
			        <option   <#if background.dealerType==4>selected</#if>  value="4">格力电器-代理商</option>
                    <option   <#if background.dealerType==5>selected</#if>  value="5">格力中央空调-经销商</option>
				</select>
				</span>
            </div>
        </div>




        <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
            <input  id="hideUrl" type="hidden" value="${background.imgUrl}" >

            <div class="row cl">
                <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>经销商证书：</label>
                <div class="formControls col-xs-7 col-sm-9">
                    <div class="uploader-thum-container">
                        <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
                            <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                        </div>

                        <a id="apic" >
                            <a id="remark1"></a>
                        </a>

                        <#if background.imgUrl!="">
                        <img   alt='图片缩略图' id='showIs2'  src="${background.imgUrl}" style='opacity: 1'  width=90px height=90px  />
                            <a style="text-decoration:none" class="ml-5"  id="delImg5" onClick="img_del('${background.imgUrl}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                        </#if>


                    </div>
                </div>

            </div>
        </form>


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                <a  id="showInfo" style="color: #00B83F;size: A3;display: none">图片正在上传，请稍后</a>
            </div>
        </div>



        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="background_save();" class="btn btn-primary radius" ><i class="Hui-iconfont">&#xe632;</i> 更新</button>
            </div>
        </div>

</div>
</div>

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

   /* var types = ["请选择类别","格力中央空调","格力电器"];

    var dealerTypes = [

        ["请选择经营类型"],

        ["无"],

        ["请选择经营类型","卖场","专卖店","专营店"],
    ];

    var  type = document.getElementById("type");
    var dealerType = document.getElementById("dealerType");
*/

    function checkByType(val) {
        $("#submit").removeAttr("disabled");
        $("#submitBtn").removeAttr("disabled");


        $.ajax({
            type: 'POST',
            url: '${ctx}/backgroundImg/checkByType',
            data: {
                type: val
            },
            dataType: 'json',
            success: function (result) {
                if (result.code == 400) {
                    layer.msg('此类型已经存在，请重新选择',{
                        icon:1,
                        time:1000
                    })
                    $("#submit").attr({"disabled":"disabled"});
                    $("#submitBtn").attr({"disabled":"disabled"});

                }
            }
        })



    }




   /* //初始化数据
    function init(){
        //给省初始化数据
        //给options 的长度
        type.options.length = types.length;

        //赋值
        for(var i = 0 ; i < types.length ; i++){

            //显示文本
            type.options[i].text = types[i];

            //属性的值
            // type.options[i].value = types[i];
            type.options[i].value = i;
        }

        //设置默认的选项
        var position = 0;
        type.selectedIndex = position;

        //给城市里面添加数据
        changeType(position)

    }

    //城市的数据
    function changeType(index){

        //拿到对应的 城市数据
        var dealerTypess = dealerTypes[index];
        //设置options 的长度属性
        dealerType.options.length = dealerTypess.length;
        //赋值
        for(var i = 0 ; i < dealerTypess.length; i++){
            //显示文本
            dealerType.options[i].text = dealerTypess[i];
            //属性的值
            // dealerType.options[i].value = dealerTypess[i];
            dealerType.options[i].value = i;
        }
        dealerType.selectedIndex = 0 ;
    }
*/



    function checkByDealerType(val) {
        // layer.msg(val);

       // $("#submit").removeAttr("disabled");
       // $("#submitBtn").removeAttr("disabled");

        $.ajax({
            type: 'POST',
            url: '${ctx}/backgroundImg/checkByDealerType',
            data: {
                dealerType: val
            },
            dataType: 'json',
            success: function (result) {
                if (result.code == 400) {
                    layer.msg('此类型已经存在，请重新选择',{
                        icon:1,
                        time:1000
                    })
                  //  $("#submit").attr({"disabled":"disabled"});
                  //  $("#submitBtn").attr({"disabled":"disabled"});

                }
            }
        })
    }





    function img_del(imgUrl) {
       // var imgUrl=$("#hideUrl").val();
        $.ajax({
            type: 'POST',
            url:"${ctx}/backgroundImg/img/delete",
            data:{
                imgUrl:imgUrl
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    });
                    //alert("删除成功");
                   // $("#showIs2").attr("src","");
                  //  window.location.reload();
                    $("#showIs2").hide();
                    $("#delImg5").hide();
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    });
                   // alert("删除失败");
                }
            }
        })


    }

    function img_del2(imgUrl) {
       // var imgUrl=$("#hideUrl").val();
        $.ajax({
            type: 'POST',
            url:"${ctx}/fileUpload/delete",
            data:{
                pathName:imgUrl
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    });
                   // alert("删除成功");
                    $("#showIs2").attr("src","");
                    window.location.reload();
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    });
                   // alert("删除失败");
                }
            }
        })


    }




    function background_save() {
        var id=${background.id};
        var imgUrl=$("#hideUrl").val();
        var dealerType = $("#dealerType option:selected").val();

        if(dealerType==0){
            alert("请先选择类型");
            return;
        } else if(dealerType==5){
            var type=1;
        }else{
            var type = 2;
    }
        if(null==imgUrl || ""==imgUrl.trim()){
            alert("请先上传图片");
            return;
        }

        $.ajax({
            type: 'POST',
            url:"${ctx}/backgroundImg/update",
            data:{
                id:id,
                imgUrl: imgUrl,
                dealerType: dealerType,
                type:type
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
                }else if(result.code=203){
                    layer.msg(result.message,{
                        icon:2,
                        time:1000
                    })

                }else{
                    layer.msg("更新失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500,
                    })

                }
            }
        })

    }



    $("#submitBtn").click(function () {

      //  alert("aaaaa");

        $("#showInfo").show();

        $.ajax({
            url: "${ctx}/fileUpload/save",
            data: new FormData($("#fileForm")[0]),
            processData: false,
            contentType: false,
            type: "POST",
            dataType: "json",
            xhr: function () {
                //获取xhr
                var xhr = $.ajaxSettings.xhr();
                //上传期间的回调函数、每隔xms触发一次
                xhr.upload.onprogress = function (ev) {
                    //获取当前上传了多少数据、总共是多少数据
                    console.log("已经上传:" + ev.loaded);
                    console.log("总计:" + ev.total);
                    console.log("当前进度:" + (ev.loaded / ev.total) * 100 + "%");
                    var procent = ((ev.loaded / ev.total) * 100).toFixed(2);
                    $(".progress-bar").css('width', procent + "%").text(procent + "%");
                };
                return xhr;
            },
            success: function (result) {
                //  console.log(result.fileUrl)
                if (result.fileUrl != null) {
                    $("#showInfo").hide();
                    $("#hideUrl").val(result.fileUrl);
                    layer.msg("图片上传成功",{
                        icon:1,
                        time:1500,
                    });
                    //alert("图片上传成功");
                    //调用图片入库函数
                    $("#remark1").append("<img  alt='图片缩略图' id='showIs'  style='opacity: 1'  width=90px height=90px  />")
                    $('#showIs').attr('src', result.fileUrl);
                    //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                    $('#remark1').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del2(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
                }

            }
        });
    });



</script>
</body>
</html>