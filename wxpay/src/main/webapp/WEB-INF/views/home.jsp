<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
label {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 5px;
	font-weight: 700;
	width: 100px;
	margin-top: 20px;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555;
	background-color: #FFF;
	background-image: none;
	border: 1px solid #CCC;
	border-radius: 4px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
	transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
		ease-in-out 0s;
		margin-top: 20px;
}

.form-control:focus {
	border-color: #66AFE9;
	outline: 0px none;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px
		rgba(102, 175, 233, 0.6);
}

.btn {
	display: inline-block;
	padding: 16px 22px;
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
</head>
<body>
	<div style="width: 80%;margin-left:50px;">
		<h1>Hello 微信支付！！！！！!</h1>
      
		<h3>微信支付需要用微信客户端的相应的服务号中打开</h3>
		<P>The time on the server is ${serverTime}.</P>
		<h3>微信支付参数配置</h3>
		
		<h3>微信支付支付测试目录配置信息：domain/pay/</h3>
		注：此处需要添加自己的微信号为测试白名单！需要传入相应的openid给微信
		<hr/>
		<form action="config" method="post">
			<label for="exampleInputEmail1">AppId</label> <input name="appId" placeholder="输入appid" value=""/><br />
			<label for="PartnerId">PartnerId</label> <input name="partnerId" placeholder="输入商户id" value=""/><br />
			<label for="partnerKey">PartnerKey</label> <input name="partnerKey" placeholder="输入商户密钥" value=""/><br />
			<button type="submit" class="btn btn-default">提交支付参数</button>
		</form>
		
	</div>
    
</body>
</html>