$().ready(function(){
	userid = -1;
	userName = '';
	mover(1);
	$("#searchUerText").keyup(function(){
		loadCustoms();
	});
	$("#searchUerText").click(function(){
		loadCustoms();
	});
	$("#keyword").blur(function(){
		var keyword = $("#keyword");
		var serviceType = $("#servicetype").val();
		var years = $("#serviceyears").val();
		if(keyword.val() == '' || keyword.val().length <= 0){
			$("#keywordtip").html("<font color=\"red\">对不起，您申请的关键词不能为空，请重新填写。</font>");
		}else{
			$("#keywordtip").html("<font color=\"green\">正在验证关键字是否已被抢占。</font>");
			$.post('valikeyword',{'keywords':keyword.val()},function(result){
				if('success' == result){
					
					$("#keywordtip").html("<font color=\"green\">恭喜你，【"+keyword.val()+"】可以被注册，请抓紧时间抢注。</font>");
				}else{
					$("#keywordtip").html("<font color=\"red\">对不起，您申请的关键词"+keyword.val()+"已经被抢注。</font>");
				}
			},'html');
		}
	});
	
	$("#submitkeyword").click(function(){
		var serviceType = $("#servicetype").val();
		var years = $("#serviceyears").val();
		if(userid <= 0){
			humane.error("对不起，您还没有选择客户，请选择");
			$("#searchUerText").focus();
		}else if($("#keyword").val() == '' || $("#keyword").val().length <= 0){
			$("#keywordtip").html("<font color=\"red\">对不起，您申请的关键词不能为空，请重新填写。</font>");
			$("#keyword").focus();
		}else if(serviceType == 0){
			humane.error("对不起，您还没有选择服务类型。");
			$("#servicetype").focus();
		}else if(years == 0){
			humane.error("对不起，您还没有选择服务年限。");
			$("#serviceyears").focus();
		}
		else{
			$.post('valikeyword',{'keywords':$("#keyword").val()},function(result){
				if('success' == result){
					var keyword = $("#keyword").val();
					$.post('submitkeyword',{'serviceType':serviceType,'years':years},function(result){
						if("exception" == result){
							humane.error("对不起，您提交的关键词出现异常，没有成功，请重试。");
						}else if("nomoney" == result){
							humane.error("对不起，您当前的余额不能支付本次申请，请充值后再进行申请。");
						}else{

							$.post('addKeywords',{'count':result,'serviceType':serviceType,'years':years,'keywords':keyword,'customid':userid,'customname':userName},function(result2){
								if(result2 != 'failed'){
									$('#accountspan').html(result2);
									alert("恭喜您，您提交的关键词【"+keyword+"】申请成功。");


								}
							},'html');
						}
					},'html');
				}else{
					$("#keywordtip").html("<font color=\"red\">对不起，您申请的关键词"+$("#keyword").val()+"已经被抢注。</font>");
				}
			},'html');
		}
	});
	
	$("#servicetype").change(function(){
		jisuan();
	});
	$("#serviceyears").change(function(){
		jisuan();
	});
	
});
function jisuan(){
	var serviceType = $("#servicetype").val();
	var years = $("#serviceyears").val();
	if(serviceType == 0){
		humane.error("对不起，您还没有选择服务类型。");
		$("#servicetype").focus();
	}else if(years == 0){
		humane.error("对不起，您还没有选择服务年限。");
		$("#serviceyears").focus();
	}else{
		$.post('jisuan',{'serviceType':serviceType,'years':years},function(result){
			if("exception" == result){
				humane.error("对不起，您申请的关键词在计算价格的时候出现异常，请重试。");
			}else{
				$("#price").val(result);
			}
		},'html');
	}
}
function loadCustoms(){
	$.post("loadCustoms",{'custom.customName':$("#searchUerText").val()},function(result){
		//var json = result;
		var userList = "<ul>";
		for(var i=0;i< result.length;i++){
			userList = userList + 
			"<li onclick=\"confirmCustom("+result[i].id+",'"+result[i].customname+"');\"><span>客户类型："+result[i].customtype+"</span><br/><a>"+result[i].customname+"</a></li>";
		}
		userlist = userList +"</ul>";
		$("#serachresult").html(userList);
		$("#serachresult").slideDown(500);
		
	},'json');
}
function confirmCustom(uid,ucode){
	userid = uid;
	userName = ucode;
	$("#searchUerText").val(ucode);
	$("#serachresult").html("");
	$("#serachresult").hide();
	$("#customname").val(ucode);
}