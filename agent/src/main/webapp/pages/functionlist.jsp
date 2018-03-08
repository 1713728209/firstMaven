<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/iframehead.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="container">
	<h3>功能列表</h3>
	<div class="btndiv">
		<input type="hidden" id="roleid" value="${roleId}"/>
		<input id="saverolefunc" type="button" value="保存" />
		<input id="cancel" type="button" value="取消" />
	</div>
		
		<s:if test="funcList != null">
            <table>
            <thead>
            <tr>
	     	<th><input type="checkbox" id="cball"/>全选/全不选</th>
	     	<th>功能名称</th>
	     	<th>功能URL</th>
	     	<th>创建时间</th>
	     	<th>是否启用</th>
  			</tr>
            </thead>
            <tbody>
            <c:forEach items="${childFunctionList}" var="all">
            	<tr>
                    <td>
                    <input class="cb" type="checkbox" value="${all.id}"
                        <c:forEach items="${functionList}" var="permission">
                            <c:if test="${permission.id==all.id}">
                                checked="checked"
                            </c:if>
                        </c:forEach>
                    />
                    </td>
                    <td>${all.functionname}</td>
                    <td>${all.funcurl}</td>
                    <td><fmt:formatDate value="${all.creationtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                    <c:if test="${all.isstart == 1}">启用</c:if>
                        <c:if test="${all.isstart == 2}">未启用</c:if>
                    </td>
                 </tr>   
              </c:forEach>
              </tbody>
            </table>
       </s:if>
       
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/functionlist.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/functionlist.js" charset="UTF-8"></script> 
</body>
</html>
