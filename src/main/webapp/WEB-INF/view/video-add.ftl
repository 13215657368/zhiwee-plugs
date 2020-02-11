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

<title>新增分类</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<div class="form form-horizontal">







       <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">


           <div class="row cl">
               <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
               <div class="formControls col-xs-8 col-sm-9">
                   <input type="title" class="input-text"  id="title" name="title">
               </div>
           </div>






           <input  type="hidden" id="hideUrl"  >
           <div class="row cl">
                <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>视频上传：</label>
               <div class="formControls col-xs-7 col-sm-9">

                   <div class="uploader-thum-container">
                       <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				            <input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
                            <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				            <input type="file"   multiple name="uploadFile" class="input-file" multiple>
			        	</span>
                           <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                          <#-- <a id="remark"></a>-->
                           <br>
                           <a  id="showInfo1" style="color: #00B83F;size: A3;display: none">视频正在上传，请稍后</a>

                           <a id="remark"></a>
                       </div>

                   </div>
               </div>
           </div>



           <input  type="hidden" id="imgUrl"  >
       <#---->
           <div class="row cl">
               <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>视频封面上传：</label>
               <div class="formControls col-xs-7 col-sm-9">

                   <div class="uploader-thum-container">
                       <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				            <input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile2" readonly nullmsg="请添加附件！" style="width:200px">
                            <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				            <input type="file"   name="uploadFile" id="fileForm22"  class="input-file">
			        	</span>
                           <button id="submitBtn2"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                       <#-- <a id="remark"></a>-->
                           <br>
                           <a  id="showInfo2" style="color: #00B83F;size: A3;display: none">图片正在上传，请稍后</a>
                           <a id="remark2"></a>
                       </div>

                   </div>
               </div>
           </div>
       <#---->



       </form>




        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                <button  onClick=videoInfo_save(); class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>发布</button>

            </div>
        </div>
    </div>
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





	function videoInfo_save() {
	    var title = $("#title").val();
	    var  url = $("#hideUrl").val();
	    var  cover = $("#imgUrl").val();

        if(cover==null||""==cover.trim()){
            layer.msg("请先上传封面",{
                icon:2,
                time:1500,
            })
            //alert("请先上传视频");
            return;
        }

	    if(url==null||""==url.trim()){
            layer.msg("请先上传视频",{
                icon:2,
                time:1500,
            })
	        //alert("请先上传视频");
	        return;
        }

		$.ajax({
            type: 'POST',
            url:"${ctx}/video/save",
            data:{
                title: title,
                url:url,
                cover:cover
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
                    layer.msg("发布失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500,
                    })

                }
        }
        });
	}




	/*
	* 视频上传
	* */

    $("#submitBtn").click(function () {

      //  alert("aaaaa");

        $.ajax({
            url: "${ctx}/fileUpload/videoSave",
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

                    console.log("已经上传:" + ev.loaded);
                    console.log("总计:" + ev.total);
                    console.log("当前进度:" + (ev.loaded / ev.total) * 100 + "%");
                    var procent = ((ev.loaded / ev.total) * 100).toFixed(2);
                    $(".progress-bar").css('width', procent + "%").text(procent + "%");
                    $("#showInfo1").show();
                };
                return xhr;
            },
            success: function (result) {
                  console.log(result.fileUrl)
                if (result.fileUrl != null) {

                    $("#hideUrl").val(result.fileUrl);
                    $("#showInfo1").hide();
                    layer.msg("视频上传成功",{
                        icon:1,
                        time:1500,
                    });
                    //调用图片入库函数

                    $("#remark").append("<video   id='showIs1'  style='opacity: 1'  width=\"150\" height=\"90px\"  controls=\"controls\" ></video>")
                    $('#showIs1').attr('src', result.fileUrl);
                    //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                    $('#remark').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del1(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');

                }

            }
        });
    })



    /*
    * 封面上传
    * */

    $("#submitBtn2").click(function () {
         //   $('#fileimgTopUrl')[0].files,
        //  alert("aaaaa");
       /* var fileObj = $("#fileForm2")[0].files; // js 获取文件对象
        var formFile = new FormData();
        formFile.append("uploadFile", fileObj); //加入文件对象   file为传递给后台的参数，可以模仿form中input的name值。
        var data = formFile;
        alert(JSON.stringify(data));*/

        var data = new FormData();
        $.each(
                $('#fileForm22')[0].files,
                function(i,file) {
                    data.append('uploadFile',file);

                });

       // alert(JSON.stringify(data));


        $.ajax({
            url: "${ctx}/fileUpload/save",
            data: data,
            processData: false,
            contentType: false,
            type: "POST",
            xhr: function () {
                //获取xhr
                var xhr = $.ajaxSettings.xhr();
                //上传期间的回调函数、每隔xms触发一次
                xhr.upload.onprogress = function (ev) {

                    console.log("已经上传:" + ev.loaded);
                    console.log("总计:" + ev.total);
                    console.log("当前进度:" + (ev.loaded / ev.total) * 100 + "%");
                    var procent = ((ev.loaded / ev.total) * 100).toFixed(2);
                    $(".progress-bar").css('width', procent + "%").text(procent + "%");
                    $("#showInfo2").show();
                };
                return xhr;
            },
            success: function (result) {
                console.log(result.fileUrl)
                if (result.fileUrl != null) {

                    $("#imgUrl").val(result.fileUrl);
                    $("#showInfo2").hide();
                    layer.msg("封面上传上传成功",{
                        icon:1,
                        time:1500,
                    });
                    //调用图片入库函数
                      $("#remark2").append("<img  alt='图片缩略图' id='showIs2'  style='opacity: 1'  width=90px height=90px  />")
                      $('#showIs2').attr('src', result.fileUrl);
                      //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                      $('#remark2').append('<a style="text-decoration:none" class="ml-5"  id="delImg2" onClick="img_del2(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
                }

            }
        });
    })





    /*
    *
    *视频删除
    * */

   function img_del1(pathName) {
        $.ajax({
            type: 'POST',
            url:"${ctx}/fileUpload/video/delete",
            data:{
                pathName:pathName
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    })
                    $("#showIs1").remove();
                    $("#delImg1").remove();

                }else{
                    alert("删除失败");
                }
            }
        });

    }

    function img_del2(pathName) {
        $.ajax({
            type: 'POST',
            url:"${ctx}/fileUpload/delete",
            data:{
                pathName:pathName
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    })
                    $("#showIs2").remove();
                    $("#delImg2").remove();

                }else{
                    alert("删除失败");
                }
            }
        });

    }





</script>
</body>
</html>