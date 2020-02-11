<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <b class="logo navbar-logo f-l mr-10 ">格力官网后台管理系统</b>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li><#if user??>
                        <#if user.role ==1>超级管理员</#if>
                        <#if user.role ==2>普通管理员</#if>
                        </#if>&nbsp;&nbsp;</li>
                    <li class="dropDown dropDown_hover"> <B  class="dropDown_A"><#if user??>${user.username}</#if> <i class="Hui-iconfont">&#xe6d5;</i></B>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${ctx}/admin/logout">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">

    <input type="hidden" id="userId" value="${user.id}">
    <div id="menuContent" class="menu_dropdown bk_2">

    </div>

    <#--<div class="menu_dropdown bk_2">-->

        <#--<dl>-->
            <#--<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>-->
            <#--<dd>-->
            <#--<ul>-->
            <#--&lt;#&ndash; <li><a onclick="updatePassword()" href="javascript:;" title="密码修改">密码修改</a></li>&ndash;&gt;-->
            <#--<li><a href="${ctx}/admin/list" title="账号管理">账号管理</a></li>-->
            <#--<li><a href="${ctx}/log/list" title="登录日志">登录日志</a></li>-->
            <#--</ul>-->
            <#--</dd>-->
        <#--</dl>-->

        <#--</div>-->

    </aside>
    <div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>



<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<script type="text/javascript" src="${ctx}/lib/dot/doT.min.js"></script>

<script type="template" id="menuTemp">
    {{ for(var i = 0; i < it.length; i++){ }}

    <dl id="menu-system">
        <dt><i class="Hui-iconfont">{{=it[i].parent.micon}}</i>{{=it[i].parent.name}}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
        <dd>
            <ul>

                {{ for(var j=0; j < it[i].chirldList.length; j++){ }}
                <li><a href="{{= '${ctx}'+it[i].chirldList[j].links}}" title="账号管理">{{=it[i].chirldList[j].name}}</a></li>

                {{ } }}

            </ul>
        </dd>
    </dl>


    {{ } }}

    <dl>
        <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
        <dd>
            <ul>
                <#-- <li><a onclick="updatePassword()" href="javascript:;" title="密码修改">密码修改</a></li>-->
                <li><a href="${ctx}/admin/list" title="账号管理">账号管理</a></li>
                <li><a href="${ctx}/log/list" title="登录日志">登录日志</a></li>
            </ul>
        </dd>
    </dl>





</script>
    <!--/_menu 作为公共模版分离出去-->

<script type="text/javascript">



    $(function () {
        getMenu();
    })

    function getMenu() {

        var  userId = $("#userId").val();

        $.ajax({
            url: "${ctx}/menu/menuList/"+userId,
            async:false,
            success: function (result) {
                var menuTemp = doT.template($("#menuTemp").text());
                $("#menuContent").html(menuTemp(result));

            }

            })

    }




</script>