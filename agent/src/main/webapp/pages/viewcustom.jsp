<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/customlist">代理商客户管理</a> \ <a href="viewcustom?id=${custom.id}">查看客户信息</a>
</div>
<div class="container">

	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：${custom.customname}</li>
			<li>状态：<c:if test="${custom.customstatus == 1}">
	        	 	  	<font color="green">启用</font>
	        	 	  </c:if>
	        	 	  <c:if test="${custom.customstatus == 2}">
	        	 	  	<font color="red">停用</font>
					  </c:if></li>
			<li>企业类型：${custom.customtype}</li>
			<li>企业主页：${custom.siteurl}</li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：${custom.bossname}</li>
			<li>注册日期：<fmt:formatDate value="${custom.regdatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </li>
			<li>证件类型：${custom.cardtype}</li>
			<li>证件号码：${custom.cardnum}</li>
			<li>国家：${custom.country}</li>
			<li>省/地区：
				<c:if test="${not empty provinceList}">
        	 		 <c:forEach items="${provinceList}" var="province">
		        	 	  <c:if test="${custom.provinceid==province.id}">
		        	 	   ${province.province}
		        	 	  </c:if>
					  </c:forEach>
					</c:if>
			</li>
			<li>区：
			<c:if test="${areaList != null}">
        	 		 <c:forEach items="${areaList}" var="area">
		        	 	  <c:if test="${custom.areaid==area.id}">
		        	 	    ${area.areaname}
		        	 	  </c:if>
					  </c:forEach>
					</c:if>
			</li>
			<li>城市：
			<c:if test="cityList != null">
        	 		 <c:forEach items="${cityList}" var="city">
		        	 	  <c:if test="${custom.cityid==city.id}">
		        	 	    ${city.cityname}
		        	 	  </c:if>
					  </c:forEach>
					</c:if>
			</li>
			<li>公司电话：${custom.companytel}</li>
			<li>公司传真：${custom.companyfax}</li>
			<li>公司地址：${custom.companyaddress}</li>
			<li>备注：${custom.memo}</li>
		</ul>
		<div class="clear"></div>
	</div>

	<div class="subtitle">联系人信息</div>
	<div class="info3">
		<ul>
			<%--<c:if test="contactList != null">--%>
            	<%--<c:forEach value="contactList" status="sta">--%>
            		<%--<li>--%>
            			<%--<div>姓名：<s:property value="contactName"/></div>--%>
            			<%--<div>电话：<s:property value="contactTel"/></div>--%>
            			<%--<div>传真：<s:property value="contactFax"/></div>--%>
            			<%--<div>邮箱：<s:property value="contactEmail"/></div>--%>
            			<%--<div>职务：<s:property value="contactRole"/></div>--%>
            		<%--</li>--%>
            	<%--</c:forEach>--%>
            	<%--</c:if>--%>

				<%--<c:if test="">--%>
            		<%--<li>没有任何联系人</li>--%>
            	<%--</c:if>--%>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="goback"><input type="button" onclick="window.history.back(-1);" value="返回" /> </div>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/viewcustom.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/viewcustom.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
