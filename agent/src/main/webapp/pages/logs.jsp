<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/findAsLogsList">查看操作日志</a>
</div>
<div class="container">
<!-- 
private Integer detailType;
	private String  detailTypeName;
	private BigDecimal money;
	private BigDecimal accountMoney;
	private String memo;
	private Date detailDateTime;
 -->
 <table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>用户名称</th>
		  <th>操作信息</th>
		  <th>操作时间</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${list}" varStatus="adIndex" var="logs">
		<tr>
		<td>${logs.id}</td>
			<td>${logs.username}</td>
			<td>${logs.operateinfo}</td>
			<td class="center"><fmt:formatDate value='${logs.operatedatetime}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		</c:forEach>
</tbody>
</table>

<div class="pagination pagination-centered">
	<ul>
		<li><a href="/findAsLogsList?pageIndex=1&userId=${userId}">首页</a></li>
		<li><a href="/findAsLogsList?pageIndex=${pageIndex-1}&userId=${userId}">上一页</a></li>
		<li><a href="/findAsLogsList?pageIndex=${pageIndex+1}&userId=${userId}">下一页</a></li>
		<li><a href="/findAsLogsList?pageIndex=${pageFactory.pageCount}&userId=${userId}">末页</a></li>
		<li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
	</ul>
</div>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/logs.css'/>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>