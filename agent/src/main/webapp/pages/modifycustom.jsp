<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/customlist">代理商客户管理</a> \ <a href="/getCustomById?id=${custom.id}&opt=update">修改客户信息</a>
</div>
<div class="container">
<form id="cform" action="modifysavecustom" method="post">
	<input type="hidden" id="id" name="id" value="${custom.id}"/>
	<input type="hidden" name="cname" value="${cname}"/>
	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：
			<input type="text" id="custom_name" name="customname" value="${custom.customname}" /> <span style="color:red;">*</span></li>
			<li>企业类型：
				<%--<input id="customtypename" type="hidden" name="customtype" value="${custom.customtype}"/>--%>
			    <select id="customtypename" name="customtype">
        	 		<option value="">--请选择--</option>
					<c:if test="${custom.customtype=='企业'}">
						<option value="企业" selected="selected">企业</option>
					</c:if>
					<c:if test="${custom.customtype=='个人'}">
						<option value="个人" selected="selected">个人</option>
					</c:if>
					<c:if test="${custom.customtype=='政府'}">
						<option value="政府" selected="selected">政府</option>
					</c:if>
	      		</select> <span style="color:red;">*</span></li>
			<li>企业主页：<input type="text" name="siteurl" value="${custom.siteurl}" /></li>
			<li>状态：<select name="customStatus" >
	        	 	  <c:if test="${custom.customstatus == 1}">
	        	 	  	<option value="1" selected="selected">启用</option>
	        	 	  	<option value="2">停用</option>
	        	 	  </c:if>
				<c:if test="${custom.customstatus == 2}">
					<option value="1">启用</option>
					<option value="2" selected="selected">停用</option>
				</c:if>
	      		 </select> <span style="color:red;">*</span></li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：<input type="text" name="custom.bossName" value="${custom.bossname}" /></li>
			<li>注册日期：<input class="Wdate" id="regdate" size="15" name="regdatetime2" value="<fmt:formatDate value="${custom.regdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" readonly="readonly"  type="text" onClick="WdatePicker()" /></li>
			<li>证件类型：
			     <select id="selectcardtype" name="cardtype" >
        	 		<option value="0" selected="selected">--请选择--</option>
					 <c:if test="${custom.cardtype=='国内身份证'}">
						 <option value="国内身份证" selected="selected">国内身份证</option>
					 </c:if>
					 <c:if test="${custom.cardtype=='境外身份证'}">
						 <option value="境外身份证" selected="selected">境外身份证</option>
					 </c:if>
					 <c:if test="${custom.cardtype=='营业执照'}">
						 <option value="营业执照" selected="selected">营业执照</option>
					 </c:if>
					 <c:if test="${custom.cardtype=='其他证件'}">
						 <option value="其他证件" selected="selected">其他证件</option>
					 </c:if>
	      		</select></li>
			<li>证件号码：<input type="text" name="cardnum" value="${custom.cardnum}" /></li>
			<li>国家：<input type="text" name="country" value="" /></li>
			<li>省/地区：<select id="selectprovince" name="provinceid" >
					<option value="" selected="selected">--请选择--</option>
        	 		 <c:forEach items="${provinceList}" var="province">
		        	 	  <c:if test="${custom.provinceid==province.provinceid}">
		        	 	    <option value="${province.provinceid}" selected="selected">${province.province}</option>
		        	 	  </c:if>
						 <c:if test="${custom.provinceid!=province.provinceid}">
							 <option value="${province.provinceid}">${province.province}</option>
						 </c:if>
					  </c:forEach>
	      		 </select>
			</li>
			<li>公司传真：<input type="text" name="companyfax" value="${custom.companyfax}"/></li>
			<li>城市：
			<select id="selectcity" name="cityid" >
					<option value="" selected="selected">--请选择--</option>
        	 		 <c:forEach items="${sessionScope.cityList}" var="city">
		        	 	  <c:if test="${custom.cityid==city.cityid}">
		        	 	    <option value="${city.cityid}" selected="selected">${city.cityname}</option>
		        	 	  </c:if>
						 <c:if test="${custom.cityid!=city.cityid}">
							 <option value="${city.cityid}">${city.cityname}</option>
						 </c:if>
					  </c:forEach>
	      		 </select>
			</li>
			<li>公司电话：<input type="text" name="companytel" value="${custom.companytel}"/></li>
			<li>区：
			<select id="selectarea" name="areaid" >
					<option value="" selected="selected">--请选择--</option>
        	 		 <c:forEach items="${areaList}" var="area">
		        	 	  <c:if test="${custom.areaid==area.areaid}">
		        	 	    <option value="${area.areaid}" selected="selected">${area.areaname}</option>
		        	 	  </c:if>
						 <c:if test="${custom.areaid!=area.areaid}">
							 <option value="${area.areaid}">${area.areaname}</option>
						 </c:if>
					  </c:forEach>
	      		 </select>
			<li>公司地址：<input type="text" name="companyaddress" value="${custom.companyaddress}" /></li>
		</ul>
		<div class="clear"></div>
		<div>
		备注：<textarea rows="2" cols="50" name="memo">${custom.memo}</textarea>
		</div>
	</div>
	<div class="subtitle"> 
		  <a href="javascript:void(0);" id="addcontact">添加一个联系人</a>
          <c:if test="contactList == null"><input type="hidden" id="c_count" value="0"/></c:if>
          <s:else>
			  <input type="hidden" id="c_count" value=""/></s:else>
	</div>
	<div class="info3">
		<table>
            <thead>
            <tr>
	     	<th>姓名</th>
	     	<th>电话</th>
	     	<th>传真</th>
	     	<th>邮箱</th>
	     	<th>职务</th>
	     	<th>操作</th>
  			</tr>                                                                          
            </thead>
            <tbody id="addtr">
            	<c:forEach items="${contactsList}" var="contact" varStatus="sta">
            		<tr>
            		<td><input type="text" name="${contactsList[sta.index].contactname}" value="${contact.contactname}"/><span style="color:red;">*</span></td>
					<td><input type="text" name="${contactsList[sta.index].contacttel}" value="${contact.contacttel}"/><span style="color:red;">*</span></td>
					<td><input type="text" name="${contactsList[sta.index].contactfax}" value="${contact.contactfax}"/></td>
					<td><input type="text" name="${contactsList[sta.index].contactemail}" value="${contact.contactemail}"/></td>
					<td><input type="text" name="${contactsList[sta.index].contactrole}" value="${contact.contactrole}"/></td>
					<td onclick="getDel(this)"><a href='javascript:void(0);'>删除</a></td>
					</tr>
            	</c:forEach>
            </tbody>
          </table>    
	</div>
	<div class="goback">
		<input type="button" value="保存" onclick="checksave();"/>
		<input type="button" onclick="window.history.back(-1);" value="返回" />
	</div>


</form>


</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/modifycustom.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/modifycustom.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
