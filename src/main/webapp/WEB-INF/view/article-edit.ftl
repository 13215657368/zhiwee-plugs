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

<title>新增文章</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<input   type="hidden"  id="url" >
<article class="page-container">
	<form class="form form-horizontal">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-9"><#--<#if (param.id)?exists>updateGoods<#else>addGoods</#if>-->
				<input type="text" class="input-text" value="${newsinfo.title}" id="title" name="title"  >
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${newsinfo.number}" id="number" name="number"   readonly="true">
            </div>
        </div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>新闻类别：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="type" id="type" class="select">
					<option  value="0">请选择新闻类别</option>
					<option  <#if newsinfo.type==1>selected</#if> value="1">格力新闻</option>
					<option  <#if newsinfo.type==2>selected</#if>  value="2">行业动态</option>
					<option  <#if newsinfo.type==3>selected</#if>  value="3">最新活动</option>
				</select>
				</span> </div>
		</div>






		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea   style="width:100%;height:400px;" class="span12 ckeditor"   id="editor" name="content" >
                    ${newsinfo.content}
				</textarea>
			<#--  rows="6" cols="80"	<script id="editor"   type="text/plain" style="width:100%;height:400px;"></script>-->
			</div>
		</div>
	</form>


    <input      type="hidden" id="hideUrl"  >
	<input      type="hidden"   id="imgNum"  value="${newsinfo.number}">

    <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
    <div class="row cl">
       <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>新闻图：</label>
        <div class="formControls col-xs-8 col-sm-9">
        <#--  <float text-></float>-->
          <#--  <a id="apic" >
                <img  alt="图片缩略图" id="showImg"   style="opacity: 1"  width=90px height=90px  />
               &lt;#&ndash; <button id="imgDelete">删除</button>&ndash;&gt;
                <a style="text-decoration:none" class="ml-5"  id="delImg" onClick="img_del()" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
            </a>-->


            <div class="uploader-thum-container">

					<span class="btn-upload form-group">

				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<span href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</span>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
				<button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>

				<br>
				<br>


				<a id="pic"></a>
                <#list imgsinfo as  item>
                <a id="apic" >
                    <img  alt="图片"  style="opacity: 1"  width=90px height=90px id="pic" src="${item.imgurl}"/>
                    <a style="text-decoration:none" class="ml-5"  id="delImg" onClick="img_del('${item.imgurl}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					<input type="hidden" id="modifyUrl" value="${item.imgurl}">
                </a>
                </#list>






				<#--  <label>请选择文件:</label><input type="file" name="uploadFile"  multiple>
                  <button id="submitBtn" type="button">上传</button>-->


			<#--	&nbsp;&nbsp;
                <button id="imgSubmit">图片入库</button>-->


            </div>

			<br>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" align="center">
                    <button  onClick=article_save_submit(); class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>更新发布</button>

                </div>
            </div>


    </form>





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



     function img_del(pathName) {
      /*  var  artnum =  $("#imgNum").val();
        var  pathName= $("#hideUrl").val();*/
        //alert(pathName);
        $.ajax({
            type: 'POST',
            url:"${ctx}/news/img/delete",
            data:{
                pathName:pathName
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                	layer.msg("删除成功",
							{
								icon:1,
								time:1500,

							}
					)
                   // alert("删除成功");
                    window.location.reload();
                }else{
					layer.msg("删除失败",
							{
								icon:2,
								time:1500,

							}
					)
                    //alert("删除失败");
                }
            }
		})

     }



	//发送ajax请求:xhr对象发送请求
	$("#submitBtn").click(function () {
		var  number=$("#number").val();
		///alert("aaaa");
		if(null== number||""== number.trim()){
			layer.msg("请先填写信息信息",{
				icon:2,
				time:1500,
			})
			// alert("请先填写信息信息");
			return;
		}

		$.ajax({
			url: "${ctx}/fileUpload/save3",
			data: new FormData($("#fileForm")[0]),
			processData: false,
			contentType: false,
			type: "POST",
			dataType: "json",

			success:function (result) {
               console.log(result);
				var   urlStr ="";
				if(result[0].fileUrl != null) {
					for (var i = 0; i < result.length; i++) {
						urlStr += result[i].fileUrl + ",";
					}
					console.log(urlStr);
					$("#hideUrl").val(urlStr);



					/*for(var i=0;i<result.length;i++) {
						$("#remark1").append("<img  alt='图片缩略图' id='showIs" + i + "'  style='opacity: 1'  width=90px height=90px /> ");
						$('#showIs' + i).attr('src', result[i].fileUrl);//img_del(2,'+i+')
						//  var  url =  result[i].fileUrl;
						$('#remark1').append('<a style="text-decoration:none" class="ml-5"  id="delImg'+i+'" onClick="img_del(' + i + ',\''+result[i].fileUrl+'\')"  href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
					}*/
					//proImgInsert(urlStr,number)
					imgInsert(urlStr,number);

				}

			}
		});
	})







	function article_save_submit() {
	    var title= $("#title").val();
	    var number=$("#number").val();
	    var type = $("#type option:selected").val();
	   // var  img =   $("#img").val();
	//	var  content = UE.getEditor('editor').getPlainTxt();
        var  content = UE.getEditor('editor').getContent();
		var  introduction  = UE.getEditor('editor').getContentTxt();
        var  url =  $("#url").val();
       // alert(url);
        if(null==url||""==url.trim()){
           // url="";
            url=$("#modifyUrl").val();
        }
		$.ajax({
            type: 'POST',
            url:"${ctx}/news/update",
       //     contentType: 'application/json;charset=UTF-8',
            data:{
                title: title,
                number: number,
                type: type,
                content: content,
				introduction:introduction,
                url: url
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
        })

    }


    /**
	 *  提交图片信息至数据库
	 *  <input    id="hideUrl" >
     *   <input    id="imgNum">
     */

       function  imgInsert(imgurl,artnum) {
      //  var  artnum=$("#imgNum").val();
      //  var   imgurl=$("#hideUrl").val();
        //alert(artnum);


        if(artnum==null||artnum.trim()==""){
			layer.msg("请先填写新闻信息",{
				icon:2,
				time:1500,
			})
           // alert("请先填写新闻信息");
            return;
		}
		if(imgurl==null || imgurl.trim()==""){
			layer.msg("请先上传图片",{
				icon:2,
				time:1500,
			})
           // alert("请先上传图片");
            return;
		}

		$.ajax({
            type: 'POST',
            url:'${ctx}/news/img/add',
            data:{
                artnum: artnum,
                imgurl: imgurl
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
					layer.msg("图片上传成功",{
						icon:1,
						time:1500,
					})
					window.location.reload();
                }else{
					layer.msg("图片上传失败",{
						icon:2,
						time:1500,
					})
                   // alert("图片上传失败");
                }
            }

		})


	}








</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>