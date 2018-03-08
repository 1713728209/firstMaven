<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="utf-8">
	<title>代理商管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath }/css/public.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath }/css/default.css" rel="stylesheet"/>
	<!-- jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/login.js" charset="UTF-8"></script> 
</head>
<body>
<div class="head">
<h1>AgentSystem  | 代理商管理系统 <span>v1.01</span></h1>
</div>
<div class="container">
	<form method="post" action="/login" class="jNice">
	<h1>登录系统 | Sign in</h1>
	<ul class="loginul">
		<li>登录账号：<input type="text" id="usercode" name="userCode"  maxlength="20" value="admin"/></li>
		<li>登录密码：<input type="password" id="userpassword" name="userPassword"  maxlength="20" value="123456"/></li>
		<li><input type="submit" id="loginBtn" value="登录| Login"/></li>
	</ul>
	</form>
  
</div>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>