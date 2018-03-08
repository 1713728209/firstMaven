<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/iframehead.jsp" %>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/openapp.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/openapp.js" charset="UTF-8"></script>
<div class="addAppTitle">
	<h2>开通APP</h2>
</div>
<div class="message">

</div>
<div class="formdiv">
	<form action="modifyapp.action">
		<input type="hidden" name="keywords.id" value="${keywords.id}"/>
		<input type="hidden" name="keywords.openApp" value="1"/>
		<input type="hidden" id="a_keywords" name="keywords.keywords" value="${keywords.keywords}"/>
		<input type="hidden" id="a_customname" name="keywords.customName" value="${keywords.customname}"/>
		<input type="hidden" id="a_price" name="keywords.price" value="${keywords.price}"/>
		<%--<input type="hidden" id="a_type" name="systemConfig.configTypeName" value="<s:property value="systemConfig.configTypeName"/>" />--%>
		<div>
		<ul>
			<li>登录账号：<input type="text" name="appusername" value="${keywords.appusername}"/></li>
			<li>登录密码：<input type="text" name="apppassword" value="${keywords.apppassword}"/></li>
			<li>关键词：<span id="s_key">${keywords.keywords}</span></li><li>企业名称：<span id="s_cn"></span></li>
			<li>价格：￥<span id="s_price"></span></li><li>服务类型：<span id="s_type"></span></li>
		</ul>
		</div>
		<div class="clear"></div>
		<div class="submitdiv"><input type="submit" value="开通APP"/></div>
	</form>
	
</div>
</body>
</html>