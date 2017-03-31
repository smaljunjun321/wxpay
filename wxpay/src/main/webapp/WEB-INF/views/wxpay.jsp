<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>微信支付</title>
<style type="text/css">
.btn {
	display: inline-block;
	padding: 12px 22px;
	margin-bottom: 0px;
	background-color: #31B0D5;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-moz-user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}
</style>
<script type="text/javascript">
var jsParam=${jsParam};
function wxpay(){
	WeixinJSBridge.invoke(
		'getBrandWCPayRequest'
		,jsParam
		,callback
	);
}

function callback(res){ 
	//  返回 res.err_msg,取值 
	// get_brand_wcpay_request:cancel   用户取消 
    // get_brand_wcpay_request:fail  发送失败 
    // get_brand_wcpay_request:ok 发送成功 
     WeixinJSBridge.log(res.err_msg); 	     	     				 
     if(res.err_msg=='get_brand_wcpay_request:ok')
     {
     	showPayResult();
     }
	else
	{
		var msg='支付失败,请重新支付.';
		alert(msg);
		 alert(res.err_code+" err_desc="+res.err_desc+" err_msg="+res.err_msg); 	
	}
};
</script>
</head>
<body>
	<div style="width: 80%;margin-left:50px;">
		<h1>Hello 微信支付！！！！！!</h1>

		<P>The time on the server is ${serverTime}.</P>
		
		<ul>
			<li>来自jackssy的微信支付测试</li>
			<li>支付1分钱测试</li>
			<li>预支付订单号：${prepayid }</li>
			<li>支付JS调起参数：${jsParam }</li>
		</ul>
		<button onclick="wxpay()" class="btn btn-default">点击支付</button>
	</div>
</body>
</html>
