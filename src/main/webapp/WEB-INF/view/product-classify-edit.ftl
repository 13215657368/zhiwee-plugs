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
        <title>商品类别更新</title>
</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
            <input    type="hidden"  id="hideType" value="${p.type}">
            <input      type="hidden"   id="hideId" value="${p.id}" >
            <input    type="hidden"  id="hidePid" value="<#if p.parentId ??>${p.parentId}</#if>" >
            <input    type="hidden"  id="hideRid" value="<#if p.rootId ??>${p.rootId}</#if>" >
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类名称名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${p.name}" placeholder="请输入" id="name" name="name">
			</div>
		</div>




        <#---->
        <input  type="hidden" id="imgUrl"  >

        <div  id="classifyCover"  class="row cl">
            <label class="form-label col-xs-2 col-sm-2">产品分类图片：</label>
            <div class="formControls col-xs-7 col-sm-9">

                <div class="uploader-thum-container">
                    <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				            <input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile2" readonly nullmsg="请添加附件！" style="width:200px">
                            <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				            <input type="file"   name="uploadFile" id="fileForm22"  class="input-file">
			        	</span>
                        <button id="submitBtn2"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>
                        <#if p.cover  !="">
                           <img src="${p.cover}"   id="cover"  style='opacity: 1'  width=90px height=90px >
                            <a style="text-decoration:none" class="ml-5"  id="delImg" onClick="img_del('${p.cover}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                        </#if>

                        <a id="remark"></a>
                    </div>

                </div>
            </div>
        </div>
        <#---->




        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上级分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span  >
                <select style="width: 40%" name="type" id="root"     onchange="getSecond(this.value)" class="select">

                </select>
                </span>
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                &nbsp;&nbsp; &nbsp;
                <span>
                <select  style="width: 40%"  <#--  onclick="checkCover()" -->name="type" id="second" class="select">
                          <option value='0'>请选择二级分类</option>
                </select>
                </span>


        </div>
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


    
    $(function () {
        getRootType();
        getSecond2();
    })







    
    
    function getRootType() {
        var   htmlStr ="<option value='0'>请选择顶级分类</option>";
        $.ajax({
                type: 'GET',
                url:"${ctx}/productClassify/queryByType/root",
                dataType: 'json',
                success:function(result) {
                // console.log(result);

                if(result.code==200){

                    for(var i=0;i<result.result.length;i++){
                        htmlStr+="<option id='r"+i+"'  value='"+result.result[i].id+"'>"+result.result[i].name+"</option>"
                    }

                }

                $("#root").html(htmlStr);

                     for(var i=0;i<result.result.length;i++){
                         if(result.result[i].id==$("#hideRid").val()){
                             $("#r"+i).attr("selected","selected");
                         }
                     }

            },
            error:function () {
                $("#root").html(htmlStr);
            }

        })
        
    }


    /*用来做信息回显的，没有其他的作用
    * */

    function getSecond2(){
        var   htmlStr ="<option value='0'>请选择二级分类</option>";
        var   pid = $("#hidePid").val();
        var  rid = $("#hideRid").val();
        var type  = "second";

        console.log(pid);
        $.ajax({
            type:'GET',
           // url:'${ctx}/productClassify/queryById/'+pid,
            url:'${ctx}/productClassify/queryByRootIdAndType',
            data:{
                rootId:rid,
                type:type
            },
            dataType:'json',
            success:function (result) {
             //   console.log(JSON.stringify(result));

            /*    if(result.type == "second"){
                    htmlStr="<option  value='"+result.id+"' >"+result.name+"</option>"
                }*/

            for(var i=0;i<result.length;i++){
                htmlStr+="<option  id='s"+i+"' value='"+result[i].id+"' >"+result[i].name+"</option>"
            }

                $("#second").html(htmlStr);



            for(var i=0;i<result.length;i++){
                if(pid==result[i].id){
                    $("#s"+i).attr("selected","selected");
                }
            }


                //判断封面

            /*    var   secondId  =  $("#second option:selected").val();
               // console.log(secondId);
                if(secondId !=0){
                    $("#classifyCover").hide();
                }else {
                    $("#classifyCover").show();
                }*/



            },
            error:function () {
                $("#second").html(htmlStr);
            }

        })

    }


    /**
     * 获取第二级的分类名称
     * */
    function getSecond(id){
        var   htmlStr ="<option value='0'>请选择类别</option>";
        $.ajax({
            type:'POST',
            url:'${ctx}/productClassify/quertByParentId/'+id,
            dataType:'json',
            success:function (result) {
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







    /**
     * 信息提交
     */
    function product_submit(){
        var  name=$("#name").val();
        var type ;
        var parentId;
        var  parentName;
        var  rootId;
        var  rootName;
        var  root=$("#root  option:selected").val();
        var  second =$("#second option:selected").val();
        var  cover = $("#imgUrl").val();


        if(root == 0){
            type = "root";
            parentId=null;
            parentName=null;
            rootId=null;
            rootName=null;

        }

        if(root != 0&&second ==0){
            type = "second";
            parentId=$("#root  option:selected").val();
            parentName=$("#root option:selected").text();

            rootId=$("#root option:selected").val();
            rootName=$("#root option:selected").text();
        }

        if(root !=0&&second !=0){
            type = "third";
            parentId=$("#second option:selected").val();
            parentName=$("#second option:selected").text();

            rootId=$("#root option:selected").val();
            // console.log(rootId);
            rootName=$("#root option:selected").text();

        }
        if(root ==0 && second !=0){
            layer.msg("请选择顶级分类",{
                icon:2,
                time:1500,
            })
            return;
        }



        if(null==name||""==name.trim()){
         //   alert("请上传商品参数信息图片");
           layer.msg("请输入类别名称名称",{
               icon:2,
               time:1500,
           })
            return;
        }



        $.ajax({
            type: 'POST',
            url:"${ctx}/productClassify/update",
            data:{
                id:$("#hideId").val(),
                name: name,
                parentId:parentId,
                parentName:parentName,
                rootId:rootId,
                rootName:rootName,
                type: type,
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
                    layer.msg("新增失败，请检查对应信息是否完整",{
                        icon:2,
                        time:1500,
                    })

                }
            }
        })

        



    }



    /*
  * 封面框的显示与隐藏
  *
  * */

/*

    function checkCover() {

        var   secondId  =  $("#second option:selected").val();
        // console.log(secondId);
        if(secondId !=0){
            $("#classifyCover").hide();
        }else {
            $("#classifyCover").show();
        }


    }

*/



    /*
   * 类别封面图片上传
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
            success: function (result) {
                console.log(result.fileUrl)
                if (result.fileUrl != null) {

                    $("#imgUrl").val(result.fileUrl);
                    $("#remark2").html("当前进度为100%");
                    layer.msg("封面上传上传成功",{
                        icon:1,
                        time:1500,
                    });
                    //调用图片入库函数
                    $("#remark").append("<img  alt='图片缩略图' id='showIs'  style='opacity: 1'  width=90px height=90px  />")
                    $('#showIs').attr('src', result.fileUrl);
                    //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                    $('#remark').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del(\''+result.fileUrl+'\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
                }

            }
        });
    })






    /*
    * 图片删除操作
    * */
    function img_del(pathName) {
        // var  pathName= $("#hideUrl").val();
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
                    //$("#cover").remove();
                    $("img").remove();
                    $("#delImg").remove();
                    $("#delImg1").remove();

                 //   window.location.reload();
                }else{
                    layer.msg("图片删除失败",{
                        icon:2,
                        time:1500,
                    })
                }
            }
        });

    }





</script>
</body>
</html>