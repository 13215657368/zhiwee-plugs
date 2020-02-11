<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />
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

<title>经销商信息添加</title>
</head>
<body>
<article class="cl pd-20">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">

       <input type="hidden" id="id" value="${result.id}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公司名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${result.companyName}" placeholder="" id="companyName" name="companyName">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>经销商类型：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
					<input type="text" class="input-text" value="中央空调" readonly id="type">
				<#--<select name="type" id="type" class="select">
					<option   value="1" selected>格力中央空调</option>
				</select>-->
				</span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否是中央空调专卖店：</label>
            <div class="formControls col-xs-8 col-sm-9">
                是：<input type="radio"   <#if result.isShop==1>checked</#if>  value="1"  name="isShop" id="isShop">
                否：<input type="radio"   <#if result.isShop==2>checked</#if> value="2"  name="isShop" id="isShop">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${result.relation}"  name="relation" id="relation">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${result.tel}"  name="tel" id="tel">
            </div>
        </div>




        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所在城市：</label>

            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" onchange="getCountryList(this.value,'county')" name="city" id="city">
					<option value="0" selected>请选择城市</option>
                <#list  cityList as  item>
                    <option <#if  item.name==result.city >selected</#if> value="${item.id}">${item.name}</option>
                </#list>
				</select>
				</span> </div>
        </div>





        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所在城市区/县：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="county" id="county" >
					<option value="0" selected>请选择城市区/县</option>
					<#--<option value="1">北京</option>
					<option value="2">上海</option>
					<option value="3">广州</option>-->
                <#list  countryList as  item>
                    <option  <#if  item.name==result.county >selected</#if> value="${item.id}">${item.name}</option>
                </#list>
				</select>
				</span> </div>
        </div>



        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${result.address}" name="address" id="address">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">面积：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  value="${result.area}" name="area" id="area">
            </div>
        </div>




	</form>

   <#-- <form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">
        <input id="hideUrl" type="hidden" >
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">经销商证书：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <a id="apic" >
                    <a id="remark1"></a>
                </a>
                <div class="uploader-thum-container">
                    <div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
				</span>
                        <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button>

					</div>


                </div>
            </div>
        </div>
	</form>
-->

	<#--<form id="fileForm"  class="form form-horizontal" enctype="multipart/form-data">

		<input id="hideUrl" type="hidden" >
        <div class="row cl">
            <a id="apic" >
                <a id="remark1"></a>

            <label class="form-label col-xs-4 col-sm-3">经销商证书：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="uploadFile" class="input-file" multiple>
			&lt;#&ndash; <input type="file" name="uploadFile"  multiple>&ndash;&gt;
				</span>
                <button id="submitBtn"  class="btn btn-primary radius upload-btn" type="button" style="width: 130px;height: 30px; "><i class="Hui-iconfont">&#xe642;</i>上传</button></div>
            </a>
        </div>
	</form>
-->

    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <button class="btn btn-primary radius" type="button"  onclick="save()">&nbsp;&nbsp;提交&nbsp;&nbsp</button>
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
<script type="text/javascript">




$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
			uploadfile:{
				required:true,
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});


//预加载，拼接出城市列表下拉框
$(function () {
//getCityList();
});

	function getCityList() {
        var   htmlStr ="<option value='0'>请选择城市</option>";
        $.ajax({
            type: 'POST',
            url:"${ctx}/business/cityList",
            dataType: 'json',
            success:function(result) {
               // console.log(result);
				for(var i=0;i<result.length;i++){
                    htmlStr+="<option value='"+result[i].id+"' >"+result[i].name+"</option>"
				}
				$("#city").html(htmlStr);
            },
            error:function () {
                $("#city").html(htmlStr);
            }
        })
    };

    function getCountryList(parentId,node) {
        var   htmlStr ="<option value='0'>请选择城市区/县</option>";
       //console.log(parentId);
      // console.log(node);
        $.ajax({
            type: 'POST',
            url:"${ctx}/business/countryList",
            data:{
                parentId:parentId
			},
            dataType: 'json',
            success:function(result) {
                // console.log(result);
                for(var i=0;i<result.length;i++){
                    htmlStr+="<option value='"+result[i].id+"' >"+result[i].name+"</option>"
                }
                $("#"+node).html(htmlStr);
            },
            error:function () {
                $("#"+node).html(htmlStr);
            }
        })
    };


    function save() {
        var id=$("#id").val();
        var  companyName  = $("#companyName").val();
        var  isShop = $('input[name="isShop"]:checked').val();
        var   tel   =$("#tel").val();
        var   city = $("#city option:selected").text();
        var    cityId = $("#city option:selected").val();
        var    county= $("#county option:selected").text();
        var    countyId =$("#county option:selected").val();
        var    address =$("#address").val();
        var    area = $("#area").val();
        var    relation =$("#relation").val();

        if(0==$("#city option:selected").val()){
			layer.msg("请选择城市",{
				icon:2,
				time:1500,
			});
            //alert("请选择城市");
            return;
        }
        if(0==$("#county option:selected").val()){
			layer.msg("请选择区域",{
				icon:2,
				time:1500,
			});
            //alert("");
            return;
        }


       /* alert(level);
        return;*/

	    $.ajax({
            type: 'POST',
            url:"${ctx}/business/air/update",
            data:{
                id:id,
                companyName:companyName,
                isShop:isShop,
                tel:tel,
                city:city,
                cityId:cityId,
                county:county,
                countyId:countyId,
                address:address,
                area:area,
                relation:relation
            },
            dataType: 'json',
			success:function (result) {


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



//发送ajax请求:xhr对象发送请求
/*
$("#submitBtn").click(function () {
  /!*  var  number=$("#number").val();
    ///alert("aaaa");
    if(null== number||""== number.trim()){
        alert("请先填写信息信息");
        return;
    }*!/

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
        success:function (result) {
            //  console.log(result.fileUrl)
            if(result.fileUrl!=null){
                $("#hideUrl").val(result.fileUrl);
                alert("图片上传成功");
              /!* $("#imgUrl").val(result.fileUrl);*!/
                //调用图片入库函数
               /!* imgInsert();*!/
              /!*  $("#remark").html("");*!/
              /!*  $('#info1').html("当前进度:100%");*!/
               $("#remark1").append("<img  alt='图片缩略图' id='showIs'  style='opacity: 1'  width=90px height=90px  />")
                $('#showIs').attr('src',result.fileUrl);
                //    $('#remark1').append('<button type="button"   onclick="img_del(1)">删除</button>');
                $('#remark1').append('   <a style="text-decoration:none" class="ml-5"  id="delImg1" onClick="img_del(1)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');


              /!*  $('#showImg').attr('src',result.fileUrl);*!/
              /!*  $("#url").val(result.fileUrl);*!/
            }
            // console.log(result);

        }
    });
});
*/


/*
function img_del() {
    var  pathName= $("#hideUrl").val();
    /!*alert(pathName);
    return;*!/
    $.ajax({
        type: 'POST',
        url:"${ctx}/fileUpload/delete",
        data:{
            pathName:pathName
        },
        dataType: 'json',
        success:function(result) {
            if(result.code==200){
                alert("删除成功");
                window.location.reload();
            }else{
                alert("删除失败");
            }
        }
    })

}
*/







</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>