<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPay.css" rel="stylesheet"/>
    <title>地星电子产品自营商城 - 网上支付</title>
    <style>
        body{
            background-color: aliceblue;
        }
    </style>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"></a>
        </div>
    </div>
</nav>
<div class="content">
    <div class="order_pay_div">
        <script>
            function pay() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/order/pay/${requestScope.productOrder.productOrder_code}",
                    type: "PUT",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("订单处理异常，请稍候再试！");
                        }
                        location.href = "/tmall" + data.url;
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("订单支付出现问题，请重新支付！");
                        location.href = "/tmall/order/0/10";
                        // alert("hello");
                        location.href = "/tmall" + data.url;
                    }
                });
            }
        </script>
        <a class="order_pay_btn" href="javascript:void(0)" onclick="pay()">完成支付</a>
    </div>
</div>
<%--<%@include file="include/footer_two.jsp" %>--%>
<%--<%@include file="include/footer.jsp" %>--%>
</body>
