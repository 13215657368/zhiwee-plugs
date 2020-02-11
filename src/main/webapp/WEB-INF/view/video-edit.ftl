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
                    <input type="title" class="input-text"  value="<#if 200==bs.code>${bs.result.title}</#if>"  id="title" name="title">
                </div>
            </div>






            <input type="hidden" id="hideUrl"  value="${bs.result.url}">

            <input type="hidden" id="baseUrl" value="${bs.result.url}">

            <div class="row cl">

                <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>视频上传：</label>
                <div class="formControls col-xs-7 col-sm-9">

                    <div class="uploader-thum-container">
                        <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
                        <#--
                                                    <lable id="lableok" style="display: none">
                                                      <i class="glyphicon glyphicon-ok"></i>上传成功</lable>-->

				</span>
                            <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                        <#-- <a id="remark"></a>-->
                            <br>
                            <a  id="showInfo1" style="color: #00B83F;size: A3;display: none">视频正在上传，请稍后</a>
                            <a id="remark1"></a>
                            <#if bs.result.url!="">
                            <video  width="150" height="90" style=""   id="showIs"  src="${bs.result.url}" controls="controls">
                            </video>
                            <a style="text-decoration:none" class="ml-5"  id="delImg" onClick="video_del('${bs.result.id}','${bs.result.url}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            </#if>
                        </div>


                    <#--  <div class="col-xs-2">
                          <div class="progress progress-striped active" style="display: none">
                              <div id="progressBar" class="progress-bar progress-bar-info"role="progressbar" aria-valuemin="0" aria-valuenow="0"aria-valuemax="100" style="width: 0%">
                              </div>
                          </div>
                      </div>
-->

                    <#--   <a id="apic" >
                           <a id="remark1"></a>
                       </a>-->


                    </div>
                </div>





            </div>


            <input  type="hidden" id="imgUrl" value="${bs.result.cover}"  >
        <#---->
            <div class="row cl">
                <label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>视频封面上传：</label>
                <div class="formControls col-xs-7 col-sm-9">

                    <div class="uploader-thum-container">
                        <div class="formControls col-xs-8 col-sm-9" >
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
                        <#if bs.result.cover!="">
                            <span id="isShow">
                            <img  width="150" height="90" style="" src="${bs.result.cover}" controls="controls">
                            </img>
                            <a style="text-decoration:none"  class="ml-5"  id="delImg" onClick="cover_del('${bs.result.cover}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            </span>
                        </#if>

                        </div>

                    </div>
                </div>
            </div>
        <#---->




        </form>



        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                <button  onClick=videoInfo_save(); class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>更新</button>

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






        if(title==null||""==title.trim()){
            layer.msg("标题不能为空",{
                icon:2,
                time:1500,
            });
            //alert("标题不能为空");
            return;
        }
        if(""==cover){
            layer.msg("请先上传视频封面",{
                icon:2,
                time:1500,
            });
            //alert("请先上传视频");
            return;
        }
        if(""==url){
            layer.msg("请先上传视频",{
                icon:2,
                time:1500,
            });
            //alert("请先上传视频");
            return;
        }
        //url=baseUrl;



        $.ajax({
            type: 'POST',
            url:"${ctx}/video/update",
            data:{
                id:${bs.result.id},
                title: title,
                url:url,
                cover:cover
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
                            //parent.location.reload();//刷新父级页面
                        }
                    })
                }else{
                    layer.msg("更新失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500,
                    })

                }
            }
        });
    }





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
                    $("#remark1").append("<video   id='showIs11'  style='opacity: 1' width=\"150\" height=\"90px\"  controls=\"controls\"  ></video>")

                    $('#showIs11').attr('src', result.fileUrl);
                    //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                    $('#remark1').append('   <a style="text-decoration:none" class="ml-5"  id="delImg11" onClick="video_del2(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');

                }

            }
        });
    })



    function cover_del(url) {
        $.ajax({
            type: 'POST',
            url:"${ctx}/fileUpload/delete",
            data:{
                pathName:url
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    });
                  //  window.location.reload();
                    $("#isShow").hide();
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    });
                    //alert("删除失败");
                }
            }
        });
    }




    function video_del(id,url) {
         $.ajax({
             type: 'POST',
             url:"${ctx}/video/delete",
            data:{
                 id:id,
                 url:url
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    });
                   // window.location.reload();
                    $("#showIs").remove();
                    $("#delImg").remove();
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    });
                    //alert("删除失败");
                }
            }
        });

    }

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
                      $("#remark2").append("<img  alt='图片缩略图' id='showIs22'  style='opacity: 1'  width=90px height=90px  />")
                      $('#showIs22').attr('src', result.fileUrl);
                      //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                      $('#remark2').append('   <a style="text-decoration:none" class="ml-5"  id="delImg22" onClick="cover_del2(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
                }

            }
        });
    })


    function video_del2(pathName) {
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
                    $("#showIs11").remove();
                    $("#delImg11").remove();

                }else{
                    alert("删除失败");
                }
            }
        });


    }



    function cover_del2(pathName) {
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
                    $("#showIs22").remove();
                    $("#delImg22").remove();

                }else{
                    alert("删除失败");
                }
            }
        });
    }





</script>
</body>
</html>