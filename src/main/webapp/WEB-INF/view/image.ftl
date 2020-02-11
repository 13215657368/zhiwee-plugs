<!DOCTYPE html>
<html>
<head>
    <#include "common.ftl">
    <title>Title</title>
</head>
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<#--<script type="text/javascript" src="${ctx}/static/plugin/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugin/layer-v3.1.1/layer/layer.js"></script>
<link rel="stylesheet" href="static/plugin/bootstrap-3.3.7/css/bootstrap.min.css">-->

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <form id="fileForm" enctype="multipart/form-data">
                <label>请选择文件:</label><input type="file" name="uploadFile"  multiple>
            </form>
            <button id="submitBtn">上传</button>
            <br/>
            <div class="progress">
                <div class="progress-bar" role="progressbar"
                     style="width: 0%;">

                </div>
            </div>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
<script type="text/javascript">
    //发送ajax请求:xhr对象发送请求
    $("#submitBtn").click(function () {
        $.ajax({
            url: "${ctx}/fileUpload/save",
            //url:"${ctx}/upload/uploadPic.do",
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
            success:function (result) {
                 console.log(result.fileUrl)
            }
        });
    });
</script>



<script type="text/javascript">
    function upload(){
        $('form').submit();
        $('img').attr('src','img/vote_img_loading.png')
    }
    $(document).ready(function(){
        $(':input[type=file]').change(upload);
    });

    function showPic(path){
        $('img').attr('src','file/'+path).next('span').css('visibility','visible');

    }
</script>


<style type="text/css">
    .pic {
        position: relative;
        width: 100px;
        height: 100px;
        float: left;
        display: inline;
        margin: 0 5px 0 0;
        cursor: pointer;
        overflow: hidden;
    }

    .pic span {
        position: relative;
        color: white;
        margin: -20px 0 0;
        display: block;
        height: 20px;
        width: 100px;
        text-align: center;
        overflow: hidden;
        line-height: 20px;
        background: url(img/template_list_titlebg.png) ;
    }

    .pic form {
        position: absolute;
        width: 100px;
        height: 100px;
        overflow: hidden;
        z-index: 10;
        margin: -100px 0 0;
    }

    .pic input {
        font-size: 100px;
        cursor: pointer;
        -moz-opacity: 0;
        filter: alpha(opacity = 0);
        opacity: 0;
        background: none;
        border: none;
        margin: -10px 0 0 -650px 9;
    }
</style>
</head>
<body>
<iframe style="display:none" name="if">

</iframe>
<div class="pic">
    <img height="100" width="100" src="img/update_pic.png"><span
        style="visibility: hidden">重新上传</span>
    <form enctype="multipart/form-data" method="POST" action="upload.action" target="if">
        <input type="file" name="upload"/>
    </form>
</div>
</body>
</body>
</html>
