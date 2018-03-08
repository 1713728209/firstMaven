<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">系统管理</a> \ <a href="/premission">角色权限管理</a>
</div>
<div class="container">
		
		<ul>
			<li class="jslist">
			<ul>
		 			<c:forEach items="${list}" varStatus="sta" var="role">
		       			<li>
							<div id="sidebar" style="text-align: center">
								<a href="/mainData?roleId2=${role.id}" target="funclist">${role.rolename}</a>
		                	</div>
						</li>
		         		</c:forEach>
		 		</ul>
			</li>
			<li class="iframeli"><iframe id="funclist" name="funclist" width="100%" height="99%" src="/pages/functionlist.jsp"></iframe></li>
		</ul>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/premission.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/premission.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>

