<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_register.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_register.css" rel="stylesheet">
    <title>地星电子产品自营商城 - 网上注册</title>
    <script>
        $(function () {
            $("span.address_province").text($("#select_order_address_province").find("option:selected").text());
            $("span.address_city").text($("#select_order_address_city").find("option:selected").text());
            $("span.address_district").text($("#select_order_address_district").find("option:selected").text());
        })
    </script>
    <style rel="stylesheet">
        body{
            background-color: aliceblue;
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
</head>
<body>
<nav>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"><span
                    class="span_tmallRegister">用户注册</span></a>
        </div>
    </div>
</nav>
<div class="content">
    <div class="steps">
        <div class="steps_main">
            <span class="steps_tsl">填写账号信息</span>
        </div>
    </div>
    <div class="form-list">
        <div class="form-item">
            <label class="form-label form-label-b tsls">设置会员名</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">用户名：</label>
            <input name="user_name" id="user_name" class="form-text err-input" placeholder="请输入用户名" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label form-label-b tsls">设置登录密码</label>
            <label class="form-label tsl">登录时验证，保护账号信息</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">登录密码：</label>
            <input name="user_password" type="password" id="user_password" class="form-text err-input"
                   placeholder="请设置登录密码" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">确认密码：</label>
            <input name="user_password_one" type="password" id="user_password_one" class="form-text err-input"
                   placeholder="请再次输入你的密码" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label form-label-b tsls">填写基本信息</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">昵称：</label>
            <input name="user_nickname" id="user_nickname" class="form-text err-input" placeholder="请输入昵称"
                   maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">性别：</label>
            <input name="user_gender" type="radio" id="form_radion" value="0" checked="checked">男
            <input name="user_gender" type="radio" id="form_radions" value="1">女
        </div>
        <div class="form-item">
            <label class="form-label tsl">出生日期：</label>
            <input type="date" name="user_birthday" id="user_birthday" class="form-text err-input"/>
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">居住地址：</label>
            <select class="selectpicker" id="select_user_address_province" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.addressList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.addressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select class="selectpicker" id="select_user_address_city" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.cityList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.cityAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select name="user_address" class="selectpicker" id="select_user_address_district" data-size="8"
                    data-live-search="true">
                <c:forEach items="${requestScope.districtList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.districtAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-item">
            <label class="form-label tsl">邮箱：</label>
            <input type="email" name="user_email" id="user_email" class="form-text err-input"/>
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label">验证码：</label>
                <input style="width: 135px" type="text" name="vertify" id="vertify" class="form-text err-input" placeholder="验证码"/>
                <input class="btn-primary" style="height: 30px; display: inline !important;" type="button" name="sendCode" id="sendCode" value="发送验证码"/>
        </div>
        <div class="form-item">
            <input type="button" id="register_sub" class="btns btn-large tsl" value="注 册"/>
        </div>
    </div>
</div>
<%--<%@include file="include/footer.jsp" %>--%>
<%--<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>--%>
<div class="msg">
    <span>注册成功，跳转到登陆页面</span>
</div>
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
    let count = 60;
    let sending = false;
    $("#sendCode").bind("click", function () {
        if(!sending){
            // 判断邮箱是否为空
            let user_email = $("#user_email");
            if(user_email.val() == undefined || user_email.val().trim() == ""){
                user_email.css("border", "1px solid red")
                    .next().text("请填写邮箱").css("display", "inline-block").css("color", "red");
                return;
            }else if(!new RegExp(/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/).test(user_email.val())){
                $("#user_email").css("border", "1px solid red")
                    .next().text("请输入正确的邮箱格式").css("display", "inline-block").css("color", "red");
                return false;
            }
            sending = true;
            // 发送验证码发送请求
            let sendBtn = $("#sendCode");
            $.ajax({
                url: "/tmall/register/getEmailCode",
                type: "POST",
                data: {
                    email: user_email.val().trim()
                },
                dataType: "json",
                success: function (res) {
                    if(res.success){
                        console.log("请求成功");
                        sendBtn.attr("disable", true);
                        let timer = setInterval(function () {
                            count--;
                            sendBtn.attr("value", "验证码已发送，请"+count+"秒后再获取");
                        }, 1000);
                        setTimeout(function () {
                            console.log("超时执行");
                            clearInterval(timer);
                            sendBtn.attr("disable", false);
                            count = 60;
                            sending = false;
                            sendBtn.attr("value", "发送验证码");
                        }, 60000);
                    }

                },
                error: function () {
                    console.log("服务器错误");
                    sendBtn.attr("disable", false);
                    count = 60;
                    sending = false;
                    sendBtn.attr("value", "发送验证码");
                }
            });

        }else{
            return;
        }
    })
</script>
</body>

