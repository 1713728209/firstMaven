<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">系统管理</a> \ <a href="/keywordsList?opt=check">关键词审核</a>
</div>
<div class="container">

<h2>关键词审核</h2>

<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/keywordsList?opt=check" method="get">
		关键词：<input type="text" value="${keywords}" name="keywords"/>
		<input type="submit" value="查询"/> 
		<span class="okflow">审核流程：已申请（代理商申请） 》 审核中 》 通过 》 续费 </span> | 
		<span class="noflow">审核流程：已申请（代理商申请） 》 审核中 》 不通过</span>
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
		  <th>操作</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${list}" varStatus="adIndex" var="keyword">
		<tr class="tabletr">
			<td>${keyword.id}</td>
			<td>${keyword.keywords}</td>
			<td>${keyword.customname}</td>
			<td>${keyword.agentname}</td>
			<td>${keyword.serviceyears}</td>
			<td><fmt:formatDate value='${keyword.regdatetime}' pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value='${keyword.regpassdatetime}'  pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>
				<c:if test="${keyword.ispass==1}">
					<font color="green">未过期</font>
				</c:if>
				<c:if test="${keyword.ispass==2}">
					<font color="green">预注册过期</font>
				</c:if>
				<c:if test="${keyword.ispass==3}">
					<font color="green">过期</font>
				</c:if>
			</td>
			<td>
			<c:if test="${keyword.checkstatus==1}">
					<font color="green">已申请</font>
			</c:if>
				<c:if test="${keyword.checkstatus==2}">
					<font color="green">审核中</font>
				</c:if>
				<c:if test="${keyword.checkstatus==3}">
					<font color="green">已通过</font>
				</c:if>
				<c:if test="${keyword.checkstatus==4}">
					<font color="green">未通过</font>
				</c:if>
			</td>
			<td>
				<c:if test="${keyword.isuse==1}">
					<font color="green">未使用</font>
				</c:if>
				<c:if test="${keyword.isuse==2}">
					<font color="green">已使用</font>
				</c:if>
			</td>
			<td>
				<select class="checkselect" kid="${keyword.id}" keyword="${keyword.keywords}">
					<option value="0">--请选择--</option>
					<c:if test="${keyword.checkstatus == 1 && keyword.isuse == 1}">
						<option value="2">审核中</option>
					</c:if>
					<c:if test="${keyword.checkstatus == 2 && keyword.isuse == 1}">
						<option value="3">审核通过</option>
						<option value="4">不通过</option>
					</c:if>
					<c:if test="${keyword.checkstatus == 3 && keyword.isuse == 2}">
						<option value="5">续费</option>
					</c:if>
					<c:if test="${keyword.isuse == 2}">
						<option value="6">不使用</option>
					</c:if>
					<c:if test="${keyword.isuse==1}">
						<option value="7">使用</option>
					</c:if>
				</select>
			</td>
		</tr>
		</c:forEach>
</tbody>
</table>

<div class="pagination pagination-centered">
	<ul>
		<li><a href="/keywordsList?pageIndex=1&opt=check&keywords=${keywords}">首页</a></li>
		<li><a href="/keywordsList?pageIndex=${pageIndex-1}&opt=check&keywords=${keywords}">上一页</a></li>
		<li><a href="/keywordsList?pageIndex=${pageIndex+1}&opt=check&keywords=${keywords}">下一页</a></li>
		<li><a href="/keywordsList?pageIndex=${pageFactory.pageCount}&opt=check&keywords=${keywords}">末页</a></li>
		<li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
	</ul>
</div>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/checkkeyword.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkkeyword.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>