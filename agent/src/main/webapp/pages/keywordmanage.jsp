<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="keywordmanage.action">关键词申请管理</a>
</div>
<div class="container">


<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="searchKeyword" method="post">
		关键词：<input type="text" value="${keywords}" name="keywords"/>
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>


 <table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>关键词</th>
		  <th>客户名称</th>
		  <th>代理商</th>
		  <th>申请年限</th>
		  <th>申请日期</th>
		  <th>到期日期</th>
		  <th>申请到期状态</th>
		  <th>审核状态</th>
		  <th>使用状态</th>
		  <th>APP开通状态</th>
		  <th>操作</th>
	  </tr>
  </thead>   
  <tbody>
	<c:if test="${list!=null}">
		<c:forEach items="${list}" varStatus="adIndex"  var="keyword">
		<tr class="tabletr">
			<td>${keyword.id}</td>
			<td>${keyword.keywords}</td>
			<td>${keyword.customname}</td>
			<td>${keyword.agentname}</td>
			<td>${keyword.serviceyears}</td>
			<td><fmt:formatDate value="${keyword.regdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
			<td><fmt:formatDate value="${keyword.regpassdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
			<td>
				<c:if test="${keyword.ispass == 0}">
					<font color="green">未过期</font>
				</c:if>
				<c:if test="${keyword.ispass == 1}">
					<font color="red">预注册过期</font>
				</c:if>
				<c:if test="${keyword.ispass ==2}">
					<font color="red">过期</font>
				</c:if>
			</td>
			<td>
			<c:if test="${keyword.checkstatus == 0}">
					<font color="green">已申请</font>
				</c:if>
				<c:if test="${keyword.checkstatus == 1}">
					<font color="green">审核中</font>
				</c:if><c:if test="${keyword.checkstatus == 2}">
					<font color="green">已通过</font>
				</c:if>
				<c:if test="${keyword.checkstatus == 3}">
					<font color="red">未通过</font>
				</c:if>
			</td>
			<td>
				<c:if test="${keyword.isuse == 1}">
					<font color="red">未使用</font>
				</c:if>
				<c:if test="${keyword.isuse == 2}">
					<font color="green">已使用</font>
				</c:if>
			</td>
			<td>
				<c:if test="${keyword.openapp == 1}">
					<font color="red">未开通</font>
				</c:if><c:if test="${keyword.openapp == 2}">
					<font color="green">已开通</font>
				</c:if>
			</td>
			<td>
				<c:if test="${keyword.openapp == 1}">
					<a class="openapp" kid="${keyword.id}" keyword="${keyword.keywords}">开通APP</a>
				</c:if>
				<c:if test="${keyword.ispass >= 2}">
					<a class="xufei" kid="${keyword.id}" keyword="${keyword.keywords}">续费</a>
				</c:if>
				<a class="deletekeyword" kid="${keyword.id}" keyword="${keyword.keywords}">删除</a>
			</td>
		</tr>
		</c:forEach>
	</c:if>
</tbody>
</table>

<div class="pagination pagination-centered">
		<li><a href="/searchKeyword?pageIndex=1&keywords=${keywords}">首页</a></li>
		<li><a href="/searchKeyword?pageIndex=${pageIndex-1}&keywords=${keywords}">上一页</a></li>
		<li><a href="/searchKeyword?pageIndex=${pageIndex+1}&keywords=${keywords}">下一页</a></li>
		<li><a href="/searchKeyword?pageIndex=${pageFactory.pageCount}&keywords=${keywords}">末页</a></li>
	    <li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
</div>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/keywordmanage.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/keywordmanage.js" charset="UTF-8"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>