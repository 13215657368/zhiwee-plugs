<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/html">
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
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
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

<title>公司概况</title>

</head>
<body>
<input    type="hidden"  id="url" >
<article class="page-container">
	<form class="form form-horizontal">



		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea   placeholder="可填写描述内容，如果插入图片选择下栏的上传图片，上传成功之后将图片拖入框中"  style="width:100%;height:400px;" class="span12 ckeditor" id="editor" name="content">
				</textarea>
			<#--  rows="6" cols="80"	<script id="editor"   type="text/plain" style="width:100%;height:400px;"></script>-->
			</div>
		</div>
   <#--companydescribe-->
	</form>
    <input    type="hidden"  id="hideUrl">
	<input    type="hidden"  id="imgNum">
    <input    type="hidden"  id="imgUrl">


    <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">图片上传：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <a id="apic" >
                <a id="remark1"></a>
            </a>
            <div class="uploader-thum-container">


                    <#--<label>请选择文件:</label><input type="file" name="uploadFile"  multiple>
                    <button id="submitBtn" type="button">上传</button>-->
                        <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				            <input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
                            <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				            <input type="file"   id="fileForm22" multiple name="uploadFile" class="input-file">
			        	</span>
                            <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                            <span id="remark"></span>
                        </div>


			<#--	&nbsp;&nbsp;
                <button id="imgSubmit">图片入库</button>
-->
            </div>
        </div>
    </div>


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                <a   id="showInfo" style="color: #00CC99;size: A3;display: none">文件正在上传，请稍后</a>
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                <button  onClick=article_save_submit(); class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>发布</button>

            </div>
        </div>


    </form>
    <br>





            <#--ffff-->
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">



    var ue = UE.getEditor('editor');

	function article_save_submit() {
	//	var  content = UE.getEditor('editor').getPlainTxt();
        var  content = UE.getEditor('editor').getContent();
        var  url =  $("#hideUrl").val();


		$.ajax({
            type: 'POST',
            url:"${ctx}/companyCulture/saveOrUpdate",
       //     contentType: 'application/json;charset=UTF-8',
            data:{
                content: content,
                url:url
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
				layer.msg('发布成功',{
				    icon:1,
                    time:1000,
                    end:function(){
                        //关闭除父级外的子页面
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);//关闭当前页
                        //parent.location.reload();//刷新父级页面
                    }
                })
				}else{
                    layer.msg("添加失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500,
                    })

				}
			}
        })

    }










    //发送ajax请求:xhr对象发送请求
    $("#submitBtn").click(function () {

        $("#showInfo").show();

        var data = new FormData();
        $.each(
                $('#fileForm22')[0].files,
                function(i,file) {
                    data.append('uploadFile',file);

                });


        $.ajax({
            url: "${ctx}/fileUpload/save",
            data: data,
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
            success:function (result) {
                console.log(result.fileUrl);
				if(result!=null){
				    $("#showInfo").hide();
				    $("#hideUrl").val(result.fileUrl);
				    //alert("图片上传成功");
					layer.msg("图片上传成功",{
						icon:1,
						time:1500,
					})
				    $("#imgUrl").val(result.fileUrl);
				    //调用图片入库函数

                    $("#remark1").html("");
                    $('#info1').html("当前进度:100%");
                    $("#remark1").append("<img  alt='图片缩略图' id='showIs1'  style='opacity: 1'  width=90px height=90px  />")
                    $('#showIs1').attr('src',result.fileUrl);
                    //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                    $('#remark1').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
                    $('#showImg').attr('src',result.fileUrl);
                    $("#url").val(result.fileUrl);//赋值，信息提交抓到一张图片存入数据库
				}

            }
        });
    });



	/*图片删除*/
    function img_del(pathName) {

      $.ajax({
            type: 'POST',
            url:"${ctx}/fileUpload/delete",
            data:{
                pathName:pathName
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    // alert("删除成功");
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    })
                    window.location.reload();
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    })
                    // alert("删除失败");
                }
            }
        })

    }





</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>