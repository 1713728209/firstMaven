<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">代理商管理</a> \ <a href="/customlist">代理商客户管理</a> \ <a href="/pages/addcustom.jsp">添加客户信息</a>
</div>
<div class="container">
<form id="cform" action="addsavecustom" method="post">
	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：
			<input type="text" name="customname" id="custom_name"/> <span style="color:red;">*</span></li>
			<li>企业类型：
        	 	<select id="selectcustomtype" name="customtype">
        	 		<option value="" selected="selected">--请选择--</option>
					<option value="企业" >企业</option>
					<option value="个人" >个人</option>
					<option value="政府">政府</option>
	      		</select> <span style="color:red;">*</span></li>
			<li>企业主页：<input type="text" name="siteurl" /></li>
			<li>状态：<select name="customstatus">
	      			<option value="1" selected="selected">启用</option>
	      			<option value="2">停用</option>
	      		 </select> <span style="color:red;">*</span></li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：<input type="text" name="bossname"/></li>
			<li>注册日期：<input class="Wdate" id="regdate" size="15" name="regdatetime" type="date" pattern="yyyy-MM-dd HH:mm:ss" onClick="WdatePicker()" /></li>
			<li>证件类型：
			<select id="selectcardtype" name="cardtype">
        	 		<option value="0" selected="selected">--请选择--</option>
					<option value="国内身份证" >国内身份证</option>
					<option value="境外身份证" >境外身份证</option>
					<option value="营业执照" >营业执照</option>
					<option value="其他证件">其他证件</option>
	      		</select></li>
			<li>证件号码：<input id="card_num" type="text" name="cardnum"/></li>
			<li>国家：<input type="text" name="country" value="中国" /></li>
			<li>省/地区：<select id="selectprovince" name="provinceid">
        	 		<option value="0" selected="selected">--请选择--</option>
				<c:forEach items="${provinceList}" var="province">
					<c:if test="${custom.provinceid==province.id}">
						<option value="${province.provinceid}" selected="selected">${province.province}</option>
					</c:if>
					<c:if test="${custom.provinceid!=province.id}">
						<option value="${province.provinceid}">${province.province}</option>
					</c:if>
				</c:forEach>
	      		</select>
			</li>
			<li>公司传真：<input type="text" name="custom.companyFax"/></li>
			<li>城市：
			<select id="selectcity" name="cityid">
        	 		<option value="0" selected="selected">--请选择--</option>
	      		</select>
			</li>
			<li>公司电话：<input type="text" name="companytel"/></li>
			<li>区：
			<select id="selectarea" name="areaid">
        	 		<option value="0" selected="selected">--请选择--</option>
	      		</select>
			<li>公司地址：<input type="text" name="companyaddress"/></li>
		</ul>
		<div class="clear"></div>
		<div>
		备注：<textarea rows="2" cols="50" name="memo"></textarea>
		</div>
	</div>
	<div class="subtitle"> 
	<a href="javascript:void(0);" id="addcontact">添加一个联系人</a>
          <s:if test="contactList == null"><input type="hidden" id="c_count" value="0"/></s:if>
          <s:else><input type="hidden" id="c_count" value="<s:property value="contactList.size()"/>"/></s:else></div>
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
            </tbody>
          </table>    
	</div>
	<div class="goback">
		<input type="button" value="保存" onclick="checksave();"/>
		<input type="button" onclick="window.history.back(-1);" value="返回" />
	</div>


</form>
	
</div>
<link id='theme' rel='stylesheet' href='${pageContext.request.contextPath }/css/addcustom.css'/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/addcustom.js" charset="UTF-8"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/medire/WdatePicker.js"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
