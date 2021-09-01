<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/admin/admin_login.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/admin/admin_login.css"/>
    <title>后台管理 - 登录</title>
</head>
<body>
<div id="div_background">
    <div id="div_nav">
        <span id="txt_date"></span>
        <span id="txt_peel">换肤</span>
        <ul id="div_peelPanel">
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-1.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-1.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-2.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-2.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-3.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-3.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-4.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-4.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-5.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-5.jpg"/>
            </li>
        </ul>
    </div>
    <div id="div_main">
        <div id="div_head"><p><span>地星商城后台管理</span></p></div>
        <div id="div_content">
            <img id="img_profile_picture"
                 src="${pageContext.request.contextPath}/res/images/admin/loginPage/default_profile_picture-128x128.png"
                 alt="头像" title="头像"
                 onerror="this.src='${pageContext.request.contextPath}/res/images/admin/loginPage/default_profile_picture-128x128.png'"/>
            <form id="form_login">
                <input type="text" class="form-control form_control" placeholder="用户名" id="input_username" title="请输入用户名"/>
                <input type="password" class="form-control form_control" placeholder="密码" id="input_password" title="请输入密码" autocomplete="on">

<%--                <div class="form-group has-feedback">--%>
<%--                    <input type="text" name="username" id="username" class="form-control" placeholder="账号"/>--%>
<%--                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>--%>
<%--                </div>--%>
<%--                <div class="form-group has-feedback">--%>
<%--                    <input type="password" name="password" class="form-control" id="password" placeholder="密码"/>--%>
<%--                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>--%>
<%--                </div>--%>

<%--                <div class="form-group has-feedback">--%>
<%--                    <opinioncontrol realtime="true" opinion_name="vertify_code" default="true">--%>
<%--                        <div class="row" style="padding-right: 65px;">--%>
<%--                            <div class="col-xs-8">--%>
<%--                                <input style="width: 135px" type="text" name="vertify" id="vertify" class="form-control"--%>
<%--                                       placeholder="验证码"/>--%>
<%--                            </div>--%>
<%--                            <div class="col-xs-4">--%>
<%--                                <img id="imgVerify" style="cursor:pointer;" src="${pageContext.request.contextPath}/image/getKaptchaImage"--%>
<%--                                     alt="点击更换" title="点击更换"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </opinioncontrol>--%>
<%--                </div>--%>

                <span id="txt_error_msg"></span>
                <input type="button" class="btn btn-danger" id="btn_login" value="立即登录"/>
            </form>
        </div>
    </div>
</div>

<!--js中的代码-->
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        getKaptchaImage();
    });

    //点击更换验证码
    function getKaptchaImage() {
        $("#imgVerify").on("click", function () {
            var url = "${pageContext.request.contextPath}" + "/image/getKaptchaImage?time=" + new Date();
            $(this).attr("src", url);
        });
    }


    // 用户登录
    function userLogin() {
        // 必须输入用户名、密码、验证码
        var username = $("#username").val();
        var password = $("#password").val();
        var vertify = $("#vertify").val();

        if (undefined == username || "" == username) {
            layer.alert("请输入用户名！");
            return;
        }

        if (undefined == password || "" == password) {
            layer.alert("请输入密码！");
            return;
        }

        if (undefined == vertify || "" == vertify) {
            layer.alert("请输入验证码！");
            return;
        }

        $.ajax({
            url: "${ctx}/admin/login/doLogin",
            type: "POST",
            data: {
                userName: username,
                password: password,
                verify: vertify
            },
            dataType: "JSON",
            success: function (result) {
                if (200 == result.code) {
                    location.href = "${ctx}/index";
                } else {
                    // 模拟点击事件行为
                    $("#imgVerify").trigger("click");
                    layer.alert(result.message);
                }
            },
            error: function () {
                layer.alert("亲，系统正在升级中，请稍后再试！");
            }
        });
    }

    jQuery.fn.center = function () {
        this.css("position", "absolute");
        this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) +
            $(window).scrollTop()) - 30 + "px");
        this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
            $(window).scrollLeft()) + "px");
        return this;
    }
</script>
</body>
