<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">系统管理</a> \ <a href="/userlist">用户管理</a>
</div>
<div class="container">
<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/userlist" method="get">
		用户名称:
		<input type="text" id="uname" name="username" value="${username}"/>
		角色：
		<select name="roleid">
 			<option value="" selected="selected">--请选择--</option>
 				<c:forEach items="${roleList}" var="role">
 					<option <c:if test="${roleid==role.id}">selected = "selected"</c:if> value="${role.id}">
							${role.rolename}
					</option>
 				</c:forEach>
 		</select>
 		是否启用：
		<select name="isstart">
		<option value="" selected="selected">--请选择--</option>
 			<c:if test="${isstart == 1}">
			<option value="1" selected="selected">启用</option>
			<option value="2">未启用</option>
		</c:if>
 			<c:if test="${isstart == 2}">
 				<option value="2" selected="selected">未启用</option>
 				<option value="1">启用</option>
 			</c:if>
 			<c:if test="${empty isstart}">
	 			<option value="2">未启用</option>
	 			<option value="1">启用</option>
 			</c:if>
 		</select>
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>
	<div id="addUserDiv" class="addUserDivClass addback">
 		<ul>
 			<li class="lititle">
      				<b>添加代理商用户信息</b>
      			</li>
 			<li>登录账号：<input id="a_userCode" type="text" name="usercode" /> <span>*</span></li>
 			<li>用户名称：<input id="a_userName" type="text" name="username"/> <span>*</span></li>
 			<li>登录密码：<input id="a_userPassword" type="password" name="userpassword" value="123456"/> <span>*默认初始密码123456</span></li>
 			<li>角&nbsp;&nbsp;&nbsp;&nbsp;色：
 			<select id="a_roleId" name="roleid">
 				<option value="0" selected="selected">--请选择--</option>
 					<c:forEach items="${roleList}" var="role">
 						<option value="${role.id}">${role.rolename}</option>
 					</c:forEach>
 			</select> <span>*</span>
 			</li>
 			<li>是否启用：
 			<select id="a_isStart" name="isstart">
 				<option value="1" selected="selected">启用</option>
 				<option value="2">不启用</option>
 			</select> <span>*</span>
 			<input id="addUserSubmit" type="button" value="保存"/> <input id="addcancel" type="reset" value="取消"/></li>
 		</ul>
	</div>
	  <div id="modifyUserDiv" class="addUserDivClass modifyback">
      		<ul>
      			<li class="lititle">
      				<input id="m_userId" type="hidden" name="id"/>
      				<b>修改代理商用户信息</b>
      			</li>
      			<li>登录账号：<input id="m_userCode"  type="text" name="usercode" /> <span>*</span></li>
      			<li>用户名称：<input id="m_userName"  type="text" name="username" /> <span>*</span></li>
      			<li>登录密码：<input id="m_userPassword"  type="password" name="userpassword" /> <span>*</span></li>
      			<li>角&nbsp;&nbsp;&nbsp;&nbsp;色：
      			<span id=m_SelectRole></span> <span>*</span>
      			</li>
      			<li>是否启用：
      			<span id="m_Select"></span> <span>*</span>
      			<input id="modifyUserSubmit" type="submit" value="保存"/> <input id="modifycancel" type="button" value="取消"/></li>
      		</ul>
      	</div>
      	
      	<div class="addUserDiv"><input id="addUser" type="button" value="新增" /></div>
      	
        <table>
          <thead>
            <tr>
		     	<th>登录账号</th>
		     	<th>用户名称</th>
		     	<th>角色</th>
		     	<th>创建时间</th>
		     	<th>是否启用</th>
		     	<th colspan="3">操作</th>
  			</tr>
          </thead>
          <tbody>
            <c:forEach items="${list}" varStatus="sta" var="user">
            	<tr>
                    <td>${user.usercode}</td>
                    <td>${user.username}</td>
                    <td>${user.rolename}</td>
                    <td><fmt:formatDate value="${user.creationtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                    <c:if test="${user.isstart == 1}">启用</c:if>
					<c:if test="${user.isstart == 2}">未启用</c:if>
                    </td>
                    <td colspan="3">
						<span class="modifyUser" userid="${user.id}" usercode="${user.usercode}" username="${user.username}"  userpassword="${user.userpassword}" isstart="${user.isstart}" roleid="${user.roleid}" rolename="${user.rolename}"><a>修改</a></span> |
						<span class="deleteUser" usercode="${user.usercode}"  userid="${user.id}" currentUserRoleId="${user.roleid}" roleid="${user.roleid}"><a>删除</a></span>  |
						<a href="javascript:ymPrompt.win('/yfk?userId=${user.id}',1000,500,' 预付款',null,null,null,true);">预付款</a> |
						<a href="javascript:ymPrompt.win('/findAsLogsList?userId=${user.id}',1015,540,' LOG日志',null,null,null,true);">LOG日志</a>
					</td>
                    <!--  
                    <td>
                    	<ul>
                     		<li><a class="modifyUser" userid="<s:property value="#user.id"/>" usercode="<s:property value="#user.userCode"/>" username="<s:property value="#user.userName"/>"  userpassword="<s:property value="#user.userPassword"/>" isstart="<s:property value="#user.isStart"/>" roleid="<s:property value="#user.roleId"/>" rolename="<s:property value="#user.roleName"/>">修改</a></li>
                     		<li><a class="deleteUser" usercode="<s:property value="#user.userCode"/>"  userid="<s:property value="#user.id"/>">删除</a></li>
							<li><a href="javascript:ymPrompt.win('/yfklist.action?user.id=<s:property value='#user.id'/>&user.userCode=<s:property value='#user.userCode'/>',800,500,' 预付款',null,null,null,true);">预付款</a></li>
                     	</ul>
					</td>
					-->
                 </tr>   
              </c:forEach>
           </tbody>
         </table>
              
   <div class="pagination pagination-centered">
	  <ul>
		  <li><a href="/userlist?pageIndex=1&username=${username}&roleid=${roleid}&isstart=${isstart}">首页</a></li>
		  <li><a href="/userlist?pageIndex=${pageIndex-1}&username=${username}&roleid=${roleid}&isstart=${isstart}">上一页</a></li>
		  <li><a href="/userlist?pageIndex=${pageIndex+1}&username=${username}&roleid=${roleid}&isstart=${isstart}">下一页</a></li>
		  <li><a href="/userlist?pageIndex=${pageFactory.pageCount}&username=${username}&roleid=${roleid}&isstart=${isstart}">末页</a></li>
		  <li><a>第${pageIndex}页/共${pageFactory.pageCount}页</a></li>
	  </ul>
  </div>
</div>

<script type="text/javascript">
	var roleListJson = [
			<c:forEach items="${roleList}" var="role">
			{"id":"${role.id}","roleName":"${role.rolename}"},
			</c:forEach>{"id":"over","rolename":"over"}];
</script>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/userlist.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
