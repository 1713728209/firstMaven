<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/report">报表管理</a> \ <a href="/report">报表管理</a>
</div>
<div class="container">


<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/report" method="post" onsubmit="return searchReportFunc();">
		
		操作类型：
		<select name="reportType" id="reporttype">
		<option value="999" style="background: #333333;padding:3px;color:#fff;">财务报表</option>
		<option value="1" <c:if test="reportType == 1">selected="selected"</c:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;代理商账户余额报表</option>
		<option value="2" <c:if test="reportType == 2">selected="selected"</c:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;预付款流水报表</option>
		<option value="3" <c:if test="reportType == 3">selected="selected"</c:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;代理商流水报表</option>
		<option value="998" style="background: #333333;padding:3px;color:#fff;">产品报表</option>
		<option value="4" <c:if test="reportType == 4">selected="selected"</c:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;产品分类数量/金额汇总</option>
		<option value="997" style="background: #333333;padding:3px;color:#fff;">消费报表</option>
		<option value="6" <c:if test="reportType == 5">selected="selected"</c:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;客户消费汇总(暂无)</option>
		</select>
		<div id="opertime" style="margin-top:-20px; margin-left:280px;">
		操作时间：
		<input class="Wdate" size="15" name="startTime" id="starttime" value="<fmt:formatDate value='${starttime}' pattern='yyyy-MM-dd'/>"  type="date" pattern="yyyy-MM-dd" onClick="WdatePicker()" />
		至
		<input class="Wdate" size="15" name="endTime" id="endtime" value="<fmt:formatDate value='${endTime}' pattern='yyyy-MM-dd'/>" type="date" pattern="yyyy-MM-dd" onClick="WdatePicker()" />
		</div>
		<div style="margin-top:-20px; margin-left:580px;">
		<input type="submit" value="查询"/>
		</div>
		</form>
		</li>
	</ul>
</div>
<div class="downloadfile">
<ul>
	<li><img src="${pageContext.request.contextPath }/imgs/pdf.png" /><a href="reportaccount.action">PDF下载</a></li>
	<li><img src="${pageContext.request.contextPath }/imgs/excel.png" /><a href="reportaccounte.action">Excel下载</a></li>
</ul>
</div>
<h1>代理商余额报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>账户余额</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${firstList}" varStatus="adIndex" var="first">
		<tr>
			<td>${first.id}</td>
			<td>${first.username}</td>
			<td>￥${first.money}</td>
		</tr>
		</c:forEach>
</tbody>
</table>
<div class="downloadfile">
<ul>
	<li><img src="${pageContext.request.contextPath }/imgs/pdf.png" /><a href="reportYfkpdf.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="${pageContext.request.contextPath }/imgs/excel.png" /><a href="reportYfke.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">Excel下载</a></li>
</ul>
</div>
<h1>预付款流水报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>预付款</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>时间</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${secondList}" var="second">
		<tr>
			<td>${second.id}</td>
			<td>${second.username}</td>
			<td>${second.money}</td>
			<td>${second.accountmoney}</td>
			<td>${second.memo}</td>
			<td><fmt:formatDate value='${second.detaildatetime}' pattern="yyyy-MM-dd HH:ss:mm"/></td>
		</tr>
		</c:forEach>
</tbody>
</table>
<div class="downloadfile">
<ul>
	<li><img src="${pageContext.request.contextPath }/imgs/pdf.png" /><a href="reportdlspdf.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="${pageContext.request.contextPath }/imgs/excel.png" /><a href="reportdlse.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">Excel下载</a></li>
</ul>
</div>
<h1>代理商流水报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>预付款</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>时间</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${thirdList}" var="third">
		<tr>
			<td>${third.id}</td>
			<td>${third.username}</td>
			<td>${third.money}</td>
			<td>${third.accountmoney}</td>
			<td>${third.memo}</td>
			<td><fmt:formatDate value='${third.detaildatetime}' pattern="yyyy-MM-dd HH:ss:mm"/></td>
		</tr>
		</c:forEach>
</tbody>
</table>
<div class="downloadfile">
<ul>
<!-- 
	<li><img src="/imgs/pdf.png" /><a href="/reportppdf.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="/imgs/excel.png" /><a href="/reportppe.action?startTime=<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>&endTime=<fmt:formatDate value="${endTime}"  pattern="yyyy-MM-dd"/>">Excel下载</a></li>
 -->
</ul>
</div>
<h1>产品分类数量/金额汇总</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>产品分类名称</th>
		  <th>数量</th>
		  <th>价格</th>
	  </tr>
  </thead>   
  <tbody>
		<c:forEach items="${fouthList}" var="fouth">
		<tr>
			<td>${fouth.id}</td>
			<td>${fouth.configtypename}</td>
			<td></td>
			<td>${fouth.money}</td>
		</tr>
		</c:forEach>
</tbody>
</table>
<!--
 <table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>账务类型</th>
		  <th>账务资金</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>明细时间</th>                                          
	  </tr>
  </thead>   
  <tbody>
</tbody>
</table>

<div class="pagination pagination-centered">
						  <ul>
						  </ul>
						</div>
						-->
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/report.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/report.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/medire/WdatePicker.js"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>