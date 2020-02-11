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
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
        <title>商品管理 - 商品发布</title>
</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="name" name="name">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品简述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea type="text"  style="height: 100px" class="input-text"  placeholder="" id="detail" name="detail">
                </textarea>
        </div>
        </div>
		<#--<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品分类：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="type" name="type">
			</div>
		</div>-->
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品分类：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <span>
                <span>
                    一级：
				<select name="type"   onchange="getSecondClassify(this.value)" style="width: 20%" id="root" class="select">

				</select>
                </span>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp;
                <span>
                    二级：
                <select name="type"   onchange="getThirdClassify(this.value)"  style="width: 20%" id="second" class="select">
					 <option value="0">请选择二级分类</option>
				</select>
                </span>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp;
                <span>
                    三级：
                <select name="type"   style="width: 20%" id="third" class="select">
					<option value="0">请选择三级分类</option>
				</select>
                </span>
				</span>
           <a id="remark"  style="color: red"></a>
        </div>
            <br>

        </div>


       <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品型号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="model" name="model"   onblur="checkNum(this.value)" >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">定变频：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>
                变频冷暖：<input type="radio"  name="dbp" value="1">&nbsp;&nbsp;&nbsp;
                定频冷暖：<input type="radio"  name="dbp" value="2">&nbsp;&nbsp;&nbsp;
                定频单冷：<input type="radio"  name="dbp" value="3">
                </span>
            </div>
        </div>

	<#--	<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>最新商品：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select  id="isnew" name="isnew" class="select">
					<option value="0">请选择</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select>
				</span> </div>
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>推荐商品：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="hot" name="hot" class="select">
					<option value="0">请选择</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select>
				</span> </div>
		</div>-->


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">能效等级：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="level" name="level"   onblur="checkNum(this.value)" >
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">使用面积：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="area" name="area"   onblur="checkNum(this.value)" >
            </div>
        </div>


		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">颜色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"   placeholder="" id="color" name="color">
			</div>
		</div>



    </form>




		<#--<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片上传：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container">
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker-2"></div>
							<p>或将照片拖到这里，单次最多可选300张</p>
						</div>
					</div>
                    <input type="hidden" id="img" value="http://">
					<div class="statusBar" style="display:none;">
						<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
						<div class="info"></div>
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn" onclick="proimgSubmit()">开始上传</div>
						</div>
					</div>

				</div>
			</div>
		</div>-->

 <#--   <br>-->
    <form id="fileForm1"  class="form form-horizontal" enctype="multipart/form-data">
    <div class="row cl">
       <#-- 商品图片上传：-->
           <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品图片上传：</label>
      <#--  <br>-->


         <#--   <input  id="prourl">-->
           <#-- <input id="file-product-category" class="file" name="uploadFile" type="file"  data-min-file-count="1" />
            <input type="button" id="proSub" onclick="proimgSubmit()" value="上传">
             <input id="prourl" type="hidden">
             <a id="info1" style="color: blue"></a>
             <a id="remark1" style="color: red"></a>-->
             <#--<div class="progress-bar" role="progressbar" style="width: 0%;">-->
        <span class="btn-upload form-group">

				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<span href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</span>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
        <button id="proSub" onclick="proimgSubmit()"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>

        <br>
        <br>


            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                    <input id="prourl" type="hidden">
                    <a id="info1" style="color: blue"></a>
                    <a id="remark1" style="color: red">
                </div>
            </div>




    </div>
    </form>

    <#-- <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
                    <label>请选择文件:</label><input type="file" name="uploadFile"  multiple>
                </form>
                <button id="submitBtn">上传</button>
				&nbsp;&nbsp;
                <button id="imgSubmit">图片入库</button>-->

    <form id="fileForm2"  class="form form-horizontal" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品描述：</label>
               <#-- <input id="file-product-category" class="file" name="uploadFile" type="file"   multiple />
                <input type="button" id="proSub" onclick="prodescript()" value="上传">-->

            <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile2" id="uploadfile2" readonly nullmsg="请添加附件！" style="width:200px">
                <span  class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</span>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
            <button id="proDesSub" onclick="prodescript()"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>

            <br>
            <br>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >

                    <input id="prodesurl" type="hidden">
                    <a id="info2" style="color: blue"></a>
                    <a id="remark2" style="color: red"></a>
                </div>
            </div>


               <#-- <div class="progress-bar" id="progress-bar2" role="progressbar" style="width: 0%;">-->



        </div>
    </form>

    <form id="fileForm3"  class="form form-horizontal" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品规格参数：</label>
             <#--   <input id="file-product-category" class="file" name="uploadFile" type="file"  multiple />
                <input type="button" id="proSub" onclick="parmdescript()" value="上传">
               -->


            <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile3" id="uploadfile3" readonly nullmsg="请添加附件！" style="width:200px">
                <span  class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</span>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
            <button id="proParamsSub" onclick="parmdescript()"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>


            <br>
            <br>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
                    <input id="parmurl" type="hidden">
                    <a id="info3" style="color: blue"></a>
                    <a id="remark3" style="color: red"></a>
                </div>
            </div>


               <#-- <div class="progress-bar" id="progress-bar3" role="progressbar" style="width: 0%;">-->
        </div>
    </form>

