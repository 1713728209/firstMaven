contactcount = 0;
$(document).ready(function(){
	contactcount = eval($("#c_count").val());
	
	$("#selectcardtype").change(function(){
		$("#cardtypename").val($("#selectcardtype").find("option:selected").text()) ;
	});
	
	$("#selectcustomtype").change(function(){
		$("#customtypename").val($("#selectcustomtype").find("option:selected").text()) ;
	});
	
	$("#selectprovince").change(function(){
		$("#selectcity").empty();
		$("#selectcity").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		$("#selectarea").empty();
		$("#selectarea").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		var s_province = $("#selectprovince").val();
		$.post("/loadcity",{'provinceId':s_province},function(result){
			if(result != ""){
				for(var i=0;i<result.length;i++){
					$("#selectcity").append("<option value=\""+result[i].cityid+"\">"+result[i].cityname+"</option>");
				}
			}else{
				alert("城市加载失败！");
			}
		},'json');	
	});
	
	$("#selectcity").change(function(){
		$("#selectarea").empty();
		$("#selectarea").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		var s_city = $("#selectcity").val();
		$.post("/loadarea",{'cityId':s_city},function(result){
			if(result != ""){
				for(var i=0;i<result.length;i++){
					$("#selectarea").append("<option value=\""+result[i].areaid+"\">"+result[i].areaname+"</option>");
				}
			}else{
				alert("区域加载失败！");
			}
		},'json');
	});
	
	$("#addcontact").click(function(){
		var str = $("<tr><td><input type='text' style='width:130px;' name='contactList["+contactcount+"].contactname'/><span style='color:red;'>*</span></td>"+
					"<td><input type='text' style='width:130px;' name='contactList["+contactcount+"].contacttel'/><span style='color:red;'>*</span></td>"+
					"<td><input type='text' style='width:130px;' name='contactList["+contactcount+"].contactfax'/></td>"+
					"<td><input type='text' style='width:130px;' name='contactList["+contactcount+"].contactemail'/></td>"+
					"<td><input type='text' style='width:130px;' name='contactList["+contactcount+"].contactrole'/></td>"+
					"<td style='width:100px;' onClick='getDel(this)'><a href='#'>删除</a></td></tr>");
		$("#addtr").append(str);
		contactcount = contactcount + 1;
	});
});
	function checksave(){
		var id = $.trim($("#id").val());
		var custom_name = $.trim($("#custom_name").val());
		var customtypename = $("#customtypename").val();
		$.post("isExitCustomName",{'customName':custom_name},function(result){
			if(result == "peat"){
				alert("对不起，该企业名称已存在。");
			}else if(result == "nopeat"){
				if(custom_name != null && custom_name != "" && customtypename != null && customtypename != "" && customtypename != "--请选择--"){
					var f = $("#cform");
					f.submit();
				}else{
					if(custom_name == null || custom_name == ""){
						alert("企业名称不能为空！");
					}
					if(customtypename == null || customtypename == "" || customtypename == "--请选择--"){
						alert("请选择企业类型！");
					}
				}
			}
		},'html');
	}	

	function getDel(k){  
	   $(k).parent().remove();   
	   contactcount = contactcount - 1;
    } 