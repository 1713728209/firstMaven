<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/customlist">代理商客户管理</a>
</div>
<div class="container">
	
		<form action="customlist" method="get" >
             <div>
	            <label>客户名称:</label>
	            <input type="text" id="cname" name="cname" value="${cname}"/>
	            <input type="submit" value="查询" /> 
              </div>
        </form>
        
        <div class="addCustomDiv">
        <input onclick="javascript:location.href='/pages/addcustom.jsp';" type="button" value="添加客户" />
        </div>
		<c:if test="${list != null}">
            <table>
            <thead>
            <tr>
	     	<th>序号</th>
	     	<th>客户名称</th>
	     	<th>法人代表</th>
	     	<th>注册时间</th>
	     	<th>类型</th>
	     	<th>状态</th>
	     	<th>操作</th>
  			</tr>
            </thead>
            <c:forEach items="${list}" varStatus="sta" var="custom">
            	<tr class="tabletr">
            		<td>${custom.id}</td>
                    <td>${custom.customname}</td>
                    <td>${custom.bossname}</td>
					<td><fmt:formatDate value="${custom.regdatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                    <td>${custom.customtype}</td>
                    <td>
                    <span id="m_status${sta.index+1}">
                    <c:if test="${custom.customstatus == 1}"><font color="green">启用</font></c:if>
                    <c:if test="${custom.customstatus == 2}"><font color="green">停用</font></c:if>
                    </span>
                    </td>
                    <td class="funcli">
                    	<ul>
                     		<li><a class="viewCustom" href="getCustomById?id=${custom.id}&opt=view">查看</a></li>
                     		<li><a class="modifyCustom" href="getCustomById?id=${custom.id}&opt=update" cname="">修改</a></li>
                     		<li>
                     		 <c:if test="${custom.customstatus==1}">
                     		 <a class="modifyCustomStatus" id="${custom.id}" mStatus="${sta.index+1}" customStatus="${custom.customstatus}" customName="${custom.customname}">
								 <font color="red">停用</font>
							 </a>
							</li>
                     		 </c:if>
							<c:if test="${custom.customstatus==2}">
							 <a class="modifyCustomStatus" id="${custom.id}"  mStatus="${sta.index+1}" customStatus="${custom.customstatus}" customName="${custom.customname}">
								 <font color="green">启用</font>
							 </a>
								 </li>
							</c:if>
                     		
                     	</ul>
					</td>
                 </tr>   
              </c:forEach>
              </table>
              <div class="pagination pagination-centered" style="padding-left: 200px">
				  <li><a href="/customlist?pageIndex=1&cname=${cname}">首页</a></li>
				  <li><a href="/customlist?pageIndex=${pageIndex-1}&cname=${cname}">上一页</a></li>
				  <li><a href="/customlist?pageIndex=${pageIndex+1}&cname=${cname}">下一页</a></li>
				  <li><a href="/customlist?pageIndex=${pageFactory.pageCount}&cname=${cname}">末页</a></li>
				  <li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
			  </div>
       </c:if>
	</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/customlist.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/customlist.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>