</div>





    <#-- <div class="row cl">
         <label class="form-label col-xs-4 col-sm-2">产品规格参数图：</label>

     </div>-->


		<div class="row cl">

			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="product_submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
			</div>
		</div>



<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">




    number="";
    //生成随机的number码
    $(function () {
        // var number ="";
        var r=parseInt(Math.random()*38);
        var array=[];
        for(var i=0;i<2;i++)
        {
            var flag=0;
            do
            {
                for(var j=0;j<array.length;j++)
                {
                    if(array[j]==r) {flag=1;break;}
                }
                if(!flag)
                {
                    array[array.length]=r;
                }
                else
                {
                    r=parseInt(Math.random()*38);
                }
            }while(!flag);
        }
        for(var j=0;j<array.length;j++){
            number+=array[j];
        }
        console.log(number);


    })


    $(function () {
        getRootClassify();
    })



    function checkNum(num) {
        $.ajax({
            type: 'POST',
            url:"${ctx}/pro/queryByNum",
            //     contentType: 'application/json;charset=UTF-8',
            data:{
                number: num
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==400){
                    $("#number").val("");
                    //alert("新闻编号已存在");
                    layer.msg("新闻编号已存在",{
                        icon:2,
                        time:1500,
                    })
                }
            }
        })
    }



   //等级分类展示
    function getRootClassify() {

        var   htmlStr ="<option value='0'>请选择一级分类</option>";
        $.ajax({
            type: 'GET',
            url:"${ctx}/productClassify/queryByType/root",
            dataType: 'json',
            success:function(result) {
                // console.log(result);

                if(result.code==200){

                    for(var i=0;i<result.result.length;i++){
                        htmlStr+="<option value='"+result.result[i].id+"' >"+result.result[i].name+"</option>"
                    }
                }

                $("#root").html(htmlStr);
            },
            error:function () {
                $("#root").html(htmlStr);
            }

        })

    }

    //二级分类展示
    function getSecondClassify(id) {


        var   htmlStr ="<option value='0'>请选择二级分类</option>";
        $.ajax({
            type: 'GET',
            url:'${ctx}/productClassify/quertByParentId/'+id,
            dataType: 'json',
            success:function(result) {
                // console.log(result);

                if(result.code==200){

                    for(var i=0;i<result.result.length;i++){
                        htmlStr+="<option value='"+result.result[i].id+"' >"+result.result[i].name+"</option>"
                    }
                }

                $("#second").html(htmlStr);
            },
            error:function () {
                $("#second").html(htmlStr);
            }

        })

    }

    //三级分类展示
    function getThirdClassify(id) {

        var   htmlStr ="<option value='0'>请选择三级分类</option>";
        $.ajax({
            type: 'GET',
            url:'${ctx}/productClassify/quertByParentId/'+id,
            dataType: 'json',
            success:function(result) {
                // console.log(result);

                if(result.code==200){

                    for(var i=0;i<result.result.length;i++){
                        htmlStr+="<option value='"+result.result[i].id+"' >"+result.result[i].name+"</option>"
                    }
                }

                $("#third").html(htmlStr);
            },
            error:function () {
                $("#third").html(htmlStr);
            }

        })

    }









    function proimgSubmit() {
        //alert("aaa");
        $.ajax({
            url: "${ctx}/fileUpload/save3",
            data: new FormData($("#fileForm1")[0]),
            processData: false,
            contentType: false,
            type: "POST",
            dataType: "json",

            success:function (result) {
                //  console.log(result.fileUrl)

            //      if(null!=result){

               //     $("#prourl").val(result.fileUrl);

                      var   urlStr ="";
                      if(result[0].fileUrl != null) {
                          for (var i = 0; i < result.length; i++) {
                              urlStr += result[i].fileUrl + ",";
                          }
                          console.log(urlStr);
                          $("#prourl").val(urlStr);






                  //  $("#remark1").html("");
                //    $('#info1').html("当前进度:100%");
                 //  $("#remark1").append("<img  alt='图片缩略图' id='showIs1'  style='opacity: 1'  width=90px height=90px  />")


                      for(var i=0;i<result.length;i++) {
                          $("#remark1").append("<img  alt='图片缩略图' id='showIs1" + i + "'  style='opacity: 1'  width=90px height=90px /> ");
                          $('#showIs1' + i).attr('src', result[i].fileUrl);//img_del(2,'+i+')
                          //  var  url =  result[i].fileUrl;
                          $('#remark1').append('<a style="text-decoration:none" class="ml-5"  id="delImg1'+i+'" onClick="img_del(1,' + i + ')"  href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');

                      }
                          proImgInsert(urlStr,number)


                  /*  $('#showIs1').attr('src',result.fileUrl);
                    $('#remark1').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del(1)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');*/
                }
                // console.log(result);
               //存入数据库


            }
        });
    }

    //imgSave



    function img_del(num,index) {
        if(num==1){
            var  pathName= $("#prourl").val();
            //alert(url);
            var  strs = new Array();
            strs=pathName.split(","); //字符分割

            var   delPath = strs[index];


            $.ajax({
                type: 'POST',
                url:"${ctx}/pro/img/delete",
                data:{
                    pathName:delPath
                },
                dataType: 'json',
                success:function(result) {
                    if(result.code==200){
                        layer.msg("删除成功",{
                            icon:1,
                            time:1500,
                        })
                        $("#showIs1"+index).remove();
                        $("#delImg1"+index).remove();
                        // alert("图片上传成功");
                    }else{
                        layer.msg("删除失败",{
                            icon:2,
                            time:1500,
                        })
                        //alert("图片上传失败");
                    }
                }
            })



        }if(num==2){

            var  pathName= $("#prodesurl").val();
            //alert(url);
            var  strs = new Array();
            strs=pathName.split(","); //字符分割

            var   delPath = strs[index];


            $.ajax({
                type: 'POST',
                url:"${ctx}/pro/img/delete",
                data:{
                    pathName:delPath
                },
                dataType: 'json',
                success:function(result) {
                    if(result.code==200){
                        layer.msg("删除成功",{
                            icon:1,
                            time:1500,
                        })
                        $("#showIs2"+index).remove();
                        $("#delImg2"+index).remove();
                        // alert("图片上传成功");
                    }else{
                        layer.msg("删除失败",{
                            icon:2,
                            time:1500,
                        })
                        //alert("图片上传失败");
                    }
                }
            })




        }if(num==3){
            var  pathName= $("#parmurl").val();
            //alert(url);
            var  strs = new Array();
            strs=pathName.split(","); //字符分割

            var   delPath = strs[index];

            $.ajax({
                type: 'POST',
                url:"${ctx}/pro/img/delete",
                data:{
                    pathName:delPath
                },
                dataType: 'json',
                success:function(result) {
                    if(result.code==200){
                        layer.msg("删除成功",{
                            icon:1,
                            time:1500,
                        })
                        $("#showIs3"+index).remove();
                        $("#delImg3"+index).remove();

                        // alert("图片上传成功");
                    }else{
                        layer.msg("删除失败",{
                            icon:2,
                            time:1500,
                        })
                        //alert("图片上传失败");
                    }
                }
            })



        }


     /*   $.ajax({
            type: 'POST',
            url:"${ctx}/pro/img/delete",
            data:{
                pathName:delPath
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("删除成功",{
                        icon:1,
                        time:1500,
                    })
                    // alert("图片上传成功");
                }else{
                    layer.msg("删除失败",{
                        icon:2,
                        time:1500,
                    })
                    //alert("图片上传失败");
                }
            }
        })
*/
    }



    function prodescript() {

      //  var  number=$("#number").val();
        if(number==null||number.trim()==""){
            layer.msg("请先填写商品信息信息",{
                icon:2,
                time:1500
            });
            return;
        }
       /* if(urlStr==null || urlStr.trim()==""){
            alert("请先上传图片");
            return;
        }*/


        //alert("aaa");
        $.ajax({
            url: "${ctx}/fileUpload/save3",
            data: new FormData($("#fileForm2")[0]),
            processData: false,
            contentType: false,
            type: "POST",
            dataType: "json",

            success:function (result) {
                //  console.log(result.fileUrl)
               /*     alert("图片上传成功，请点击图片入库");*/
                 //   $('#showImg').attr('src',result.fileUrl);
                   /* alert(result.fileUrl);
                    console.log(result.fileUrl);*/

                    var   urlStr ="";
                    if(result[0].fileUrl != null){
                        for(var i=0;i<result.length;i++){
                            urlStr+=result[i].fileUrl+",";
                        }
                        console.log(urlStr);
                        $("#prodesurl").val(urlStr);
                        prodesmgInsert(urlStr,number);




               //     $("#remark2").html("");
                //    $('#info2').html("当前进度:100%");
                    // htmlStr+="<option value='"+result[i].id+"' >"+result[i].name+"</option>"
                    for(var i=0;i<result.length;i++) {

                        $("#remark2").append("<img  alt='图片缩略图' id='showIs2"+i+"'  style='opacity: 1'  width=90px height=90px /> ");
                        $('#showIs2'+i).attr('src', result[i].fileUrl);//img_del(2,'+i+')
                      //  var  url =  result[i].fileUrl;
                        $('#remark2').append('<a style="text-decoration:none" class="ml-5"  id="delImg2'+i+'" onClick="img_del(2,'+i+')"  href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');

                    }
                }
                // console.log(result);

            }
        });
    }


    function parmdescript() {

     //   var  number=$("#number").val();

        if(number==null||number.trim()==""){
            //alert("请先填写商品信息信息");
            layer.msg("请先填写商品信息信息",{
                icon:2,
                time:1500
            });
            return;
        }
      /*  if(urlStr==null || urlStr.trim()==""){
            alert("请先上传图片");
            return;
        }*/




        $.ajax({
            url: "${ctx}/fileUpload/save3",
            data: new FormData($("#fileForm3")[0]),
            processData: false,
            contentType: false,
            type: "POST",
            dataType: "json",

            success:function (result) {
                //  console.log(result.fileUrl)

                var   urlStr ="";
                if(result[0].fileUrl != null){
                    for(var i=0;i<result.length;i++){
                        urlStr+=result[i].fileUrl+",";
                    }

                    console.log(urlStr);
                    $("#parmurl").val(urlStr);
                    paramsMgInsert(urlStr,number);



                 //   $("#remark3").html("");
                 //   $('#info3').html("当前进度:100%");

                    for(var i=0;i<result.length;i++) {
                        $("#remark3").append("<img  alt='图片缩略图' id='showIs3" + i + "'  style='opacity: 1'  width=90px height=90px /> ");
                        $('#showIs3' + i).attr('src', result[i].fileUrl);//img_del(2,'+i+')
                        //  var  url =  result[i].fileUrl;
                        $('#remark3').append('<a style="text-decoration:none" class="ml-5"  id="delImg3'+i+'" onClick="img_del(3,' + i + ')"  href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');

                    }


                    // console.log(urlStr);
                }
                // console.log(result);

            }
        });

    }




    function  proImgInsert(urlStr,number) {


        $.ajax({
            type: 'POST',
            url:'${ctx}/pro/imgSave',
            data:{
                pnumber: number,
                url: urlStr
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("图片上传成功",{
                        icon:1,
                        time:1500,
                    })
                    // alert("图片上传成功");
                }else{
                    layer.msg("图片上传失败",{
                        icon:2,
                        time:1500,
                    })
                    //alert("图片上传失败");
                }
            }

        })



    }







    function  prodesmgInsert(urlStr,number) {


        $.ajax({
            type: 'POST',
            url:'${ctx}/pro/urlSave',
            data:{
                pnumber: number,
                describes: urlStr
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("图片上传成功",{
                        icon:1,
                        time:1500,
                    })
                    // alert("图片上传成功");
                }else{
                    layer.msg("图片上传失败",{
                        icon:2,
                        time:1500,
                    })
                    //alert("图片上传失败");
                }
            }

        })



    }


    function  paramsMgInsert(urlStr,number) {

        $.ajax({
            type: 'POST',
            url:'${ctx}/pro/paramUrlSave',
            data:{
                pnumber: number,
                params: urlStr
            },
            dataType: 'json',
            success:function(result) {
                if(result.code==200){
                    layer.msg("图片上传成功",{
                        icon:1,
                        time:1500,
                    })
                   // alert("图片上传成功");
                }else{
                     layer.msg("图片上传失败",{
                          icon:2,
                         time:1500,
                     })
                    //alert("图片上传失败");
                }
            }

        })



    }







    function product_submit(){
        var  name=$("#name").val();
        var  detail=$("#detail").val();
        var  topId=$("#root  option:selected").val();
        var  secondId =$("#second option:selected").val();
        var  thirdId =$("#third option:selected").val();
        var   model=$("#model").val();
        var   dbp =$('input[name="dbp"]:checked').val();
        var   level="能效等级:"+$("#level").val();
        var   area="适用面积:"+$("#area").val();
        var   color="颜色:"+$("#color").val();


        var  img = $("#prourl").val();
        var  describ = $("#prodesurl").val();
         var  parameters = $("#parmurl").val();

    //  alert(dbp);
/*;
        alert(detail);
        return ;*/
        if(null==img||""==img.trim()){
            //alert("请上传商品图片");
           // $("#remark1").html("请上传商品图片");
            layer.msg("请上传商品图片",{
                icon:2,
                time:1500,
            });
            return;
        }
      /*  if(null==describ||""==describ.trim()){
          // alert("请上传商品信息图片");
          //  $("#remark2").html("请上传商品信息图片");
            layer.msg("请上传商品信息图片",{
                icon:2,
                time:1500,
            });
            return;
        }*/
      /*  if(null==parameters||""==parameters.trim()){
            layer.msg("请上传商品参数信息图片",{
                icon:2,
                time:1500,
            });

            return;
        }*/

        if(topId==0&&secondId==0&&thirdId){
            layer.msg("请选择商品类型",{
                icon:2,
                time:1500,
            });
           // $("#remark").html("请选择商品类型");
            return;
        }


        $.ajax({
            type: 'POST',
            url:"${ctx}/pro/save",
            data:{
                name: name,
                detail: detail,
                number: number,
                topId: topId,
                secondId : secondId ,
                thirdId: thirdId,
                model: model,
                dbp: dbp,
                level: level,
                area: area,
                color: color
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
        })




    }





</script>
</body>
</html>