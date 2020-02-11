<!DOCTYPE HTML>
<html>
<head>
    <#include "/WEB-INF/view/common.ftl">
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
    <link href="${ctx}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <title>格力官网后台登录</title>
</head>
<style>
    body{
        background-color:azure;
    }
</style>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header" align="center"><h1><B style="color: white">安徽格力网站后台管理系统</B></h1></div>
<br>
<br>
<br>
<br>
<div class="loginWraper">
    <#---->
    <form class="form form-horizontal"  method="post">
        <div id="loginform" class="loginBox">

            <div class="row cl">

                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i>账户：</label>
                <div class="formControls col-xs-8" align="center">
                    <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">

                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i>密码：</label>
                <div class="formControls col-xs-8" align="center">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>


            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="pwdSave" id="pwdSave" value="1">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">

                    <input name="" type="button"  onclick="login()" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    &nbsp;&nbsp;
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
            <#--		</form>-->

        </div>
    </form>
    <#---->

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="footer">Copyright 安徽格力</div>
<br>


<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script>
    /*var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(hm, s);
    })();*/

    function login() {
        //  alert("登录");
        var  username = $("#username").val();
        var  password = $("#password").val();

        //console.log($("#pwdSave").val());
        if($('#pwdSave').is(':checked')) {
            var  p = $("#pwdSave").val();
        }else {
            var   p =0;
        }



        if(null==username||""==username.trim()){
            layer.msg("用户名不能为空",{
                icon:2,
                time:1500,
            });
            //alert("用户名为空");
            return  ;
        }
        if(null==password ||""==password .trim()){
            layer.msg("密码不能为空",{
                icon:2,
                time:1500,
            });
            //alert("密码不能为空");
            return  ;
        }

        //发送ajas请求发送数据


        $.ajax({
            url:'${ctx}/admin/login',
            type:'post',
            data:{
                username:username,
                password:password,
                p:p
            },

            success:function (data) {
                // console.log(data);
                if(data.code==200){
                    layer.msg("登录成功",{icon:1,time:2000});
                    //console.log(data.result.userIdStr);
                    // alert(data.result.userIdStr);
                    // $.cookie("userIdStr", data.result.userIdStr);
                    //跳转到主页
                    window.location.href="${ctx}/index";
                }if(data.code==300){
                    layer.msg(data.message,
                        {
                            icon:2,
                            time:3000,
                            end:function(){
                                window.location.reload();
                            }
                        });

                }if(data==400){
                    layer.msg(data.message,
                        {
                            icon:2,
                            time:3000,
                            end:function(){
                                window.location.reload();
                            }
                        });
                }

            }
        })



    }



</script>
</body>
</html>