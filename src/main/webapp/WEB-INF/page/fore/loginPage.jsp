<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_login.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_login.css" rel="stylesheet">
    <style rel="stylesheet">
        #baseNavigator {
            padding: 22px 0;
            width: 1190px;
            height: 44px;
            margin: auto;
        }

        #baseNavigator img {
            width: 190px;
            margin-top: 8px;
        }

        #nav {
            width: auto;
            height: 32px;
            font-family: "Microsoft YaHei UI", Tahoma, serif;
            font-size: 12px;
            position: relative !important;
            background: #f2f2f2;
            z-index: 999;
            border-bottom: 1px solid #e5e5e5;
        }
    </style>
    <title>地星电子产品自营商城-登录</title>
</head>
<body>
<nav id="baseNavigator">
    <a href="${pageContext.request.contextPath}" target="_self">
        <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"/>
    </a>
</nav>
<div class="content">
    <div class="contentMain"></div>
    <div class="loginDiv">
<%--        <div class="loginSwitch" id="loginSwitch"></div>--%>
<%--        <div class="loginMessage">--%>
<%--            <div class="loginMessageMain">--%>
<%--                <div class="poptip-arrow"><em></em><span></span></div>--%>
<%--                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/scan-safe.png"/><span>扫码登录更安全</span>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="pwdLogin">
            <span class="loginTitle">密码登录</span>
            <form method="post" class="loginForm">
                <div class="loginInputDiv">
                    <label for="name" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235518.png"
                            width="38px" height="39px" title="会员名"/></label>
                    <input type="text" name="name" id="name" class="loginInput" placeholder="会员名">
                </div>
                <div class="loginInputDiv">
                    <label for="password" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235533.png"
                            width="38px" height="39px" title="登录密码"/></label>
                    <input type="password" name="password" id="password" class="loginInput">
                </div>
<%--                <div class="form-group has-feedback">--%>
<%--                    <opinioncontrol realtime="true" opinion_name="vertify_code" default="true">--%>
<%--                        <div class="row" style="padding-right: 65px;">--%>
<%--                            <div class="col-xs-4">--%>
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
                <div class="form-item" style="margin-top: 20px">
                    <span>
                        <input style="width: 170px; vertical-align:middle; height: 38px" type="text" name="vertify" id="vertify" class="form-text err-input" placeholder="验证码"/>
                        <img style="vertical-align:middle; height: 40px; width: 110px; margin-left: 9px" id="imgVerify" src="${pageContext.request.contextPath}/image/getKaptchaImage" alt="点击更换" title="点击更换"/>
                    </span>
                </div>
                <input type="submit" class="loginButton" value="登 录">
            </form>
            <div class="loginLinks">
                <a href="${pageContext.request.contextPath}/register">免费注册</a>
            </div>
            <div class="error_message">
                <p id="error_message_p"></p>
            </div>
        </div>
        <div class="qrcodeLogin">
            <span class="loginTitle">手机扫码，安全登录</span>
            <div class="qrcodeMain">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/login_qrcode.png"
                     id="qrcodeA"/>
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/login_qrcodeB.png"
                     id="qrcodeB"/>
            </div>
            <div class="qrcodeFooter">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/scan_icon2.png">
                <p>打开 <a href="https://www.tmall.com/wow/portal/act/app-download">手机天猫</a> | <a
                        href="https://www.taobao.com/m">手机淘宝</a>扫一扫登录</p>
            </div>
            <div class="loginLinks">
                <a href="JavaScript:void(0)" id="pwdLogin">密码登录</a>
                <a href="#">免费注册</a>
            </div>
        </div>
    </div>
</div>
<%--<%@ include file="include/footer.jsp" %>--%>
<%--<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>--%>
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


</script>
</body>
