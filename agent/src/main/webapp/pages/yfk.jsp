<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/yfk">代理商预付款</a>
</div>
<div class="container">


<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/yfk" method="get" onsubmit="return searchyfklistFunc();">
		操作类型：
		<select name="detailtype">
		<option value="" >---请选择---</option>
			<c:forEach items="${list}" var="config">
				<option value="${config.id}" <c:if test="${detailtype==config.id}">selected='selected'</c:if> >
						${config.configtypename}
				</option>
			</c:forEach>
		</select>
		操作时间：
		<input class="Wdate" size="15" name="starttime" value="${starttime}" id="starttime" type="date" pattern="yyyy-MM-dd" onClick="WdatePicker()" />
		至
		<input class="Wdate" size="15" name="endtime"  value="${endtime}" id="endtime" type="date" pattern="yyyy-MM-dd"  onClick="WdatePicker()" />
		
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>


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
		<c:forEach items="${detaillist}" varStatus="adIndex" var="accountDetail">
		<tr>
			<td>${accountDetail.id}</td>
			<td>${accountDetail.detailtypename}</td>
			<td>￥${accountDetail.money}</td>
			<td>￥${accountDetail.accountmoney}</td>
			<td>${accountDetail.memo}</td>
			<td class="center"><fmt:formatDate value='${accountDetail.detaildatetime}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		</c:forEach>
</tbody>
</table>

<div class="pagination pagination-centered">
	<ul>
			<li><a href="/yfk?pageIndex=1&detailtype=${detailtype}&starttime=${starttime}&endtime=${endtime}&userId=${userId}">首页</a></li>
			<li><a href="/yfk?pageIndex=${pageIndex-1}&detailtype=${detailtype}&starttime=${starttime}&endtime=${endtime}&userId=${userId}">上一页</a></li>
			<li><a href="/yfk?pageIndex=${pageIndex+1}&detailtype=${detailtype}&starttime=${starttime}&endtime=${endtime}&userId=${userId}">下一页</a></li>
			<li><a href="/yfk?pageIndex=${pageFactory.pageCount}&detailtype=${detailtype}&starttime=${starttime}&endtime=${endtime}&userId=${userId}">末页</a></li>
			<li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
	</ul>
</div>
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/yfk.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/medire/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/yfk.js"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>